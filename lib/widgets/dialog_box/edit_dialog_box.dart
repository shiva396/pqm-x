import 'package:flutter/material.dart';

class EditTitleDialog extends StatelessWidget {
  final String initialTitle;
  final TextEditingController titleController;

  EditTitleDialog({super.key, required this.initialTitle})
      : titleController = TextEditingController(text: initialTitle);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Pond Name'),
      content: TextField(
        controller: titleController,
        decoration: const InputDecoration(
          labelText: 'Pond Name',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(titleController.text.trim());
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
