import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:notus/notus.dart';

import 'code.dart';
import 'common.dart';
import 'image.dart';
import 'list.dart';
import 'paragraph.dart';
import 'quote.dart';
import 'scope.dart';
import 'theme.dart';

/// Non-scrollable read-only view of Notus rich text documents.
@experimental
class ZefyrView extends StatefulWidget {
  final NotusDocument document;
  final ZefyrImageDelegate imageDelegate;

  const ZefyrView({Key key, @required this.document, this.imageDelegate})
      : super(key: key);

  @override
  ZefyrViewState createState() => ZefyrViewState();
}

class ZefyrViewState extends State<ZefyrView> {
  ZefyrScope _scope;
  ZefyrThemeData _themeData;

  ZefyrImageDelegate get imageDelegate => widget.imageDelegate;

  @override
  void initState() {
    super.initState();
    _scope = ZefyrScope.view(imageDelegate: widget.imageDelegate);
  }

  @override
  void didUpdateWidget(ZefyrView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scope.imageDelegate = widget.imageDelegate;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final parentTheme = ZefyrTheme.of(context, nullOk: true);
    final fallbackTheme = ZefyrThemeData.fallback(context);
    _themeData = (parentTheme != null)
        ? fallbackTheme.merge(parentTheme)
        : fallbackTheme;
  }

  @override
  void dispose() {
    _scope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZefyrTheme(
      data: _themeData,
      child: ZefyrScopeAccess(
        scope: _scope,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildChildren(context),
        ),
      ),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    final result = <Widget>[];
    for (var node in widget.document.root.children) {
      result.add(_defaultChildBuilder(context, node));
    }
    return result;
  }

  Widget _defaultChildBuilder(BuildContext context, Node node) {
    if (node is LineNode) {
      if (node.hasEmbed) {
        return new RawZefyrLine(node: node);
      } else if (node.style.contains(NotusAttribute.heading)) {
        return new ZefyrHeading(node: node);
      }
      return new ZefyrParagraph(node: node);
    }

    final BlockNode block = node;
    final blockStyle = block.style.get(NotusAttribute.block);
    if (blockStyle == NotusAttribute.block.code) {
      return new ZefyrCode(node: block);
    } else if (blockStyle == NotusAttribute.block.bulletList) {
      return new ZefyrList(node: block);
    } else if (blockStyle == NotusAttribute.block.numberList) {
      return new ZefyrList(node: block);
    } else if (blockStyle == NotusAttribute.block.quote) {
      return new ZefyrQuote(node: block);
    }

    throw new UnimplementedError('Block format $blockStyle.');
  }
}
