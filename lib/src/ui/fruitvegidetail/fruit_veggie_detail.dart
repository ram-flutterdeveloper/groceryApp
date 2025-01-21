import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FruitVeggieDetail extends StatefulWidget {
  const FruitVeggieDetail({super.key});

  @override
  State<FruitVeggieDetail> createState() => _FruitVeggieDetailState();
}

class _FruitVeggieDetailState extends State<FruitVeggieDetail> {
  int activeIndex = 0;

  void changeActiveIndex(int currentActiveIndex) {
    activeIndex = currentActiveIndex;
    setState(() {});
  }

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
          "Vegetables & Fruits",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {},
              child: Icon(
                MdiIcons.magnify,
                size: 35,
              ),
            ),
          )
        ],
      ),
      body: Row(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: 100,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    changeActiveIndex(index);
                  },
                  child: SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: activeIndex == index ? Colors.greenAccent.withOpacity(0.1) : APPCOLOR.bgGrey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: AppNetworkImage(
                                    height: 80,
                                    width: 80,
                                    imageUrl: 'https://i.pinimg.com/originals/a5/f3/5f/a5f35fb23e942809da3df91b23718e8d.png',
                                    backGroundColor: APPCOLOR.bgGrey,
                                    radius: 10,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 3,
                              height: 100,
                              color: activeIndex == index ? APPCOLOR.lightGreen : Colors.transparent,
                            )
                          ],
                        ),
                        Text(
                          "Fresh Vegitables",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: activeIndex == index ? context.customExtraBold(APPCOLOR.balck1A1A1A, 14) : context.customMedium(APPCOLOR.balck1A1A1A, 14),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.1), crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Container(
                  height: 300,
                  // width: 150,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [
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
                          decoration: BoxDecoration(color: APPCOLOR.bgGrey, borderRadius: BorderRadius.circular(15)),
                          child: const Stack(
                            alignment: Alignment.center,
                            children: [
                              AppNetworkImage(
                                  height: 70,
                                  width: 70,
                                  imageUrl: "https://5.imimg.com/data5/SELLER/Default/2024/2/385126988/OL/DA/VW/8627346/1l-fortune-sunflower-oil.jpg",
                                  backGroundColor: Colors.transparent),
                              Positioned(right: 5, top: 5, child: Icon(Icons.favorite_border))
                            ],
                          ),
                        ),
                        Text(
                          "Fortune Arhar Dal (Toor Dal)",
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.customMedium(APPCOLOR.balck1A1A1A, 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "500 ML",
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.customMedium(Colors.grey.withOpacity(0.8), 12),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "\$12",
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.customSemiBold(Colors.black, 12),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "\$14",
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.customMedium(Colors.grey.withOpacity(0.8), 12).copyWith(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: APPCOLOR.lightGreen,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Add',
                                    style: context.customRegular(Colors.white, 12),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
