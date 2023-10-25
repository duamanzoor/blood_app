import 'package:blood_app/pages.dart/HomePage.dart';
import 'package:blood_app/pages.dart/add_donor.dart';
import 'package:blood_app/pages.dart/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class All_donors extends StatefulWidget {
  const All_donors({super.key});

  @override
  State<All_donors> createState() => _All_donorsState();
}

class _All_donorsState extends State<All_donors> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

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
                  builder: (context) => Homepage(),
                ));
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          "All Donors",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => add_donor(),
              ));
        },
        backgroundColor: Color(0xFFEB3738),
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
          stream: donor.snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot donorSnap =
                        snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 5,
                                blurRadius: 10,
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFFEB3738),
                                  radius: 30,
                                  child: Text(
                                    donorSnap['group'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  donorSnap['name'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  donorSnap['location'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  donorSnap['number'].toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  donorSnap['lastdonate'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => edit(),
                                        ));
                                  },
                                  icon: Icon(Icons.edit,
                                      size: 30, color: Colors.black),
                                ),
                                
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
