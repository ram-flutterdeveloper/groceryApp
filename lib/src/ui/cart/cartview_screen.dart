import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/src/ui/bestdeal/bestdeal_screen.dart';
import 'package:grocery_app/src/ui/cart/cart_item.dart';
import 'package:grocery_app/src/ui/widgets/custom_icon_button.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Mycart extends StatefulWidget {
  const Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // leading: Center(
        //   child: SizedBox(
        //     height: 20,
        //     width: 20,
        //     child: InkWell(
        //         onTap: () {
        //           Navigator.of(context).pop();
        //         },
        //         child: SvgPicture.asset(
        //           APPASSETS.back,
        //           height: 20,
        //           width: 20,
        //         )),
        //   ),
        // ),
        title: Center(
          child: const Text(
            'Cart 🛒',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // actions: [
        //   InkWell(
        //     onTap: () {},
        //     child: Icon(
        //       MdiIcons.magnify,
        //       size: 35,
        //     ),
        //   )
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, index) => Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
                child: const Divider(thickness: 1),
              ),
              itemCount: 10,
              itemBuilder: (context, index) => CartItem(
                      //product: controller.products[index],
                      )
                  .animate(delay: (100 * index).ms)
                  .fade()
                  .slideX(
                    duration: 300.ms,
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Best Deal",
                  style: context.customExtraBold(Colors.black, 18),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const BestDealScreen();
                    },
                  ));
                },
                child: Text(
                  "See All",
                  style: context.customMedium(APPCOLOR.lightGreen, 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 222,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 5, top: 5),
                  child: Container(
                    height: 215,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 1,
                            offset: const Offset(5, 5),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                color: APPCOLOR.bgGrey,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Stack(
                              alignment: Alignment.center,
                              children: [
                                AppNetworkImage(
                                    height: 70,
                                    width: 70,
                                    imageUrl:
                                        "https://5.imimg.com/data5/SELLER/Default/2024/2/385126988/OL/DA/VW/8627346/1l-fortune-sunflower-oil.jpg",
                                    backGroundColor: Colors.transparent),
                                Positioned(
                                    right: 5,
                                    top: 5,
                                    child: Icon(Icons.favorite_border))
                              ],
                            ),
                          ),
                          Text(
                            "Fortune Arhar Dal (Toor Dal)",
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                context.customMedium(APPCOLOR.balck1A1A1A, 14),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "500 ML",
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.customMedium(
                                Colors.grey.withOpacity(0.8), 12),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  Text(
                                    "\$12",
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.customSemiBold(
                                        Colors.black, 12),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "\$14",
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context
                                        .customMedium(
                                            Colors.grey.withOpacity(0.8), 12)
                                        .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                  ),
                                ],
                              )),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: APPCOLOR.lightGreen,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Add',
                                      style: context.customRegular(
                                          Colors.white, 12),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
