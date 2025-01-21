import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationScreen> {
  final notificationList = [
    NotificationModel("Today", [
      {"title": "30% Special Discount!", "subtitle": "Special promotion only valid today", "icon": MdiIcons.percentCircleOutline},
      {"title": "Password Update Successfull", "subtitle": "Your password update successfully", "icon": MdiIcons.lockOutline},
    ]),
    NotificationModel("Yesterday", [
      {"title": "Account Setup Successful", "subtitle": "Your account has been created", "icon": Icons.person_outline},
      {"title": "Redeem your gift cart", "subtitle": "You have get one gift card", "icon": MdiIcons.gift},
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  APPASSETS.back,
                  height: 20,
                  width: 20,
                )),
          ),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
          padding: context.bodyAllPadding,
          child: ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationList[index].title,
                    style: context.customExtraBold(Colors.black, 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    itemCount: notificationList[index].notification.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index2) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: APPCOLOR.lightGreen,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      notificationList[index].notification[index2]['icon'],
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      notificationList[index].notification[index2]['title'],
                                      style: context.customExtraBold(Colors.black, 18),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      notificationList[index].notification[index2]['subtitle'],
                                      style: context.customMedium(Colors.grey.withOpacity(0.7), 14),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            },
          )),
    );
  }
}

class NotificationModel {
  String title;
  List<Map<String, dynamic>> notification;

  NotificationModel(this.title, this.notification);
}
