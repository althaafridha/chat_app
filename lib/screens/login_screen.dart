import 'package:chat_app/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "LOGIN_SCREEN";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 160,
              child: Image.asset('images/logo.png'),
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              onChanged: (value) {
                // input user
                email = value;
              },
              decoration: const InputDecoration(
                  hintText: "Your Name",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  )),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                // input user password
                password = value;
              },
              decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  )),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () async {
                    // tombol login
                    try {
                      await _auth.signInWithEmailAndPassword(email: email, password: password);
                      Navigator.pushNamed(context, ChatScreen.id);
                    } catch(e){
                      print(e);
                    }
                  },
                  minWidth: 200,
                  height: 42,
                  child: const Text("Login"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
