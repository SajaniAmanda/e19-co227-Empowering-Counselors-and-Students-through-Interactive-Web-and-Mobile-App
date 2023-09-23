import 'package:flutter/material.dart';

class CustomControlButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color basiccolor;
  final Function() function;
  const CustomControlButton({
    super.key,
    required this.text,
    required this.color,
    required this.basiccolor,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: ElevatedButton(
          onPressed: () => function,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return color; //<-- SEE HERE
                }
                return basiccolor; // Defer to the widget's default.
              },
            ),
          ),
          child: Text(
            text,
          )),
    );
  }
}
