// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:enum_to_string/enum_to_string.dart';
import 'package:returning_home/run.dart';

enum Environment {
  firebase,
  local,
}

void main() {
  const env = String.fromEnvironment('env', defaultValue: 'local');
  run(
      environment: EnumToString.fromString(Environment.values, env) ??
          Environment.local);
}
