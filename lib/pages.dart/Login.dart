import 'package:blood_app/pages.dart/HomePage.dart';
import 'package:blood_app/pages.dart/ManagerLogin.dart';
import 'package:blood_app/pages.dart/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      emailController.clear();
      passwordController.clear();

      print("===LoggedIn successfully");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user not found') {
        print("No user found for that email");
      } else if (e.code == 'wrong password') {
        print("Wrong password provided for that user");
      }
    } catch (e) {
      print("====catch====");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/water 1.png",
                    height: 90,
                    color: Color(0xFFEB3738),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/ZINDGI.png",
                    color: Color(0xFFEB3738),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                        "Login as User",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.account_box,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Enter Email",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Enter Password",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loginUser();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEB3738),
                        onPrimary: Colors.white,
                        fixedSize: Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text("Login"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ));
                      },
                      child: Text(
                        "Don't have an account, Register here.",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          ],
        )));
  }
}
