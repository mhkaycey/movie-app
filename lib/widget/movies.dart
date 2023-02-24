import 'package:flutter/material.dart';

class MoviesWidget extends StatelessWidget {
  // final Image image;
  final String imageString;
  final Function click;
  const MoviesWidget(
      {super.key, required this.imageString, required this.click});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 200,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              click();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(imageString), fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
