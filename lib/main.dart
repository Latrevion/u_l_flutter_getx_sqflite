import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u_l_flutter_getx_sqflite/config/task_bindings.dart';
import 'package:u_l_flutter_getx_sqflite/view/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TaskBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: TaskBindings(),
      theme: ThemeData.light(
        useMaterial3: true
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true
      ),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}


