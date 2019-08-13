// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/src/util.dart';

import 'package:flutter_web/painting.dart';
import 'package:flutter_web_ui/ui.dart';

/// Base class for [EdgeInsets] that allows for text-direction aware
/// resolution.
///
/// A property or argument of this type accepts classes created either with [new
/// EdgeInsets.fromLTRB] and its variants, or [new
/// EdgeInsetsDirectional.fromSTEB] and its variants.
///
/// To convert an [EdgeInsetsGeometry] object of indeterminate type into a
/// [EdgeInsets] object, call the [resolve] method.
///
/// See also:
///
///  * [Padding], a widget that describes margins using [EdgeInsetsGeometry].
abstract class EdgeInsetsGeometry {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const EdgeInsetsGeometry();

  double get bottom;
  double get end;
  double get left;
  double get right;
  double get start;
  double get top;

  /// Whether every dimension is non-negative.
  bool get isNonNegative {
    return left >= 0.0 &&
        right >= 0.0 &&
        start >= 0.0 &&
        end >= 0.0 &&
        top >= 0.0 &&
        bottom >= 0.0;
  }

  /// The total offset in the vertical direction.
  double get horizontal => left + right + start + end;

  /// The total offset in the horizontal direction.
  double get vertical => top + bottom;

  /// The total offset in the given direction.
  double along(Axis axis) {
    assert(axis != null);
    switch (axis) {
      case Axis.horizontal:
        return horizontal;
      case Axis.vertical:
        return vertical;
    }
    return null;
  }

  /// The size that this [EdgeInsets] would occupy with an empty interior.
  Size get collapsedSize => new Size(horizontal, vertical);

  /// An [EdgeInsetsGeometry] with top and bottom, left and right, and start and
  /// end flipped.
  EdgeInsetsGeometry get flipped =>
      new _MixedEdgeInsets.fromLRSETB(right, left, end, start, bottom, top);

  /// Returns a new size that is bigger than the given size by the amount of
  /// inset in the horizontal and vertical directions.
  ///
  /// See also:
  ///
  ///  * [EdgeInsets.inflateRect], to inflate a [Rect] rather than a [Size] (for
  ///    [EdgeInsetsDirectional], requires first calling [resolve] to establish
  ///    how the start and and map to the left or right).
  ///  * [deflateSize], to deflate a [Size] rather than inflating it.
  Size inflateSize(Size size) {
    return new Size(size.width + horizontal, size.height + vertical);
  }

  /// Returns a new size that is smaller than the given size by the amount of
  /// inset in the horizontal and vertical directions.
  ///
  /// If the argument is smaller than [collapsedSize], then the resulting size
  /// will have negative dimensions.
  ///
  /// See also:
  ///
  ///  * [EdgeInsets.deflateRect], to deflate a [Rect] rather than a [Size].
  ///    (for [EdgeInsetsDirectional], requires first calling [resolve] to
  ///    establish how the start and and map to the left or right).
  ///  * [inflateSize], to inflate a [Size] rather than deflating it.
  Size deflateSize(Size size) {
    return new Size(size.width - horizontal, size.height - vertical);
  }

  /// Returns the difference between two [EdgeInsetsGeometry] objects.
  ///
  /// If you know you are applying this to two [EdgeInsets] or two
  /// [EdgeInsetsDirectional] objects, consider using the binary infix `-`
  /// operator instead, which always returns an object of the same type as the
  /// operands, and is typed accordingly.
  ///
  /// If [subtract] is applied to two objects of the same type ([EdgeInsets] or
  /// [EdgeInsetsDirectional]), an object of that type will be returned (though
  /// this is not reflected in the type system). Otherwise, an object
  /// representing a combination of both is returned. That object can be turned
  /// into a concrete [EdgeInsets] using [resolve].
  ///
  /// This method returns the same result as [add] applied to the result of
  /// negating the argument (using the prefix unary `-` operator or multiplying
  /// the argument by -1.0 using the `*` operator).
  EdgeInsetsGeometry subtract(EdgeInsetsGeometry other) {
    return new _MixedEdgeInsets.fromLRSETB(
      left - other.left,
      right - other.right,
      start - other.start,
      end - other.end,
      top - other.top,
      bottom - other.bottom,
    );
  }

