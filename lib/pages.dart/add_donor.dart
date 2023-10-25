import 'dart:math';
import 'package:blood_app/pages.dart/HomePage.dart';
import 'package:blood_app/pages.dart/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/pages.dart/All_donors.dart';

class add_donor extends StatefulWidget {
  const add_donor({super.key});

  @override
  State<add_donor> createState() => _add_donorState();
}

class _add_donorState extends State<add_donor> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController bloodcontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController lastcontroller = TextEditingController();

  final bloodGroups = ['A+', 'B+', 'O+', 'AB+', 'B-', 'A-', 'AB-', 'O-'];
  String? selectedGroup;

  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  void addDonor() {
    final data = {
      'name': namecontroller.text,
      'location': locationcontroller.text,
      'number': numbercontroller.text,
      'lastdonate': lastcontroller.text,
      'group': selectedGroup,
    };
    donor.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEB3738),
          title: Text(
            "Add Donor",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: "Enter name",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: locationcontroller,
                    decoration: InputDecoration(
                      hintText: "Enter location",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: numbercontroller,
                    decoration: InputDecoration(
                      hintText: "Enter number",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: lastcontroller,
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
                        addDonor();
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEB3738),
                                fixedSize: Size(150, 50)),
                            child: Text(
                              "Call",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => edit(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEB3738),
                                fixedSize: Size(150, 50)),
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  )
                ])),
          ),
        ));
  }
}
