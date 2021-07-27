import 'package:flutter/material.dart';

class UploadOptions extends StatelessWidget {
  Widget colouredContainer(Color bgcolor, Image child) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: bgcolor),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            colouredContainer(
              Colors.lightBlue.withOpacity(0.3),
              Image.asset(
                'images/image.png',
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
            colouredContainer(
              Colors.pink.withOpacity(0.3),
              Image.asset(
                'images/play.png',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
          ],
        )
      ],
    );
  }
}
