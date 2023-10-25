import 'package:blood_app/pages.dart/All_donors.dart';
import 'package:blood_app/pages.dart/add_donor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFEB3738),
          title: Text(
            "Blood Groups",
            style: TextStyle(letterSpacing: 1, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(children: [
                Image.asset(
                  "assets/images/Rectangle 32.png",
                  height: 300,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Blood Group",
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Mychips(),

                
                Padding(
                  padding: const EdgeInsets.only(top: 50,left: 110),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => All_donors(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(130, 50),
                              primary: Color(0xFFEB3738),
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          child: Text(
                            "Show All",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => add_donor(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(130, 50),
                              primary: Color(0xFFEB3738),
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          child: Text(
                            "Add Donor",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])
            ],
          ),
        ));
  }
}

class Mychips extends StatefulWidget {
  const Mychips({super.key});

  @override
  State<Mychips> createState() => _MychipsState();
}

class _MychipsState extends State<Mychips> {
  List chipLabels = ["O+", "A+", "B+", "AB+", "AB-", "A-", "B-", "O-"];
  List selectedChips = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 8,
            children: chipLabels.map((label) {
              final isSelected = selectedChips.contains(label);
              return ChoiceChip(
                label: Text(label),
                selected: isSelected,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      selectedChips.add(label); // Add to the selected list
                    } else {
                      selectedChips
                          .remove(label); // Remove from the selected list
                    }
                  });
                },
                selectedColor: Color(0xFFEB3738),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
