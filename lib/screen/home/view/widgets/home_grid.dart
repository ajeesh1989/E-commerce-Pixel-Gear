import 'package:flutter/material.dart';
import 'package:pixel_gear/core/colors.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({
    super.key,
    required this.height,
    required this.width,
    required this.gridList,
    required this.gridNames,
  });

  final double height;
  final double width;
  final List<String> gridList;
  final List<String> gridNames;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext ctx, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: height * 0.10,
                  width: width * 0.30,
                  decoration: BoxDecoration(
                    color: greycolor,
                    image: DecorationImage(
                        image: NetworkImage(gridList[index]),
                        fit: BoxFit.cover),
                  ),
                ),
                kheight10,
                Text(gridNames[index])
              ],
            ),
          );
        },
      ),
    );
  }
}
