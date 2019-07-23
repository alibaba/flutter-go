// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:notus/notus.dart';

import 'common.dart';
import 'theme.dart';

/// Represents a code snippet in Zefyr editor.
class ZefyrCode extends StatelessWidget {
  const ZefyrCode({Key key, @required this.node}) : super(key: key);

  /// Document node represented by this widget.
  final BlockNode node;

  @override
  Widget build(BuildContext context) {
    final theme = ZefyrTheme.of(context);

    List<Widget> items = [];
    for (var line in node.children) {
      items.add(_buildLine(line, theme.blockTheme.code.textStyle));
    }

    return new Padding(
      padding: theme.blockTheme.code.padding,
      child: new Container(
        // TODO: make decorations configurable
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(3.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: items,
        ),
      ),
    );
  }

  Widget _buildLine(Node node, TextStyle style) {
    LineNode line = node;
    return new RawZefyrLine(node: line, style: style);
  }
}