  /// Returns the sum of two [EdgeInsetsGeometry] objects.
  ///
  /// If you know you are adding two [EdgeInsets] or two [EdgeInsetsDirectional]
  /// objects, consider using the `+` operator instead, which always returns an
  /// object of the same type as the operands, and is typed accordingly.
  ///
  /// If [add] is applied to two objects of the same type ([EdgeInsets] or
  /// [EdgeInsetsDirectional]), an object of that type will be returned (though
  /// this is not reflected in the type system). Otherwise, an object
  /// representing a combination of both is returned. That object can be turned
  /// into a concrete [EdgeInsets] using [resolve].
  EdgeInsetsGeometry add(EdgeInsetsGeometry other) {
    return new _MixedEdgeInsets.fromLRSETB(
      left + other.left,
      right + other.right,
      start + other.start,
      end + other.end,
      top + other.top,
      bottom + other.bottom,
    );
  }

  /// Returns the [EdgeInsetsGeometry] object with each dimension negated.
  ///
  /// This is the same as multiplying the object by -1.0.
  ///
  /// This operator returns an object of the same type as the operand.
  EdgeInsetsGeometry operator -();

  /// Scales the [EdgeInsetsGeometry] object in each dimension by the given
  /// factor.
  ///
  /// This operator returns an object of the same type as the operand.
  EdgeInsetsGeometry operator *(double other);

  /// Divides the [EdgeInsetsGeometry] object in each dimension by the given
  /// factor.
  ///
  /// This operator returns an object of the same type as the operand.
  EdgeInsetsGeometry operator /(double other);

  /// Integer divides the [EdgeInsetsGeometry] object in each dimension by the
  /// given factor.
  ///
  /// This operator returns an object of the same type as the operand.
  ///
  /// This operator may have unexpected results when applied to a mixture of
  /// [EdgeInsets] and [EdgeInsetsDirectional] objects.
  EdgeInsetsGeometry operator ~/(double other);

  /// Computes the remainder in each dimension by the given factor.
  ///
  /// This operator returns an object of the same type as the operand.
  ///
  /// This operator may have unexpected results when applied to a mixture of
  /// [EdgeInsets] and [EdgeInsetsDirectional] objects.
  EdgeInsetsGeometry operator %(double other);

  /// Linearly interpolate between two [EdgeInsetsGeometry] objects.
  ///
  /// If either is null, this function interpolates from [EdgeInsets.zero], and
  /// the result is an object of the same type as the non-null argument.
  ///
  /// If [lerp] is applied to two objects of the same type ([EdgeInsets] or
  /// [EdgeInsetsDirectional]), an object of that type will be returned (though
  /// this is not reflected in the type system). Otherwise, an object
  /// representing a combination of both is returned. That object can be turned
  /// into a concrete [EdgeInsets] using [resolve].
  ///
  /// The `t` argument represents position on the timeline, with 0.0 meaning
  /// that the interpolation has not started, returning `a` (or something
  /// equivalent to `a`), 1.0 meaning that the interpolation has finished,
  /// returning `b` (or something equivalent to `b`), and values in between
  /// meaning that the interpolation is at the relevant point on the timeline
  /// between `a` and `b`. The interpolation can be extrapolated beyond 0.0 and
  /// 1.0, so negative values and values greater than 1.0 are valid (and can
  /// easily be generated by curves such as [Curves.elasticInOut]).
  ///
  /// Values for `t` are usually obtained from an [Animation<double>], such as
  /// an [AnimationController].
  static EdgeInsetsGeometry lerp(
      EdgeInsetsGeometry a, EdgeInsetsGeometry b, double t) {
    assert(t != null);
    if (a == null && b == null) return null;
    if (a == null) return b * t;
    if (b == null) return a * (1.0 - t);
    if (a is EdgeInsets && b is EdgeInsets) return EdgeInsets.lerp(a, b, t);
    if (a is EdgeInsetsDirectional && b is EdgeInsetsDirectional)
      return EdgeInsetsDirectional.lerp(a, b, t);
    return new _MixedEdgeInsets.fromLRSETB(
      lerpDouble(a.left, b.left, t),
      lerpDouble(a.right, b.right, t),
      lerpDouble(a.start, b.start, t),
      lerpDouble(a.end, b.end, t),
      lerpDouble(a.top, b.top, t),
      lerpDouble(a.bottom, b.bottom, t),
    );
  }

