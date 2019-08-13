// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:path/path.dart' as p;

const _ansiGreen = 32;
const _ansiRed = 31;
const _ansiMagenta = 35;

void main() async {
  final packageDirs = _listPackageDirs(Directory.current)
      .map((path) => p.relative(path, from: Directory.current.path))
      .toList();

  print('Package dirs:\n${packageDirs.map((path) => '  $path').join('\n')}');

  final results = <bool>[];
  for (var i = 0; i < packageDirs.length; i++) {
    final dir = packageDirs[i];
    _logWrapped(_ansiMagenta, '\n$dir (${i + 1} of ${packageDirs.length})');
    results.add(await _run(dir, 'pub', ['upgrade', '--no-precompile']));
    results.add(await _run(
      dir,
      'dartanalyzer',
      ['--fatal-infos', '--fatal-warnings', '.'],
    ));
    _printStatus(results);
  }

  if (results.any((v) => !v)) {
    exitCode = 1;
  }
}

void _printStatus(List<bool> results) {
  var successCount = results.where((t) => t).length;
  var success = (successCount == results.length);
  var pct = 100 * successCount / results.length;

  _logWrapped(success ? _ansiGreen : _ansiRed,
      '$successCount of ${results.length} (${pct.toStringAsFixed(2)}%)');
}

void _logWrapped(int code, String message) {
  print('\x1B[${code}m$message\x1B[0m');
}

Future<bool> _run(
    String workingDir, String commandName, List<String> args) async {
  var commandDescription = '`${([commandName]..addAll(args)).join(' ')}`';

  _logWrapped(_ansiMagenta, '  Running $commandDescription');

  var proc = await Process.start(
    commandName,
    args,
    workingDirectory: Directory.current.path + '/' + workingDir,
    mode: ProcessStartMode.inheritStdio,
  );

  var exitCode = await proc.exitCode;

  if (exitCode != 0) {
    _logWrapped(
        _ansiRed, '  Failed! ($exitCode) – $workingDir – $commandDescription');
    return false;
  } else {
    _logWrapped(_ansiGreen, '  Success! – $workingDir – $commandDescription');
    return true;
  }
}

Iterable<String> _listPackageDirs(Directory dir) sync* {
  if (File('${dir.path}/pubspec.yaml').existsSync()) {
    yield dir.path;
  } else {
    for (var subDir in dir
        .listSync(followLinks: false)
        .whereType<Directory>()
        .where((d) => !Uri.file(d.path).pathSegments.last.startsWith('.'))) {
      yield* _listPackageDirs(subDir);
    }
  }
}
