import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/src/logic/provider/home_provider.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class BestDealScreen extends StatefulWidget {
  const BestDealScreen({super.key});

  @override
  State<BestDealScreen> createState() => _BestDealScreenState();
}

class _BestDealScreenState extends State<BestDealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
            "Best Deal",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Icon(
                MdiIcons.magnify,
                size: 35,
              ),
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            height: 80,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: APPCOLOR.lightGreen,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Stack(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        const Positioned(
                          left: 20,
                          bottom: 0,
                          top: 0,
                          right: 0,
                          child: AppNetworkImage(
                            height: 70,
                            width: 70,
                            radius: 10,
                            imageUrl:
                                "https://5.imimg.com/data5/SELLER/Default/2024/2/385126988/OL/DA/VW/8627346/1l-fortune-sunflower-oil.jpg",
                            backGroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '2 Items',
                        style: context.customRegular(Colors.white, 18),
                      ),
                      Text(
                        '\$25',
                        style: context.customExtraBold(Colors.white, 20),
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'View Cart',
                    style: context.customMedium(Colors.white, 24),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: itemBestdeal());
  }

  Widget itemBestdeal() {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      if (provider.isBestdealingloading) {
        return Center(child: CircularProgressIndicator());
      } else if (provider.bestdeal.isEmpty) {
        return Center(child: Text('No products available'));
      } else {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            itemCount: provider.bestdeal.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              var bestdealproduct = provider.bestdeal[index];
              return Container(
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
                        height: 160,
                        width: MediaQuery.sizeOf(context).width,
                        // width: 150,
                        decoration: BoxDecoration(
                            color: APPCOLOR.bgGrey,
                            borderRadius: BorderRadius.circular(15)),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AppNetworkImage(
                                height: 150,
                                width: 140,
                                imageUrl:
                                    bestdealproduct.productImages?.first.url ??
                                        "",
                                backGroundColor: Colors.transparent),
                            Positioned(
                                right: 5,
                                top: 5,
                                child: Icon(Icons.favorite_border))
                          ],
                        ),
                      ),
                      Text(
                        bestdealproduct.name ?? "",
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.customMedium(APPCOLOR.balck1A1A1A, 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        bestdealproduct.unit ?? "",
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.customMedium(
                            Colors.grey.withOpacity(0.8), 12),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$${bestdealproduct.discountPrice ?? ""}  ",
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.customSemiBold(Colors.black, 12),
                              ),
                              Text(
                                "\$${bestdealproduct.basePrice ?? ""}",
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context
                                    .customMedium(
                                      Colors.grey.withOpacity(0.8),
                                      12,
                                    )
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                color: APPCOLOR.lightGreen,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'Add',
                                  style:
                                      context.customRegular(Colors.white, 12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
