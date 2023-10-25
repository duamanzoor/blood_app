import 'package:blood_app/pages.dart/Addmanager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManagerHome extends StatefulWidget {
  const ManagerHome({super.key});

  @override
  State<ManagerHome> createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHome> {
  
  final CollectionReference manager =
      FirebaseFirestore.instance.collection('manager');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.home, color: Color(0xFFEB3738)),
        title: Text(
          "Manager",
          style: TextStyle(
            color: Color(0xFFEB3738),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Addmanager(),
                  ));
            },
            child: Text(
              "Add Manager",
              style: TextStyle(
                  color: Color(0xFFEB3738), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: manager.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot managerSnap =
                      snapshot.data.docs[index];
                  return DataTable(columns: [
                    DataColumn(
                        label: Text(
                      "Name",
                      style: TextStyle(
                          color: Color(
                            0xFFEB3738,
                          ),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 20),
                    )),
                    DataColumn(
                        label: Text(
                      "Area",
                      style: TextStyle(
                          color: Color(
                            0xFFEB3738,
                          ),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 20),
                    )),
                    DataColumn(
                        label: Text(
                      "Phone",
                      style: TextStyle(
                          color: Color(
                            0xFFEB3738,
                          ),
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 20),
                    )),
                  ], rows: [
                    DataRow(cells: [
                      DataCell(Text(
                        managerSnap['name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      )),
                      DataCell(Text(
                        managerSnap['location'],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      )),
                      DataCell(Text(
                        managerSnap['phone'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      )),
                    ])
                  ]);
                });
          }
          return Container();
        },
      ),
    );
  }
}
