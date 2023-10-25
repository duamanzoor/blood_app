import 'package:blood_app/pages.dart/All_donors.dart';
import 'package:blood_app/pages.dart/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  TextEditingController NTcontroller = TextEditingController();

  TextEditingController nTcontroller = TextEditingController();
  TextEditingController LTcontroller = TextEditingController();
  TextEditingController LDcontroller = TextEditingController();

  final bloodGroups = ['A+', 'B+', 'O+', 'AB+', 'B-', 'A-', 'AB-', 'O-'];
  String? selectedGroup;

  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  String? get docId => null;

  void updateDonor() {
    final data = {
      'name': NTcontroller.text,
      'location': LTcontroller.text,
      'number': nTcontroller.text,
      'lastdonate': LDcontroller.text,
      'group': selectedGroup,
    };
    donor.doc(docId).update(data);
  }

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFEB3738),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => All_donors(),
                    ));
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              )),
          title: Text(
            "Update Donor Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  TextField(
                    controller: NTcontroller,
                    decoration: InputDecoration(
                      hintText: "Enter name",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: LTcontroller,
                    decoration: InputDecoration(
                      hintText: "Enter location",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: nTcontroller,
                    decoration: InputDecoration(
                      hintText: "Enter number",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: LDcontroller,
                    decoration: InputDecoration(
                      hintText: "Enter Last donation date",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            label: Text(
                          "Select Blood Group",
                          style: TextStyle(color: Colors.red),
                        )),
                        items: bloodGroups
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          selectedGroup = value as String?;
                        }),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        updateDonor();
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  Center(
                      child: Padding(
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
                  ))
                ])),
          ),
        ));
  }
}