  /// Convert this instance into an [EdgeInsets], which uses literal coordinates
  /// (i.e. the `left` coordinate being explicitly a distance from the left, and
  /// the `right` coordinate being explicitly a distance from the right).
  ///
  /// See also:
  ///
  ///  * [EdgeInsets], for which this is a no-op (returns itself).
  ///  * [EdgeInsetsDirectional], which flips the horizontal direction
  ///    based on the `direction` argument.
  EdgeInsets resolve(TextDirection direction);

  @override
  String toString() {
    if (assertionsEnabled) {
      if (start == 0.0 && end == 0.0) {
        if (left == 0.0 && right == 0.0 && top == 0.0 && bottom == 0.0)
          return 'EdgeInsets.zero';
        if (left == right && right == top && top == bottom)
          return 'EdgeInsets.all(${left.toStringAsFixed(1)})';
        return 'EdgeInsets(${left.toStringAsFixed(1)}, '
            '${top.toStringAsFixed(1)}, '
            '${right.toStringAsFixed(1)}, '
            '${bottom.toStringAsFixed(1)})';
      }
      if (left == 0.0 && right == 0.0) {
        return 'EdgeInsetsDirectional(${start.toStringAsFixed(1)}, '
            '${top.toStringAsFixed(1)}, '
            '${end.toStringAsFixed(1)}, '
            '${bottom.toStringAsFixed(1)})';
      }
      return 'EdgeInsets(${left.toStringAsFixed(1)}, '
          '${top.toStringAsFixed(1)}, '
          '${right.toStringAsFixed(1)}, '
          '${bottom.toStringAsFixed(1)})'
          ' + '
          'EdgeInsetsDirectional(${start.toStringAsFixed(1)}, '
          '0.0, '
          '${end.toStringAsFixed(1)}, '
          '0.0)';
    } else {
      return super.toString();
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (other is! EdgeInsetsGeometry) return false;
    final EdgeInsetsGeometry typedOther = other;
    return left == typedOther.left &&
        right == typedOther.right &&
        start == typedOther.start &&
        end == typedOther.end &&
        top == typedOther.top &&
        bottom == typedOther.bottom;
  }

  @override
  int get hashCode => hashValues(left, right, start, end, top, bottom);
}

/// An immutable set of offsets in each of the four cardinal directions.
///
/// Typically used for an offset from each of the four sides of a box. For
/// example, the padding inside a box can be represented using this class.
class EdgeInsets extends EdgeInsetsGeometry {
  /// Creates insets from offsets from the left, top, right, and bottom.
  const EdgeInsets.fromLTRB(this._left, this._top, this._right, this._bottom);

  /// Creates insets where all the offsets are `value`.
  ///
  /// ## Sample code
  ///
  /// Typical eight-pixel margin on all sides:
  ///
  /// ```dart
  /// const EdgeInsets.all(8.0)
  /// ```
  const EdgeInsets.all(double value)
      : _left = value,
        _top = value,
        _right = value,
        _bottom = value;

  /// Creates insets with only the given values non-zero.
  ///
  /// ## Sample code
  ///
  /// Left margin indent of 40 pixels:
  ///
  /// ```dart
  /// const EdgeInsets.only(left: 40.0)
  /// ```
  const EdgeInsets.only(
      {double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0})
      : _left = left,
        _top = top,
        _right = right,
        _bottom = bottom;

  /// Creates insets with symmetrical vertical and horizontal offsets.
  ///
  /// ## Sample code
  ///
  /// Eight pixel margin above and below, no horizontal margins:
  ///
  /// ```dart
  /// const EdgeInsets.symmetric(vertical: 8.0)
  /// ```
  const EdgeInsets.symmetric({double vertical = 0.0, double horizontal = 0.0})
      : _left = horizontal,
        _top = vertical,
        _right = horizontal,
        _bottom = vertical;

