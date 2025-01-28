import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/src/logic/provider/home_provider.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class FruitVeggieDetail extends StatefulWidget {
  const FruitVeggieDetail({super.key});

  @override
  State<FruitVeggieDetail> createState() => _FruitVeggieDetailState();
}

class _FruitVeggieDetailState extends State<FruitVeggieDetail> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false)
        .getAllcategory(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        children: [filterCategory(), productWidget()],
      ),
    );
  }

  Widget productWidget() 
  {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      if (provider.isLoadingg) {
        return Padding(
          padding: const EdgeInsets.only(left: 120),
          child: CircularProgressIndicator(),
        );
      } else if (provider.products.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Center(child: Text('No products available')),
        );
      } else {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = (constraints.maxWidth - 20) / 2;
                final itemHeight = itemWidth * 1.5;

                return GridView.builder(
                  itemCount: provider.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: itemWidth / itemHeight,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    var product = provider.products[index];
                    return Container(
                      height: itemHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 1,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: itemWidth *
                                  0.6, // Adjust height for image container
                              width: itemWidth,
                              decoration: BoxDecoration(
                                color: APPCOLOR.bgGrey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  AppNetworkImage(
                                    height: 70,
                                    width: 70,
                                    imageUrl: product
                                            .productImages!.first.url ??
                                        "https://5.imimg.com/data5/SELLER/Default/2024/2/385126988/OL/DA/VW/8627346/1l-fortune-sunflower-oil.jpg",
                                    backGroundColor: Colors.transparent,
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: Icon(Icons.favorite_border),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              product.name ?? " ",
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.customMedium(
                                  APPCOLOR.balck1A1A1A, 14),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              product.unit ?? " ",
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.customMedium(
                                Colors.grey.withOpacity(0.8),
                                12,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$${product.discountPrice ?? " "}",
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.customSemiBold(
                                          Colors.black, 12),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "\$${product.basePrice ?? " "}",
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context
                                          .customMedium(
                                            Colors.grey.withOpacity(0.8),
                                            12,
                                          )
                                          .copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
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
                                          style: context.customRegular(
                                              Colors.white, 12),
                                        ),
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
                );
              },
            ),
          ),
        );
      }
    });
  }

  Widget filterCategory() {
    final activeIndexProvider = Provider.of<ProductProvider>(context);
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      if (provider.iscategroyloading) {
        return Center(child: CircularProgressIndicator());
      } else if (provider.categoryList.isEmpty) {
        return Center(child: Text('No products available'));
      } else {
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          width: 100,
          child: ListView.builder(
            itemCount: provider.categoryList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var category = provider.categoryList[index];
              return InkWell(
                onTap: () {
                  provider.isLoadingg = true;
                  provider.gettAllProduct(context, "/category/${category.id}");
                  activeIndexProvider.setActiveIndex(index);
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
                                  color:
                                      activeIndexProvider.activeIndex == index
                                          ? Colors.greenAccent.withOpacity(0.1)
                                          : APPCOLOR.bgGrey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: AppNetworkImage(
                                  height: 80,
                                  width: 80,
                                  imageUrl: category.image ??
                                      'https://i.pinimg.com/originals/a5/f3/5f/a5f35fb23e942809da3df91b23718e8d.png',
                                  backGroundColor: APPCOLOR.bgGrey,
                                  radius: 10,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 3,
                            height: 100,
                            color: activeIndexProvider.activeIndex == index
                                ? APPCOLOR.lightGreen
                                : Colors.transparent,
                          ),
                        ],
                      ),
                      Text(
                        category.name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: activeIndexProvider.activeIndex == index
                            ? context.customExtraBold(APPCOLOR.balck1A1A1A, 14)
                            : context.customMedium(APPCOLOR.balck1A1A1A, 14),
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
