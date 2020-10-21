import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:returning_home/ui/widgets/text_input_formatter.dart';
import 'package:rxdart/rxdart.dart';

class Message extends StatefulHookWidget {
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
    final Query query = FirebaseFirestore.instance.collection('messages');
    query
        .snapshots()
        .map((e) => e.docs.map((e) => e.data()['body'] as String).toList()
          ..addAll(_defaultMessages))
        .pipe(_subject);
  }

  @override
  void dispose() {
    super.dispose();
    _closeSubject();
  }

  Future<void> _closeSubject() async {
    await _subject.done;
    await _subject.close();
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
              stream: _subject,
              builder: (context, AsyncSnapshot<List<String>> snapshot) {
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
                        itemCount: querySnapshot.length,
                        itemBuilder: (context, index) =>
                            Text(querySnapshot[index]),
                      ),
                    );
                    break;
                  case ConnectionState.done:
                    break;
                }
                return Container();
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