  /// Creates insets that match the given window padding.
  ///
  /// If you need the current system padding or view insets in the context of a
  /// widget, consider using [MediaQuery.of] to obtain these values rather than
  /// using the value from [dart:ui.window], so that you get notified of
  /// changes.
  EdgeInsets.fromWindowPadding(WindowPadding padding, double devicePixelRatio)
      : _left = padding.left / devicePixelRatio,
        _top = padding.top / devicePixelRatio,
        _right = padding.right / devicePixelRatio,
        _bottom = padding.bottom / devicePixelRatio;

  /// An [EdgeInsets] with zero offsets in each direction.
  static const EdgeInsets zero = const EdgeInsets.only();

  /// The offset from the left.
  final double _left;

  @override
  double get left => _left;

  /// The offset from the top.
  final double _top;

  @override
  double get top => _top;

  /// The offset from the right.
  final double _right;

  @override
  double get right => _right;

  /// The offset from the bottom.
  final double _bottom;

  @override
  double get bottom => _bottom;

  @override
  double get start => 0.0;

  @override
  double get end => 0.0;

  /// An Offset describing the vector from the top left of a rectangle to the
  /// top left of that rectangle inset by this object.
  Offset get topLeft => new Offset(left, top);

  /// An Offset describing the vector from the top right of a rectangle to the
  /// top right of that rectangle inset by this object.
  Offset get topRight => new Offset(-right, top);

  /// An Offset describing the vector from the bottom left of a rectangle to the
  /// bottom left of that rectangle inset by this object.
  Offset get bottomLeft => new Offset(left, -bottom);

  /// An Offset describing the vector from the bottom right of a rectangle to
  /// the bottom right of that rectangle inset by this object.
  Offset get bottomRight => new Offset(-right, -bottom);

  /// An [EdgeInsets] with top and bottom as well as left and right flipped.
  @override
  EdgeInsets get flipped => new EdgeInsets.fromLTRB(right, bottom, left, top);

  /// Returns a new rect that is bigger than the given rect in each direction by
  /// the amount of inset in each direction. Specifically, the left edge of the
  /// rect is moved left by [left], the top edge of the rect is moved up by
  /// [top], the right edge of the rect is moved right by [right], and the
  /// bottom edge of the rect is moved down by [bottom].
  ///
  /// See also:
  ///
  ///  * [inflateSize], to inflate a [Size] rather than a [Rect].
  ///  * [deflateRect], to deflate a [Rect] rather than inflating it.
  Rect inflateRect(Rect rect) {
    return new Rect.fromLTRB(rect.left - left, rect.top - top,
        rect.right + right, rect.bottom + bottom);
  }

  /// Returns a new rect that is smaller than the given rect in each direction
  /// by the amount of inset in each direction. Specifically, the left edge of
  /// the rect is moved right by [left], the top edge of the rect is moved down
  /// by [top], the right edge of the rect is moved left by [right], and the
  /// bottom edge of the rect is moved up by [bottom].
  ///
  /// If the argument's [Rect.size] is smaller than [collapsedSize], then the
  /// resulting rectangle will have negative dimensions.
  ///
  /// See also:
  ///
  ///  * [deflateSize], to deflate a [Size] rather than a [Rect].
  ///  * [inflateRect], to inflate a [Rect] rather than deflating it.
  Rect deflateRect(Rect rect) {
    return new Rect.fromLTRB(rect.left + left, rect.top + top,
        rect.right - right, rect.bottom - bottom);
  }

  @override
  EdgeInsetsGeometry subtract(EdgeInsetsGeometry other) {
    if (other is EdgeInsets) return this - other;
    return super.subtract(other);
  }

  @override
  EdgeInsetsGeometry add(EdgeInsetsGeometry other) {
    if (other is EdgeInsets) return this + other;
    return super.add(other);
  }

  /// Returns the difference between two [EdgeInsets].
  EdgeInsets operator -(EdgeInsets other) {
    return new EdgeInsets.fromLTRB(
      left - other.left,
      top - other.top,
      right - other.right,
      bottom - other.bottom,
    );
  }

  /// Returns the sum of two [EdgeInsets].
  EdgeInsets operator +(EdgeInsets other) {
    return new EdgeInsets.fromLTRB(
      left + other.left,
      top + other.top,
      right + other.right,
      bottom + other.bottom,
    );
  }

