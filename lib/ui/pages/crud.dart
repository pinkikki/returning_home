import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:returning_home/ui/notifiers/auth_notifier.dart';

class Crud extends StatefulHookWidget {
  @override
  State<StatefulWidget> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  @override
  Widget build(BuildContext context) {
    final authState = useProvider(authStateNotifierProvider);
    Query query = FirebaseFirestore.instance.collection('locations');
    query = query.where('userId', isEqualTo: authState.state.account.userId);
    return Scaffold(
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: const Text('add'),
            onPressed: () async {
              final firestore = FirebaseFirestore.instance;
              final geo = Geoflutterfire();
              final point =
                  geo.point(latitude: 35.658034, longitude: 139.701636);
              final saved =
                  await firestore.collection('locations').add(<String, dynamic>{
                'position': point.data,
                'userId': authState.state.account.userId,
              });
              print(saved.id);
            },
          ),
          RaisedButton(
            child: const Text('get'),
            onPressed: () async {
              final snapshot = await query.get();
              print(snapshot.docs[0].data());
            },
          ),
          StreamBuilder(
            stream: query.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Text('Loading...');
                case ConnectionState.none:
                  break;
                case ConnectionState.active:
                  final querySnapshot = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: querySnapshot.size,
                      itemBuilder: (context, index) => Text(
                          querySnapshot.docs[index].data()['userId'] as String),
                    ),
                  );
                  break;
                case ConnectionState.done:
                  break;
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
