import 'package:flutter/material.dart';
import 'package:music_demo/data/service_locator.dart';

import 'app.dart';

Future<void> main() async {
  await startup();
  runApp(const AppleMusicApp());
}