import 'dart:ui';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';

class FilesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent Files",
                style: textStyle(20, textColor, FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image(
                            width: 70,
                            height: 70,
                            image: NetworkImage(
                                'https://www.nyhabitat.com/de/blog/wp-content/uploads/2013/02/Times-Square-Manhattan-New-York-NYC-Kreuzung-Welt.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Home.jpg",
                          style: textStyle(13, textColor, FontWeight.w500),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
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
                    children: [
                      SimpleShadow(
                        opacity: 0.7,
                        color: Colors.grey,
                        offset: Offset(5, 5),
                        sigma: 5,
                        child: Image.asset(
                          'images/folder.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
