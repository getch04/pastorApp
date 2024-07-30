import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CommonItemCard extends StatelessWidget {
  const CommonItemCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.borderSize = 2,
    this.height = 100,
  });

  final String title;
  final Widget icon;
  final double height;
  final int borderSize;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double cardHeight =
              constraints.maxHeight < height ? constraints.maxHeight : height;
          final double fontSize = cardHeight / 3.9;

          return Container(
            // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            height: cardHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(
                color: MyColors.white,
                width: borderSize.toDouble(),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color.fromARGB(255, 3, 92, 164),
                  Color(0xff0ebef4),
                ],
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color:
              //         const Color.fromARGB(255, 164, 164, 164).withOpacity(0.3),
              //     blurRadius: 1,
              //     spreadRadius: 5,
              //     offset: Offset(0.5, 0.5),
              //   ),
              // ],
            ),
            child: Center(
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyles.title(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                      color: MyColors.white,
                    ),
                  ),
                ),
                leading: icon,
              ),
            ),
          );
        },
      ),
    );
  }
}
