import 'package:flutter/material.dart';
import '../../../constants/ui_files.dart';

class InputRow extends StatelessWidget {
  const InputRow({
    Key key,
    @required this.textController,
    this.field,
  }) : super(key: key);

  final TextEditingController textController;
  final String field;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$field:",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Expanded(
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter your ${field.toLowerCase()}";
              } else {
                return null;
              }
            },
            controller: textController,
            decoration: InputDecoration(
              hintText: "What's your ${field.toLowerCase()}",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ).padding(horizontal: 20),
        ),
      ],
    );
  }
}
