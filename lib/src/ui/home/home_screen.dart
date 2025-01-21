import 'package:flutter/material.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/src/ui/bestdeal/bestdeal_screen.dart';
import 'package:grocery_app/src/ui/fruitvegidetail/fruit_veggie_detail.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: context.bodyAllPadding.copyWith(
            top: 0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
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
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: APPCOLOR.bgGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.transparent,
                            prefixIcon: Icon(MdiIcons.magnify),
                            hintText: 'Search',
                            hintStyle: context.customRegular(APPCOLOR.grey666666, 18),
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: APPCOLOR.lightGreen,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Icon(
                          MdiIcons.tuneVariant,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Shop By Category",
                        style: context.customExtraBold(Colors.black, 18),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const FruitVeggieDetail();
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
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 8,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.2),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: APPCOLOR.bgGrey,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Vegitables and Fruits",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.customMedium(APPCOLOR.balck1A1A1A, 14),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(color: Colors.greenAccent.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 15,
                          left: 15,
                          child: SizedBox(
                              width: 200,
                              child: Text(
                                "World Food Festival, Bring the world to your Kitchen!",
                                style: context.customExtraBold(Colors.black, 18),
                              ))),
                      Positioned(
                        bottom: 15,
                        left: 15,
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: APPCOLOR.lightGreen,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                              child: Text(
                            'Shop now',
                            style: context.customRegular(Colors.white, 14),
                          )),
                        ),
                      ),
                      const Positioned(
                          right: 15,
                          bottom: 15,
                          child: AppNetworkImage(
                              height: 130,
                              width: 150,
                              imageUrl: 'https://e7.pngegg.com/pngimages/742/816/png-clipart-coca-cola-can-illustration-coca-cola-soft-drink-surge-pepsi-coke-sweetness-cola-thumbnail.png',
                              backGroundColor: Colors.transparent))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                                    Expanded(
                                        child: Row(
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
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // SizeConfig().init(context);
    super.initState();
  }
}
