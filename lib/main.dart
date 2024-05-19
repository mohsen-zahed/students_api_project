import 'package:flutter/material.dart';
import 'package:students_api_project/features/screens/home_screens/add_student_screen/add_student_screen.dart';
import 'package:students_api_project/features/screens/home_screens/home_screen/home_screen.dart';
import 'package:students_api_project/features/screens/home_screens/search_screen/search_screen.dart';
import 'package:students_api_project/theme/dark_theme.dart';
import 'package:students_api_project/theme/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routes: {
        AddStudentScreen.id: (context) => const AddStudentScreen(),
        SearchScreen.id: (context) => const SearchScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
