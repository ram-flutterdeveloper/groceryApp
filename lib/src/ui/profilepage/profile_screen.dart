import 'package:flutter/material.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/src/logic/provider/home_provider.dart';
import 'package:grocery_app/src/ui/card_checkout/card_checkout_screen.dart';
import 'package:grocery_app/src/ui/edit_profile/edit_profile_screen.dart';
import 'package:grocery_app/src/ui/map/google_map.dart';
import 'package:grocery_app/src/ui/mapscreen/map_screen.dart';
import 'package:grocery_app/src/ui/message/message_screen.dart';
import 'package:grocery_app/src/ui/notification/notification_screen.dart';
import 'package:grocery_app/src/ui/rating_review/rating_review_screen.dart';
import 'package:grocery_app/src/ui/static_page/static_page_screen.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 180.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              leading: const SizedBox(),
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;

                return FlexibleSpaceBar(
                    centerTitle: true,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        top > 100
                            ? Text(
                                "My  Profile",
                                style:
                                    context.customExtraBold(Colors.white, 14),
                              )
                            : const SizedBox(),

                        const SizedBox(
                          height: 30,
                        ),
                        //Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Stack(
                              children: [
                                AppNetworkImage(
                                  height: top < 150 ? 30 : 50,
                                  width: top < 150 ? 30 : 50,
                                  imageUrl:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s",
                                  radius: 90,
                                  backGroundColor: Colors.white,
                                  boxFit: BoxFit.fill,
                                ),
                                top > 100
                                    ? Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                              color: APPCOLOR.lightGreen,
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                            child: Icon(
                                              MdiIcons.pencil,
                                              size: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ))
                                    : const SizedBox(),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Smith Mate",
                                  style: context.customExtraBold(
                                      top < 100 ? Colors.black : Colors.white,
                                      14),
                                ),
                                Text(
                                  'smithmate@example.com',
                                  style: context.customRegular(
                                      top < 100 ? Colors.black : Colors.white,
                                      10),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                    background: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: APPCOLOR.lightGreen,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                    ));
              }),
            ),
          ];
        },
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const EditProfileScreen();
                          },
                        ));
                      },
                      leading: Icon(MdiIcons.pencilBoxOutline),
                      title: const Text('Edit Profile'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.lockOutline),
                      title: const Text('Change Password'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const CardCheckoutScreen();
                          },
                        ));
                      },
                      leading: Icon(MdiIcons.cardOutline),
                      title: const Text('Payment Method'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(MdiIcons.cubeOutline),
                      title: const Text('My Order'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const NotificationScreen();
                          },
                        ));
                      },
                      leading: Icon(MdiIcons.bellOutline),
                      title: const Text('Notifications'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const RatingReviewScreen();
                          },
                        ));
                      },
                      leading: Icon(MdiIcons.starOutline),
                      title: const Text('Rating & Review'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const MessageScreen();
                          },
                        ));
                      },
                      leading: Icon(MdiIcons.messageOutline),
                      title: const Text('Driver Message'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const StaticPage(
                              title: "Privacy Policy",
                            );
                          },
                        ));
                      },
                      leading: Icon(MdiIcons.shieldCheckOutline),
                      title: const Text('Privacy Policy'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const StaticPage(
                              title: "Terms & Conditions",
                            );
                          },
                        ));
                      },
                      leading: Icon(MdiIcons.noteTextOutline),
                      title: const Text('Term & Conditions'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(MdiIcons.basketOutline),
                      title: const Text('Grocery List'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return MapScreen();
                          },
                        ));
                      },
                      leading: Icon(MdiIcons.basketOutline),
                      title: const Text('Map List'),
                      trailing: Icon(MdiIcons.chevronRight),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("fjnghkjfjghj");
                Provider.of<ProductProvider>(context, listen: false)
                    .customerLogOut(context);
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: APPCOLOR.lightGreen,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      MdiIcons.logout,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Logout",
                      style: context.customMedium(Colors.white, 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
