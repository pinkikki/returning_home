import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class Crud extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  @override
  Widget build(BuildContext context) {
    Query query = FirebaseFirestore.instance.collection('locations');
    query = query.where('userId', isEqualTo: 'pokuri');
    return Scaffold(
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('add'),
            onPressed: () async {
              final firestore = FirebaseFirestore.instance;
              final geo = Geoflutterfire();
              final point =
                  geo.point(latitude: 35.658034, longitude: 139.701636);
              await firestore
                  .collection('locations')
                  .add({'position': point.data, 'userId': 'pinkikki'});
            },
          ),
          StreamBuilder(
            stream: query.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  QuerySnapshot querySnapshot = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: querySnapshot.size,
                      itemBuilder: (context, index) =>
                          Text(querySnapshot.docs[index].data()['userId']),
                    ),
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
