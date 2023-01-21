import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  var myEmail, myPassword;

  Future signup() async {
    var data = formState.currentState;
    if (data!.validate()) {
      data.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: myEmail, password: myPassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.infoReverse,
            headerAnimationLoop: false,
            title: "The password provided is too weak.",
            btnOkOnPress: () {},
          ).show();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.infoReverse,
            headerAnimationLoop: false,
            title: "The account already exists for that email.",
            btnOkOnPress: () {},
          ).show();
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            const Center(
              child: Text(
                "Sign up",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.length > 100) {
                  return "Email can't be more than 100 characters";
                }
                if (value.length < 2) {
                  return "Email can't be less than 2 characters";
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.alternate_email)),
              onSaved: (newValue) {
                myEmail = newValue;
              },
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
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.lock)),
              onSaved: (newValue) {
                myPassword = newValue;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  await signup();
                },
                child: const Text("Sign up"))
          ],
        ),
      ),
    );
  }
}
