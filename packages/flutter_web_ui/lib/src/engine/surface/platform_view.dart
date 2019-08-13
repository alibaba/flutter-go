part of engine;

/// A surface containing a platform view, which is an HTML element.
class PersistedPlatformView extends PersistedLeafSurface {
  final int viewId;
  final double dx;
  final double dy;
  final double width;
  final double height;

  html.HtmlElement _hostElement;
  html.ShadowRoot _shadowRoot;

  PersistedPlatformView(this.viewId, this.dx, this.dy, this.width, this.height);

  @override
  html.Element createElement() {
    _hostElement = defaultCreateElement('flt-platform-view');
    _shadowRoot = _hostElement.attachShadow(<String, String>{'mode': 'open'});
    final html.StyleElement _styleReset = html.StyleElement();
    _styleReset.innerHtml = '''
      :host {
        all: initial;
      }''';
    _shadowRoot.append(_styleReset);
    final html.Element platformView =
        platformViewRegistry.getCreatedView(viewId);
    if (platformView != null) {
      _shadowRoot.append(platformView);
    } else {
      html.window.console.warn('No platform view created for id $viewId');
    }
    return _hostElement;
  }

  @override
  void apply() {
    _hostElement.style
      ..transform = 'translate(${dx}px, ${dy}px)'
      ..width = '${width}px'
      ..height = '${height}px';
  }

  @override
  double matchForUpdate(PersistedPlatformView existingSurface) {
    return existingSurface.viewId == viewId ? 0.0 : 1.0;
  }
}
