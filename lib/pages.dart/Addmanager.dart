import 'package:blood_app/pages.dart/ManagerHome.dart';
import 'package:blood_app/pages.dart/ManagerLogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addmanager extends StatefulWidget {
  const Addmanager({super.key});

  @override
  State<Addmanager> createState() => _AddmanagerState();
}

class _AddmanagerState extends State<Addmanager> {
  TextEditingController Ncontroller = TextEditingController();
  TextEditingController Acontroller = TextEditingController();
  TextEditingController Pcontroller = TextEditingController();

  final CollectionReference manager =
      FirebaseFirestore.instance.collection('manager');

  void addManager() {
    final data = {
      'name': Ncontroller.text,
      'location': Acontroller.text,
      'phone': Pcontroller.text,
    };
    manager.add(data);
  }

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Managerlogin(),
            ));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEB3738),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ManagerHome(),
                ));
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text("Add Manager"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: Ncontroller,
                  decoration: InputDecoration(
                    hintText: "Enter name",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: Acontroller,
                  decoration: InputDecoration(
                    hintText: "Enter Area",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: Pcontroller,
                  decoration: InputDecoration(
                    hintText: "Enter number",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      addManager();
                    },
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: ElevatedButton(
                      onPressed: () {
                        signOut();
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(250, 40),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      child: Text(
                        "Signout",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
