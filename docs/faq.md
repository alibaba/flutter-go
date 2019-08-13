# Flutter for web Tech Preview FAQ

## Why can't I import `package:flutter`?

Our goal is to enable building applications for mobile and web simultaneously
from a single codebase. However, to facilitate fast experimentation, temporarily
Flutter for web is developed in a separate namespace. So, as of today, in order
to use Flutter for web you need to import `package:flutter_web` instead of
`package:flutter`, and `package:flutter_web_ui` instead of `dart:ui`.

## Why can't I use existing Flutter pub packages?

Due to the temporarily limitation explained in "Why can't I import
`package:flutter`?" above it is not possible to use existing Flutter packages
published on https://pub.dev. This is because those packages import
`package:flutter`.

## Can I use plugin X on the web?

Plugin support for the Web is currently in design stage. Please, stay tuned. In
the meantime, you can use libraries listed on https://api.dartlang.org to access
browser API.

## Why are fonts not working?

Until Flutter for web is integrated into the Flutter SDK we do not automatically
bundle fonts as part of the build process. In the meantime, you need to follow
the instructions for including the fonts in the
[migration guide](https://github.com/flutter/flutter_web/blob/master/oss/docs/faq.md).

## When will Flutter for web be ready for production?

Production readiness greatly depends on your use-case. We plan to listen to
community feedback to decide which parts to make production-ready first. While
we cannot predict the future, here are a few things we know we need to finish:

- Merge into the Flutter SDK.
- Make sure widgets are rendered correctly in all important use-cases.
- Make sure performance is great for most use-cases.
- Finish our accessibility work.

## How do I make network requests?

Due to browser limitations `dart:io` is not supported on the Web. In the
meantime you can use `package:http` to make HTTP requests. This package works
both in Flutter for mobile and in Flutter for web.