  /// Returns the [EdgeInsets] object with each dimension negated.
  ///
  /// This is the same as multiplying the object by -1.0.
  @override
  EdgeInsets operator -() {
    return new EdgeInsets.fromLTRB(
      -left,
      -top,
      -right,
      -bottom,
    );
  }

  /// Scales the [EdgeInsets] in each dimension by the given factor.
  @override
  EdgeInsets operator *(double other) {
    return new EdgeInsets.fromLTRB(
      left * other,
      top * other,
      right * other,
      bottom * other,
    );
  }

  /// Divides the [EdgeInsets] in each dimension by the given factor.
  @override
  EdgeInsets operator /(double other) {
    return new EdgeInsets.fromLTRB(
      left / other,
      top / other,
      right / other,
      bottom / other,
    );
  }

  /// Integer divides the [EdgeInsets] in each dimension by the given factor.
  @override
  EdgeInsets operator ~/(double other) {
    return new EdgeInsets.fromLTRB(
      (left ~/ other).toDouble(),
      (top ~/ other).toDouble(),
      (right ~/ other).toDouble(),
      (bottom ~/ other).toDouble(),
    );
  }

  /// Computes the remainder in each dimension by the given factor.
  @override
  EdgeInsets operator %(double other) {
    return new EdgeInsets.fromLTRB(
      left % other,
      top % other,
      right % other,
      bottom % other,
    );
  }

  /// Linearly interpolate between two [EdgeInsets].
  ///
  /// If either is null, this function interpolates from [EdgeInsets.zero].
  ///
  /// The `t` argument represents position on the timeline, with 0.0 meaning
  /// that the interpolation has not started, returning `a` (or something
  /// equivalent to `a`), 1.0 meaning that the interpolation has finished,
  /// returning `b` (or something equivalent to `b`), and values in between
  /// meaning that the interpolation is at the relevant point on the timeline
  /// between `a` and `b`. The interpolation can be extrapolated beyond 0.0 and
  /// 1.0, so negative values and values greater than 1.0 are valid (and can
  /// easily be generated by curves such as [Curves.elasticInOut]).
  ///
  /// Values for `t` are usually obtained from an [Animation<double>], such as
  /// an [AnimationController].
  static EdgeInsets lerp(EdgeInsets a, EdgeInsets b, double t) {
    assert(t != null);
    if (a == null && b == null) return null;
    if (a == null) return b * t;
    if (b == null) return a * (1.0 - t);
    return new EdgeInsets.fromLTRB(
      lerpDouble(a.left, b.left, t),
      lerpDouble(a.top, b.top, t),
      lerpDouble(a.right, b.right, t),
      lerpDouble(a.bottom, b.bottom, t),
    );
  }

  @override
  EdgeInsets resolve(TextDirection direction) => this;

  /// Creates a copy of this EdgeInsets but with the given fields replaced
  /// with the new values.
  EdgeInsets copyWith({
    double left,
    double top,
    double right,
    double bottom,
  }) {
    return new EdgeInsets.only(
      left: left ?? this.left,
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
    );
  }
}

/// An immutable set of offsets in each of the four cardinal directions, but
/// whose horizontal components are dependent on the writing direction.
///
/// This can be used to indicate padding from the left in [TextDirection.ltr]
/// text and padding from the right in [TextDirection.rtl] text without having
/// to be aware of the current text direction.
///
/// See also:
///
///  * [EdgeInsets], a variant that uses physical labels (left and right instead
///    of start and end).
class EdgeInsetsDirectional extends EdgeInsetsGeometry {
  /// Creates insets from offsets from the start, top, end, and bottom.
  const EdgeInsetsDirectional.fromSTEB(
      this._start, this._top, this._end, this._bottom);

  /// Creates insets with only the given values non-zero.
  ///
  /// ## Sample code
  ///
  /// A margin indent of 40 pixels on the leading side:
  ///
  /// ```dart
  /// const EdgeInsetsDirectional.only(start: 40.0)
  /// ```
  const EdgeInsetsDirectional.only(
      {double start = 0.0,
      double top = 0.0,
      double end = 0.0,
      double bottom = 0.0})
      : _start = start,
        _top = top,
        _end = end,
        _bottom = bottom;

