// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'editable_box.dart';

/// Registry of all [RenderEditableProxyBox]es inside a [ZefyrEditableText].
///
/// Provides access to all currently active [RenderEditableProxyBox]
/// instances of a [ZefyrEditableText].
///
/// Use [boxForTextOffset] or [boxForGlobalPoint] to retrieve a
/// specific box.
///
/// The [addBox], [removeBox] and [markDirty] are intended to be
/// only used by [RenderEditableProxyBox] objects to register with a rendering
/// context.
///
/// ### Life cycle details
///
/// When a box object is attached to rendering pipeline it registers
/// itself with a render scope by calling [addBox]. At this point the context
/// treats this object as "dirty" and query methods like [boxForTextOffset]
/// still exclude this object from returned results.
///
/// When this box considers itself initialized it calls [markDirty] with
/// `isDirty` set to `false` which activates it. At this point query methods
/// include this object in results.
///
/// When a box is rebuilt it may deactivate itself by calling [markDirty]
/// again.
///
/// When a box is detached from rendering pipeline it unregisters
/// itself by calling [removeBox].
class ZefyrRenderContext extends ChangeNotifier {
  final Set<RenderEditableProxyBox> _dirtyBoxes = new Set();
  final Set<RenderEditableProxyBox> _activeBoxes = new Set();

  Set<RenderEditableProxyBox> get dirty => _dirtyBoxes;
  Set<RenderEditableProxyBox> get active => _activeBoxes;

  bool _disposed = false;

  /// Adds [box] to this context. The box is considered "dirty" at
  /// this point and is not included in query results of `boxFor*`
  /// methods.
  void addBox(RenderEditableProxyBox box) {
    assert(!_disposed);
    _dirtyBoxes.add(box);
  }

  /// Removes [box] from this render context.
  void removeBox(RenderEditableProxyBox box) {
    assert(!_disposed);
    _dirtyBoxes.remove(box);
    _activeBoxes.remove(box);
    notifyListeners();
  }

  void markDirty(RenderEditableProxyBox box, bool isDirty) {
    assert(!_disposed);

    var collection = isDirty ? _dirtyBoxes : _activeBoxes;
    if (collection.contains(box)) return;

    if (isDirty) {
      _activeBoxes.remove(box);
      _dirtyBoxes.add(box);
    } else {
      _dirtyBoxes.remove(box);
      _activeBoxes.add(box);
    }
    notifyListeners();
  }

  /// Returns box containing character at specified document [offset].
  RenderEditableProxyBox boxForTextOffset(int offset) {
    assert(!_disposed);
    return _activeBoxes.firstWhere(
      (p) => p.node.containsOffset(offset),
      orElse: _null,
    );
  }

  /// Returns box located at specified global [point] on the screen or
  /// `null`.
  RenderEditableProxyBox boxForGlobalPoint(Offset point) {
    assert(!_disposed);
    return _activeBoxes.firstWhere((p) {
      final localPoint = p.globalToLocal(point);
      return p.size.contains(localPoint);
    }, orElse: _null);
  }

  /// Returns closest render box to the specified global [point].
  ///
  /// If [point] is inside of one of active render boxes that box is returned.
  /// If no box found this method checks if [point] is to the left or to the right
  /// side of a box, e.g. if vertical offset of this point is inside of one of
  /// the active boxes. If it is then that box is returned. If not then this
  /// method picks a box with shortest vertical distance to this [point].
  RenderEditableProxyBox closestBoxForGlobalPoint(Offset point) {
    assert(!_disposed);
    if (_activeBoxes.isEmpty) return null;
    RenderEditableProxyBox box = boxForGlobalPoint(point);
    if (box != null) return box;

    box = _activeBoxes.firstWhere((p) {
      final localPoint = p.globalToLocal(point);
      return (localPoint.dy >= 0 && localPoint.dy < p.size.height);
    }, orElse: _null);
    if (box != null) return box;

    box = _activeBoxes.map((p) {
      final localPoint = p.globalToLocal(point);
      final distance = localPoint.dy - p.size.height;
      return new MapEntry(distance.abs(), p);
    }).reduce((a, b) {
      return (a.key <= b.key) ? a : b;
    }).value;

    return box;
  }

  static Null _null() => null;

  @override
  void dispose() {
    _disposed = true;
    _activeBoxes.clear();
    _dirtyBoxes.clear();
    super.dispose();
  }

  @override
  void notifyListeners() {
    /// Ensures listeners are not notified during rendering phase where they
    /// cannot react by updating their state or rebuilding.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_disposed) return;
      super.notifyListeners();
    });
  }
}
