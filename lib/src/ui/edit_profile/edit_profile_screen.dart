import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/src/common_widget/name_text_field.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
          "Edit Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: APPCOLOR.lightGreen, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Update",
                        style: context.customRegular(Colors.white, 16),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: context.bodyAllPadding,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const AppNetworkImage(
                      height: 80,
                      width: 80,
                      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s",
                      radius: 90,
                      backGroundColor: Colors.white,
                      boxFit: BoxFit.fill,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(color: APPCOLOR.lightGreen, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Icon(
                              MdiIcons.pencil,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const NameTextField(
              name: "Name",
              initText: "Smith Mate",
            ),
            const SizedBox(
              height: 10,
            ),
            const NameTextField(
              name: "Email Address",
              initText: "SmithMate@example.com",
            ),
            const SizedBox(
              height: 10,
            ),
            const NameTextField(
              name: "Mobile Number",
              initText: "(205) 555-0100",
            ),
            const SizedBox(
              height: 10,
            ),
            const NameTextField(
              name: "Enter Address",
              initText: "8502 Preston Rd. inglewood, USA",
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        )),
      ),
    );
  }
}
