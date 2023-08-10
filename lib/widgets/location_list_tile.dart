import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as math;
import 'package:placesearch/constants.dart';


class LocationListTile extends StatelessWidget {
  final String location;
  final VoidCallback press;

  const LocationListTile({super.key, required this.location, required this.press});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          horizontalTitleGap: 0,
          leading: Transform.rotate(angle: 45* math.pi/180,child: Icon(Icons.navigation, size: 20, color: secondaryColor20LightTheme,),),
          title: Text(location, maxLines: 2, overflow: TextOverflow.ellipsis),
        ),
        const Divider(
          height: 2,
          thickness: 2,
          color: secondaryColor5LightTheme,
        )
      ],
    );
  }
}