  /// An [EdgeInsetsDirectional] with zero offsets in each direction.
  ///
  /// Consider using [EdgeInsets.zero] instead, since that object has the same
  /// effect, but will be cheaper to [resolve].
  static const EdgeInsetsDirectional zero = const EdgeInsetsDirectional.only();

  final double _start;

  /// The offset from the start side, the side from which the user will start
  /// reading text.
  ///
  /// This value is normalized into an [EdgeInsets.left] or [EdgeInsets.right]
  /// value by the [resolve] method.
  @override
  double get start => _start;

  final double _top;

  /// The offset from the top.
  ///
  /// This value is passed through to [EdgeInsets.top] unmodified by the
  /// [resolve] method.
  @override
  double get top => _top;

  final double _end;

  /// The offset from the end side, the side on which the user ends reading
  /// text.
  ///
  /// This value is normalized into an [EdgeInsets.left] or [EdgeInsets.right]
  /// value by the [resolve] method.

  @override
  double get end => _end;

  final double _bottom;

  /// The offset from the bottom.
  ///
  /// This value is passed through to [EdgeInsets.bottom] unmodified by the
  /// [resolve] method.
  @override
  double get bottom => _bottom;

  @override
  double get left => 0.0;

  @override
  double get right => 0.0;

  @override
  bool get isNonNegative =>
      start >= 0.0 && top >= 0.0 && end >= 0.0 && bottom >= 0.0;

  /// An [EdgeInsetsDirectional] with [top] and [bottom] as well as [start] and
  /// [end] flipped.
  @override
  EdgeInsetsDirectional get flipped =>
      new EdgeInsetsDirectional.fromSTEB(end, bottom, start, top);

  @override
  EdgeInsetsGeometry subtract(EdgeInsetsGeometry other) {
    if (other is EdgeInsetsDirectional) return this - other;
    return super.subtract(other);
  }

  @override
  EdgeInsetsGeometry add(EdgeInsetsGeometry other) {
    if (other is EdgeInsetsDirectional) return this + other;
    return super.add(other);
  }

  /// Returns the difference between two [EdgeInsetsDirectional] objects.
  EdgeInsetsDirectional operator -(EdgeInsetsDirectional other) {
    return new EdgeInsetsDirectional.fromSTEB(
      start - other.start,
      top - other.top,
      end - other.end,
      bottom - other.bottom,
    );
  }

  /// Returns the sum of two [EdgeInsetsDirectional] objects.
  EdgeInsetsDirectional operator +(EdgeInsetsDirectional other) {
    return new EdgeInsetsDirectional.fromSTEB(
      start + other.start,
      top + other.top,
      end + other.end,
      bottom + other.bottom,
    );
  }

  /// Returns the [EdgeInsetsDirectional] object with each dimension negated.
  ///
  /// This is the same as multiplying the object by -1.0.
  @override
  EdgeInsetsDirectional operator -() {
    return new EdgeInsetsDirectional.fromSTEB(
      -start,
      -top,
      -end,
      -bottom,
    );
  }

  /// Scales the [EdgeInsetsDirectional] object in each dimension by the given
  /// factor.
  @override
  EdgeInsetsDirectional operator *(double other) {
    return new EdgeInsetsDirectional.fromSTEB(
      start * other,
      top * other,
      end * other,
      bottom * other,
    );
  }

  /// Divides the [EdgeInsetsDirectional] object in each dimension by the given
  /// factor.
  @override
  EdgeInsetsDirectional operator /(double other) {
    return new EdgeInsetsDirectional.fromSTEB(
      start / other,
      top / other,
      end / other,
      bottom / other,
    );
  }

  /// Integer divides the [EdgeInsetsDirectional] object in each dimension by
  /// the given factor.
  @override
  EdgeInsetsDirectional operator ~/(double other) {
    return new EdgeInsetsDirectional.fromSTEB(
      (start ~/ other).toDouble(),
      (top ~/ other).toDouble(),
      (end ~/ other).toDouble(),
      (bottom ~/ other).toDouble(),
    );
  }

  /// Computes the remainder in each dimension by the given factor.
  @override
  EdgeInsetsDirectional operator %(double other) {
    return new EdgeInsetsDirectional.fromSTEB(
      start % other,
      top % other,
      end % other,
      bottom % other,
    );
  }

