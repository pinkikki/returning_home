import 'package:flutter/material.dart';
import 'package:returning_home/widgets/text_input_formatter.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final _formKey = GlobalKey<FormState>();

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
      child: Container(
        child: TextFormField(
          inputFormatters: [TextTextInputFormatter()],
        ),
      ),
    ));
  }
}
