import 'package:flutter/material.dart';
class ButtonItem extends StatelessWidget {
  final onPressed;
  final IconData iconData;
  final Color buttonColor;
  final String textButton;
  const ButtonItem({Key? key,required this.onPressed, required this.iconData, required this.buttonColor, required this.textButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(
          children: [
            Icon(iconData, color: buttonColor,),
            const SizedBox(height: 5,),
            Text(textButton.toUpperCase(), style: TextStyle(color: buttonColor, fontWeight: FontWeight.bold),)
          ],
        ),

      ),
    );
  }
}
