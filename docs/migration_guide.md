Our goal is to enable building applications for mobile and web
simultaneously from a single codebase. However, to allow experimentation,
the tech preview Flutter for web is developed in a separate
namespace. So, as of today an existing mobile
Flutter application will not run on the web without changes.

This document outlines the changes you'll need to make to existing Flutter code
to run it on the Flutter for web. You should create a copy of your
existing application code and modify it to add web support.

If you're using Git, we suggest creating a web-specific branch in your project
repository for the time being.

# `pubspec.yaml`

<!-- TODO: flutter plugin dependencies -->

```yaml
name: my_app

version: 1.0.0

dependencies:
  ## REPLACE
  ## Update your dependencies to use `flutter_web`
  #flutter:
  #  sdk: flutter
  flutter_web: any

dev_dependencies:
  ## REPLACE
  ## Same goes for test packages
  #flutter_test:
  #  sdk: flutter
  flutter_web_test: any

  ## ADD
  ## Add these dependencies to enable the Dart web build system
  build_runner: ^1.2.2
  build_web_compilers: ^1.1.0

  test: ^1.3.4

## REMOVE
## For the preview, assets are handled differently. Remove or comment
## out this section. See `Assets` below for more details
# flutter:
#   uses-material-design: true
#   assets:
#     - asset/
#
#   fonts:
#   - family: Plaster
#     fonts:
#     - asset: asset/fonts/plaster/Plaster-Regular.ttf

## ADD
## flutter_web packages are not published to pub.dartlang.org
## These overrides tell the package tools to get them from GitHub
dependency_overrides:
  flutter_web:
    git:
      url: https://github.com/flutter/flutter_web
      path: packages/flutter_web
  flutter_web_ui:
    git:
      url: https://github.com/flutter/flutter_web
      path: packages/flutter_web_ui
```

# `lib/`

Change imports of `package:flutter` to `package:flutter_web` throughout
your application code.

Change imports of `dart:ui` to `package:flutter_ui/ui.dart`.

<!-- TODO: asset references -->
<!-- TODO: flutter plugin imports -->
<!-- TODO: test/ directory -->

# `web/`

For the preview, you need to create 

## `web/index.html` and `web/main.dart`

These provide an entrypoint for your application.
In general, you should be able to copy-paste the files below – other than
changing the `package:` import to match your application.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <script defer src="main.dart.js" type="application/javascript"></script>
</head>
<body>
</body>
</html>
```

```dart
import 'package:flutter_web_ui/ui.dart' as ui;

// TODO: change `my_app` to refer to your app package name.
import 'package:my_app/main.dart' as app;

main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
}
```

## `web/assets` (optional)

If the application has assets, they need to be in the `web/assets` directory.
You may also have to update paths within your source code that reference these
assets.

## `web/assets/FontManifest.json` (optional)

If the app has custom fonts, they need to be included in this file.

Example:

```json
[
  {
    "family": "Raleway",
    "fonts": [
      {
        "asset": "fonts/Raleway-Regular.ttf"
      },
      {
        "asset": "fonts/Raleway-Italic.ttf",
        "style": "italic"
      }
    ]
  },
  {
    "family": "RobotoMono",
    "fonts": [
      {
        "asset": "fonts/RobotoMono-Regular.ttf"
      },
      {
        "asset": "fonts/RobotoMono-Bold.ttf",
        "weight": 700
      }
    ]
  }
]
```
