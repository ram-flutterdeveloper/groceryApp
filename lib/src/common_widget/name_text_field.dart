import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';

class NameTextField extends StatelessWidget {
  final String name;
  final String? initText;
  const NameTextField({super.key, required this.name, this.initText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(border: Border.all(color: APPCOLOR.lightGreen), borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: context.customMedium(APPCOLOR.lightGreen, 14),
            ),
            Expanded(
                child: TextFormField(
              controller: TextEditingController(text: initText ?? ""),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.only(
                    left: 0,
                    right: 0,
                    bottom: 5,
                    top: 5,
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
