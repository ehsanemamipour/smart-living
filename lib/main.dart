import 'package:flutter/material.dart';
import 'package:smart_living/injection_container.dart' as di;
import 'package:smart_living/features/weather/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    const MaterialApp(home: HomePage()),
  );
}
