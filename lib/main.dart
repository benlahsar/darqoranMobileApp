import 'package:flutter/material.dart';

// import file here
import 'colors/my_colors.dart';
import 'home/home_page.dart';
import 'teacher/new_teacher.dart';
import 'teacher/teacher_list.dart';
import 'student/new_student.dart';
import 'firebase_options.dart';

// import plugins here
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: SvgPicture.asset('asset/images/quran.svg'))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.alternate_email)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.lock_rounded))),
            ),
            TextButton(
                onPressed: () {
                  // To Do FORGOT PASSWORD SCREEN GOES HERE
                },
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                )),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: myGreen, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  // login();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const NewStudent()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 150)),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Create Account",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

//   Future<void> login() async {
//     if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
//       if (validateEmail(emailController.text)) {
//         var response = await http.post(Uri.parse("https://reqres.in/api/login"),
//             body: ({
//               'email': emailController.text,
//               'password': passController.text,
//             }));
//         if (response.statusCode == 200) {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const TeacherList()));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text("Invalid Credentials")));
//         }
//       } else {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text("Invalid Email")));
//         // display error message the email is invalid
//       }
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text("Blank Field Not Valid")));
//     }
//   }

//   bool validateEmail(String email) {
//     const String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     final RegExp regex = RegExp(pattern);
//     if (email.isNotEmpty || !regex.hasMatch(email)) {
//       return true;
//     } else {
//       return false;
//     }
//   }
}
