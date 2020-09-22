import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:returning_home/widgets/text_input_formatter.dart';
import 'package:rxdart/rxdart.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final _formKey = GlobalKey<FormState>();
  final _subject = BehaviorSubject<List<String>>.seeded(_defaultMessages);
  static const _defaultMessages = ['hello'];

  @override
  void initState() {
    super.initState();
    Query query = FirebaseFirestore.instance.collection('messages');
    query
        .snapshots()
        .map((e) => e.docs.map((e) => e.data()['body'] as String).toList()
          ..addAll(_defaultMessages))
        .pipe(_subject);
  }

  @override
  void dispose() {
    super.dispose();
    _subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            StreamBuilder(
              // stream: query.snapshots(),
              stream: _subject,
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    final querySnapshot = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: querySnapshot.length,
                        itemBuilder: (context, index) =>
                            Text(querySnapshot[index]),
                      ),
                    );
                  // QuerySnapshot querySnapshot = snapshot.data;
                  // return Expanded(
                  //   child: ListView.builder(
                  //     itemCount: querySnapshot.size,
                  //     itemBuilder: (context, index) =>
                  //         Text(querySnapshot.docs[index].data()['body']),
                  //   ),
                  // );
                }
              },
            ),
            Container(
              child: TextFormField(
                inputFormatters: [TemplateTextInputFormatter()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
