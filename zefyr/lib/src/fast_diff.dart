// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:math' as math;

/// Performs a fast diff operation on two input strings based on provided
/// [cursorPosition].
DiffResult fastDiff(String oldText, String newText, int cursorPosition) {
  var delta = newText.length - oldText.length;
  var limit = math.max(0, cursorPosition - delta);
  var end = oldText.length;
  while (end > limit && oldText[end - 1] == newText[end + delta - 1]) {
    end -= 1;
  }
  var start = 0;
  var startLimit = cursorPosition - math.max(0, delta);
  while (start < startLimit && oldText[start] == newText[start]) {
    start += 1;
  }
  final String deleted = (start < end) ? oldText.substring(start, end) : '';
  final inserted = newText.substring(start, end + delta);
  return new DiffResult(start, deleted, inserted);
}

/// A diff between two strings of text.
class DiffResult {
  /// Start index in old text at which changes begin.
  final int start;

  /// Deleted text in old text.
  final String deleted;

  /// Inserted text.
  final String inserted;

  DiffResult(this.start, this.deleted, this.inserted);

  @override
  String toString() => 'DiffResult[$start, "$deleted", "$inserted"]';
}
