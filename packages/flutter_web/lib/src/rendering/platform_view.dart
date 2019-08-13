// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// How an embedded platform view behave during hit tests.
enum PlatformViewHitTestBehavior {
  /// Opaque targets can be hit by hit tests, causing them to both receive
  /// events within their bounds and prevent targets visually behind them from
  /// also receiving events.
  opaque,

  /// Translucent targets both receive events within their bounds and permit
  /// targets visually behind them to also receive events.
  translucent,

  /// Transparent targets don't receive events within their bounds and permit
  /// targets visually behind them to receive events.
  transparent,
}

// TODO(flutter_web): implement RenderWebPlatformView.
