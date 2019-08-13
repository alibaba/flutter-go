// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Parses text in a Markdown-like format and renders to HTML.
library markdown;

import 'src/version.dart';

export 'src/ast.dart';
export 'src/block_parser.dart';
export 'src/document.dart';
export 'src/extension_set.dart';
export 'src/html_renderer.dart';
export 'src/inline_parser.dart';

const version = packageVersion;
