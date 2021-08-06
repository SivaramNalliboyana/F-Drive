import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';

class RecentFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                padding: const EdgeInsets.only(right: 13.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image(
                        width: 65,
                        height: 60,
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
      ],
    );
  }
}
