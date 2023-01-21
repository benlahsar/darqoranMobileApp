import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_svg/flutter_svg.dart';
import '../colors/my_colors.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  dynamic myPassword, myEmail;

  Future login() async {
    var data = formState.currentState;

    if (data!.validate()) {
      data.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myEmail, password: myPassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.infoReverse,
            headerAnimationLoop: false,
            title: "Error",
            body: const Text('No user found for that email'),
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            headerAnimationLoop: false,
            title: "Error",
            body: const Text('Wrong password provided for that email'),
            btnOkOnPress: () {},
          ).show();
        }
      }
    } else {
      print('not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Center(
          //     child: Image.asset(
          //    "images/quran.svg",
          //    height: 200,
          // )
          // ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: formState,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.length > 100) {
                          return "Email can't be more than 100 characters";
                        }
                        if (value.length < 2) {
                          return "Email can't be less than 2 characters";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        myEmail = newValue;
                      },
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length > 100) {
                          return "Password can't be more than 100 characters";
                        }
                        if (value.length < 8) {
                          return "Password can't be less than 8 characters";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        myPassword = newValue;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Text("Create new account."),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("signup");
                            },
                            child: const Text(
                              "Create Account",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var user = await login();
                        if (user != null) {
                          Navigator.of(context)
                              .pushReplacementNamed("student list");
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                )),
          )
        ],
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
