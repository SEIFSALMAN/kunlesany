import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Card(
          color: onPressed != null ? Colors.blue[300] : null,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w200,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}