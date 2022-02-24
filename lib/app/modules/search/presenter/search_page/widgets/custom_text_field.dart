import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.onChanged,
    this.onPressed,
  }) : super(key: key);

  final Function(String)? onChanged;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: EdgeInsets.zero,
        suffix: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
