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
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.001),
                          offset: Offset(10, 10),
                          blurRadius: 10),
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.001),
                          offset: Offset(-10, 10),
                          blurRadius: 10)
                    ],
                  ),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('images/folder.png'),
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
