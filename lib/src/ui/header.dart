import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          MdiIcons.mapMarkerOutline,
          color: APPCOLOR.appGreen,
          size: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Home",
                  style: context.customMedium(APPCOLOR.black333333, 18),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  MdiIcons.chevronDown,
                  color: APPCOLOR.black333333,
                  size: 30,
                )
              ],
            ),
            Text(
              "639| Elgin St. Celina, Delaware 10299",
              style: context.customMedium(APPCOLOR.grey666666, 14),
            ),
          ],
        )),
        const SizedBox(
          width: 10,
        ),
        Icon(
          MdiIcons.shoppingOutline,
          color: APPCOLOR.balck1A1A1A,
          size: 30,
        ),
      ],
    );
  }
}
