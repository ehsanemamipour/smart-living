import 'package:flutter/material.dart';
import 'package:smart_living/features/weather/presentation/pages/bottom_nav_bar.dart';
import 'package:smart_living/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MaterialApp(home: BottomNavBar()),
  );
}