  /// Linearly interpolate between two [EdgeInsetsDirectional].
  ///
  /// If either is null, this function interpolates from
  /// [EdgeInsetsDirectional.zero].
  ///
  /// To interpolate between two [EdgeInsetsGeometry] objects of arbitrary type
  /// (either [EdgeInsets] or [EdgeInsetsDirectional]), consider the
  /// [EdgeInsetsGeometry.lerp] static method.
  ///
  /// The `t` argument represents position on the timeline, with 0.0 meaning
  /// that the interpolation has not started, returning `a` (or something
  /// equivalent to `a`), 1.0 meaning that the interpolation has finished,
  /// returning `b` (or something equivalent to `b`), and values in between
  /// meaning that the interpolation is at the relevant point on the timeline
  /// between `a` and `b`. The interpolation can be extrapolated beyond 0.0 and
  /// 1.0, so negative values and values greater than 1.0 are valid (and can
  /// easily be generated by curves such as [Curves.elasticInOut]).
  ///
  /// Values for `t` are usually obtained from an [Animation<double>], such as
  /// an [AnimationController].
  static EdgeInsetsDirectional lerp(
      EdgeInsetsDirectional a, EdgeInsetsDirectional b, double t) {
    assert(t != null);
    if (a == null && b == null) return null;
    if (a == null) return b * t;
    if (b == null) return a * (1.0 - t);
    return new EdgeInsetsDirectional.fromSTEB(
      lerpDouble(a.start, b.start, t),
      lerpDouble(a.top, b.top, t),
      lerpDouble(a.end, b.end, t),
      lerpDouble(a.bottom, b.bottom, t),
    );
  }

  @override
  EdgeInsets resolve(TextDirection direction) {
    assert(direction != null);
    switch (direction) {
      case TextDirection.rtl:
        return new EdgeInsets.fromLTRB(end, top, start, bottom);
      case TextDirection.ltr:
        return new EdgeInsets.fromLTRB(start, top, end, bottom);
    }
    return null;
  }
}

class _MixedEdgeInsets extends EdgeInsetsGeometry {
  const _MixedEdgeInsets.fromLRSETB(
      this.left, this.right, this.start, this.end, this.top, this.bottom);

  @override
  final double left;

  @override
  final double right;

  @override
  final double start;

  @override
  final double end;

  @override
  final double top;

  @override
  final double bottom;

  @override
  bool get isNonNegative {
    return left >= 0.0 &&
        right >= 0.0 &&
        start >= 0.0 &&
        end >= 0.0 &&
        top >= 0.0 &&
        bottom >= 0.0;
  }

  @override
  _MixedEdgeInsets operator -() {
    return new _MixedEdgeInsets.fromLRSETB(
      -left,
      -right,
      -start,
      -end,
      -top,
      -bottom,
    );
  }

  @override
  _MixedEdgeInsets operator *(double other) {
    return new _MixedEdgeInsets.fromLRSETB(
      left * other,
      right * other,
      start * other,
      end * other,
      top * other,
      bottom * other,
    );
  }

  @override
  _MixedEdgeInsets operator /(double other) {
    return new _MixedEdgeInsets.fromLRSETB(
      left / other,
      right / other,
      start / other,
      end / other,
      top / other,
      bottom / other,
    );
  }

  @override
  _MixedEdgeInsets operator ~/(double other) {
    return new _MixedEdgeInsets.fromLRSETB(
      (left ~/ other).toDouble(),
      (right ~/ other).toDouble(),
      (start ~/ other).toDouble(),
      (end ~/ other).toDouble(),
      (top ~/ other).toDouble(),
      (bottom ~/ other).toDouble(),
    );
  }

  @override
  _MixedEdgeInsets operator %(double other) {
    return new _MixedEdgeInsets.fromLRSETB(
      left % other,
      right % other,
      start % other,
      end % other,
      top % other,
      bottom % other,
    );
  }

  @override
  EdgeInsets resolve(TextDirection direction) {
    assert(direction != null);
    switch (direction) {
      case TextDirection.rtl:
        return new EdgeInsets.fromLTRB(end + left, top, start + right, bottom);
      case TextDirection.ltr:
        return new EdgeInsets.fromLTRB(start + left, top, end + right, bottom);
    }
    return null;
  }
}
