// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// This library stubs out `dart:io` so we can compile for the Web.
// TODO(yjbanov): we need a longer-term plan for this.
library flutter_web.io;

import 'dart:async';
import 'dart:convert' show Encoding;

/// A drop-in replacement for `dart:io` `Platform` class.
class Platform {
  static final _operatingSystem = 'android';

  /**
   * A string representing the operating system or platform.
   */
  static String get operatingSystem => _operatingSystem;

  /**
   * Whether the operating system is a version of
   * [Linux](https://en.wikipedia.org/wiki/Linux).
   *
   * This value is `false` if the operating system is a specialized
   * version of Linux that identifies itself by a different name,
   * for example Android (see [isAndroid]).
   */
  static final bool isLinux = (_operatingSystem == "linux");

  /**
   * Whether the operating system is a version of
   * [macOS](https://en.wikipedia.org/wiki/MacOS).
   */
  static final bool isMacOS = (_operatingSystem == "macos");

  /**
   * Whether the operating system is a version of
   * [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows).
   */
  static final bool isWindows = (_operatingSystem == "windows");

  /**
   * Whether the operating system is a version of
   * [Android](https://en.wikipedia.org/wiki/Android_%28operating_system%29).
   */
  static final bool isAndroid = (_operatingSystem == "android");

  /**
   * Whether the operating system is a version of
   * [iOS](https://en.wikipedia.org/wiki/IOS).
   */
  static final bool isIOS = (_operatingSystem == "ios");

  /**
   * Whether the operating system is a version of
   * [Fuchsia](https://en.wikipedia.org/wiki/Google_Fuchsia).
   */
  static final bool isFuchsia = (_operatingSystem == "fuchsia");

  static const Map<String, String> environment = <String, String>{
    // Used by TestWidgetsFlutterBinding
    'FLUTTER_TEST': 'true',
  };
}

void exit(int exitCode) {
  throw _ProgramExitedError();
}

class _ProgramExitedError extends Error {
  @override
  String toString() => 'Program exited';
}

class HttpOverrides {
  static HttpOverrides global;

  HttpClient createHttpClient(SecurityContext _) {
    return null;
  }
}

class HttpClient {
  bool autoUncompress;
  Duration connectionTimeout;
  Duration idleTimeout;
  int maxConnectionsPerHost;
  String userAgent;
  void addCredentials(
      Uri url, String realm, HttpClientCredentials credentials) {}
  void addProxyCredentials(
      String host, int port, String realm, HttpClientCredentials credentials) {}
  set authenticate(
      Future<bool> Function(Uri url, String scheme, String realm) f) {}
  set authenticateProxy(
      Future<bool> Function(String host, int port, String scheme, String realm)
          f) {}
  set badCertificateCallback(
      bool Function(X509Certificate cert, String host, int port) callback) {}
  void close({bool force = false}) {}
  Future<HttpClientRequest> delete(String host, int port, String path) {
    return null;
  }

  Future<HttpClientRequest> deleteUrl(Uri url) {
    return null;
  }

  set findProxy(String Function(Uri url) f) {}
  Future<HttpClientRequest> get(String host, int port, String path) {
    return null;
  }

  Future<HttpClientRequest> getUrl(Uri url) {
    return null;
  }

  Future<HttpClientRequest> head(String host, int port, String path) {
    return null;
  }

  Future<HttpClientRequest> headUrl(Uri url) {
    return null;
  }

  Future<HttpClientRequest> open(
      String method, String host, int port, String path) {
    return null;
  }

  Future<HttpClientRequest> openUrl(String method, Uri url) {
    return null;
  }

  Future<HttpClientRequest> patch(String host, int port, String path) {
    return null;
  }

  Future<HttpClientRequest> patchUrl(Uri url) {
    return null;
  }

  Future<HttpClientRequest> post(String host, int port, String path) {
    return null;
  }

  Future<HttpClientRequest> postUrl(Uri url) {
    return null;
  }

  Future<HttpClientRequest> put(String host, int port, String path) {
    return null;
  }

  Future<HttpClientRequest> putUrl(Uri url) {
    return null;
  }
}

class HttpClientCredentials {}

abstract class HttpClientRequest {
  Encoding encoding;
  HttpHeaders get headers;
  void add(List<int> data);
  void addError(Object error, [StackTrace stackTrace]);
  Future<void> addStream(Stream<List<int>> stream);
  Future<HttpClientResponse> close();
  HttpConnectionInfo get connectionInfo;
  List<Cookie> get cookies;
  Future<HttpClientResponse> get done;
  Future<void> flush();
  String get method;
  Uri get uri;
  void write(Object obj);
  void writeAll(Iterable<Object> objects, [String separator = '']);
  void writeCharCode(int charCode);
  void writeln([Object obj = '']);
}

class HttpHeaders {
  List<String> operator [](String name) => <String>[];
  void add(String name, Object value) {}
  void clear() {}
  void forEach(void Function(String name, List<String> values) f) {}
  void noFolding(String name) {}
  void remove(String name, Object value) {}
  void removeAll(String name) {}
  void set(String name, Object value) {}
  String value(String name) => null;
}

abstract class HttpClientResponse {
  HttpHeaders get headers;
  X509Certificate get certificate;
  HttpConnectionInfo get connectionInfo;
  int get contentLength;
  List<Cookie> get cookies;
  Future<Socket> detachSocket();
  bool get isRedirect;
  StreamSubscription<List<int>> listen(void Function(List<int> event) onData,
      {Function onError, void Function() onDone, bool cancelOnError});
  bool get persistentConnection;
  String get reasonPhrase;
  Future<HttpClientResponse> redirect(
      [String method, Uri url, bool followLoops]);
  List<RedirectInfo> get redirects;
  int get statusCode;
}

class HttpConnectionInfo {}

class Socket {}

class Cookie {}

class RedirectionInfo {}

class RedirectInfo {}

class X509Certificate {}

class SecurityContext {}
