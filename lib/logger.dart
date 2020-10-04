import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

void setupLogger() {
  if (kReleaseMode) {
    releaseLogger();
  } else {
    debugLogger();
  }
}

void releaseLogger() {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}',
        time: record.time,
        sequenceNumber: record.sequenceNumber,
        name: record.loggerName,
        level: record.level.value,
        zone: record.zone,
        error: record.error,
        stackTrace: record.stackTrace);
  });
}

void debugLogger() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // Loggerのアップデートによって階層が変わる可能性がある
    // 解消するには、Loggerの各レベルのログメソッドをラップする必要があるが、
    // できればFlutter公式のloggingをそのまま使いたいので、一旦このままとする
    const level = 11;
    // かなり処理が遅くなる
    final frames = Trace.current(level).frames;
    final frame = frames.isEmpty ? null : frames.first;
    log('${record.level.name}: ${record.time}: $frame: ${record.message}',
        time: record.time,
        sequenceNumber: record.sequenceNumber,
        name: record.loggerName,
        level: record.level.value,
        zone: record.zone,
        error: record.error,
        stackTrace: record.stackTrace);
  });
}
