import 'package:flutter/material.dart';
import 'package:pinapp_challenge/app/injection.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}
