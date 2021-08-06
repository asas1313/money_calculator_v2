import 'package:flutter/material.dart';

class BottomTextWidget extends StatelessWidget {
  final Function()? onPressed;
  final String text1;
  final String text2;

  const BottomTextWidget({
    required this.onPressed,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(text: text1),
        ])),
        TextButton(
            onPressed: onPressed,
            child: Text(
              " $text2",
              style: TextStyle(color: Colors.blue),
            )),
      ],
    );
  }
}
