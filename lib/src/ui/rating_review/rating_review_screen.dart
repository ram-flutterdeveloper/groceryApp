import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RatingReviewScreen extends StatefulWidget {
  const RatingReviewScreen({super.key});

  @override
  State<RatingReviewScreen> createState() => _RatingReviewScreenState();
}

class _RatingReviewScreenState extends State<RatingReviewScreen> {
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
          "Rider Review",
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
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: APPCOLOR.lightGreen, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Submit",
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppNetworkImage(
                    height: 100,
                    width: 100,
                    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdQLwDqDwd2JfzifvfBTFT8I7iKFFevcedYg&s",
                    backGroundColor: Colors.white,
                    boxFit: BoxFit.cover,
                    radius: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Make Johnson",
                style: context.customExtraBold(Colors.black, 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Delivery Boy",
                style: context.customMedium(Colors.grey.withOpacity(0.9), 14),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Please Rate Delivery Service",
                style: context.customMedium(Colors.black, 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    MdiIcons.star,
                    color: APPCOLOR.lightGreen,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    MdiIcons.star,
                    color: APPCOLOR.lightGreen,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    MdiIcons.star,
                    color: APPCOLOR.lightGreen,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    MdiIcons.star,
                    color: APPCOLOR.lightGreen,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    MdiIcons.star,
                    color: APPCOLOR.lightGreen,
                    size: 40,
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Add Tips",
                    style: context.customMedium(Colors.black, 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "No Tips",
                    style: context.customMedium(Colors.black, 14),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(color: APPCOLOR.lightGreen, borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        '\$2',
                        style: context.customRegular(Colors.white, 12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '\$5',
                    style: context.customRegular(Colors.black, 12),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '\$10',
                    style: context.customRegular(Colors.black, 12),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '\$20',
                    style: context.customRegular(Colors.black, 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                minLines: 5,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Add a comment",
                  hintStyle: context.customRegular(Colors.grey.withOpacity(0.8), 16),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.2))),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.2))),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.2))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
