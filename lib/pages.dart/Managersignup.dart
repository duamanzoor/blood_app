import 'package:blood_app/pages.dart/Login.dart';
import 'package:blood_app/pages.dart/ManagerLogin.dart';
import 'package:blood_app/pages.dart/Signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Managersignup extends StatefulWidget {
  const Managersignup({super.key});

  @override
  State<Managersignup> createState() => _ManagersignupState();
}

class _ManagersignupState extends State<Managersignup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  registerUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      print("====Registered Successfully");
      emailcontroller.clear();
      passwordcontroller.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        print("The password provided is too weak");
      } else if (e.code == 'already exist') {
        print("The account already exists for that email");
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
                        "Singup as Manager",
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
                      controller: emailcontroller,
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
                      controller: passwordcontroller,
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
                      registerUser();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEB3738),
                        onPrimary: Colors.white,
                        fixedSize: Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text("Signup"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Managerlogin(),
                            ));
                      },
                      child: Text(
                        "Do you have already Account, Login here.",
                        style: TextStyle(color: Colors.black),
                      )),
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
                        "Singup as User",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      )),
                ],
              ),
            ),
          ],
        )));
  }
}
