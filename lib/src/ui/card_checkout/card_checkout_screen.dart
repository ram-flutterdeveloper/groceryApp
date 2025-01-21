import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/src/common_widget/name_text_field.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';

class CardCheckoutScreen extends StatefulWidget {
  const CardCheckoutScreen({super.key});

  @override
  State<CardCheckoutScreen> createState() => _CardCheckoutScreenState();
}

class _CardCheckoutScreenState extends State<CardCheckoutScreen> {
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
          "Checkout",
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
                        "Next",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Saved Cards",
                style: context.customExtraBold(Colors.black, 16),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const AppNetworkImage(
                          height: 50,
                          width: 50,
                          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeaqcsR_xDLZTOQ7G-NxCe7mLDxFe-xC2JC_DIojrF2CiVJRnviMf9fvGGFZyzyII3jdY&usqp=CAU',
                          backGroundColor: Colors.transparent),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "6895 8578 8578 5525",
                        style: context.customMedium(Colors.black, 16),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.radio_button_off_outlined,
                        color: Colors.grey.withOpacity(0.3),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const AppNetworkImage(
                          height: 50, width: 50, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIXY75wxXccxnFoger82T83BZxDPpMavUI1A&s', backGroundColor: Colors.transparent),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "6895 8578 8578 5525",
                        style: context.customMedium(Colors.black, 16),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.radio_button_off_outlined,
                        color: Colors.grey.withOpacity(0.3),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ExpansionTile(
                  minTileHeight: 0,
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  //trailing: SizedBox(),
                  childrenPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  tilePadding: const EdgeInsets.only(right: 10),
                  title: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          const AppNetworkImage(
                              height: 50,
                              width: 50,
                              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeaqcsR_xDLZTOQ7G-NxCe7mLDxFe-xC2JC_DIojrF2CiVJRnviMf9fvGGFZyzyII3jdY&usqp=CAU',
                              backGroundColor: Colors.transparent),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            "6895 8578 8578 5525",
                            style: context.customMedium(Colors.black, 16),
                          )),
                        ],
                      ),
                    ),
                  ),
                  children: const [
                    NameTextField(
                      name: 'Card Number',
                      initText: "2352 5285 8545 7528",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    NameTextField(
                      name: 'Card Holder Name',
                      initText: "Smith Watson",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: NameTextField(
                            name: 'Expiry Date',
                            initText: "09/22",
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: NameTextField(
                            name: 'CVV',
                            initText: "129",
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const AppNetworkImage(
                          height: 50, width: 50, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwiraGT0PrLTwZKDg-u25PAlVRgnkdeL96mA&s', backGroundColor: Colors.transparent),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "Paypal",
                        style: context.customMedium(Colors.black, 16),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.radio_button_off_outlined,
                        color: Colors.grey.withOpacity(0.3),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
