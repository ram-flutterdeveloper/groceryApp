import 'package:flutter/material.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            title,
            style: context.customExtraBold(Colors.black, 18),
          ),
          const SizedBox(height: 24),
          Divider(),
        ],
      ),
    );
  }
}
