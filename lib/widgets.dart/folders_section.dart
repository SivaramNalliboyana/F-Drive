import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';

class FoldersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.00001),
                  offset: Offset(10, 10),
                  blurRadius: 5),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/folder.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Text(
                "4k movies",
                style: textStyle(18, textColor, FontWeight.bold),
              ),
              Text(
                "911 Items",
                style: textStyle(14, Colors.grey[400], FontWeight.bold),
              )
            ],
          ),
        );
      },
    );
  }
}
