import 'package:darqoran_app/student/student_list.dart';
import 'package:flutter/material.dart';

// import file here
import 'auth/login.dart';
import 'home/home_page.dart';
import 'teacher/new_teacher.dart';
import 'teacher/teacher_list.dart';
import 'student/new_student.dart';
import 'firebase_options.dart';

// import plugins here
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginDemo(),
      routes: {
        "home": (context) => const HomePage(),
        "new student": (context) => const NewStudent(),
        "new teacher": (context) => const ListTeacher(),
        "student list": (context) => const StudentList(),
        "teacher list": (context) => const TeacherList(),
      },
    );
  }
}
