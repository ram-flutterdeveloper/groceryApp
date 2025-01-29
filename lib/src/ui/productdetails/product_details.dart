import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/src/data/allProduct_model.dart';
import 'package:grocery_app/src/logic/provider/home_provider.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  int selectedImage = 0;

  String productId = '';
  @override
  void initState() {
    super.initState();

    productId = widget.product.id;
    Future.delayed(Duration.zero, () {
      Provider.of<ProductProvider>(context, listen: false)
          .setProductPrice(double.parse(widget.product.discountPrice));

      Provider.of<ProductProvider>(context, listen: false)
          .similarProductprovider(context, widget.product.id);
    });

    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        selectedImage =
            (selectedImage + 1) % widget.product.productImages!.length;
      });
    });
  }

  double value = 3.5;

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
          "Item Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: CarouselSlider.builder(
                  itemCount: widget.product.productImages!.length,
                  itemBuilder: (context, index, realIndex) {
                    var productImage = widget.product.productImages![index];
                    return Image.network(productImage.url ??
                        'https://i.pinimg.com/originals/a5/f3/5f/a5f35fb23e942809da3df91b23718e8d.png');
                  },
                  options: CarouselOptions(
                    height: 300,
                    initialPage: selectedImage,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectedImage = index;
                      });
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.product.productImages!.map((url) {
                  int index = widget.product.productImages!.indexOf(url);
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedImage == index ? Colors.red : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name ?? "",
                      style: context.customExtraBold(Colors.black, 18),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${widget.product.discountPrice}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "\$${widget.product.basePrice}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text("10% OFF",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    ReadMoreText(
                      widget.product.description ?? "",
                      trimMode: TrimMode.Line,
                      trimLines: 2,
                      colorClickableText: APPCOLOR.appGreen,
                      trimCollapsedText: 'Read More',
                      trimExpandedText: 'Show less',
                      style: context.customMedium(APPCOLOR.balck1A1A1A, 14),
                    ),
                  ],
                ),
              ),
              Divider(),
              reviews(),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("Similar Products",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              similarProducts(),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget reviews() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Reviews & Ratings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            children: [
              Text("4.2",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingStars(
                    value: value,
                    onValueChanged: (v) {
                      //
                      setState(() {
                        value = v;
                      });
                    },
                    starBuilder: (index, color) => Icon(
                      Icons.star,
                      color: color,
                    ),
                    starCount: 5,
                    starSize: 20,
                    valueLabelColor: const Color(0xff9b9b9b),
                    valueLabelTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    valueLabelRadius: 10,
                    maxValue: 5,
                    starSpacing: 2,
                    maxValueVisibility: false,
                    valueLabelVisibility: false,
                    animationDuration: Duration(milliseconds: 1000),
                    valueLabelPadding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    valueLabelMargin: const EdgeInsets.only(right: 8),
                    starOffColor: const Color(0xffe7e8ea),
                    starColor: Colors.green,
                  ),
                  Text(
                    "April 10, 2023",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align items at the top
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/50'),
              ),
              SizedBox(width: 10),

              // Column for Text and RatingStars
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // Proper spacing
                      children: [
                        Text(
                          "Johnson Smith",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        RatingStars(
                          value: value,
                          starBuilder: (index, color) => Icon(
                            Icons.star,
                            color: color,
                          ),
                          starCount: 5,
                          starSize: 20,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: false,
                          valueLabelVisibility: false,
                          animationDuration: Duration(milliseconds: 1000),
                          valueLabelPadding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 8),
                          valueLabelMargin: const EdgeInsets.only(right: 8),
                          starOffColor: const Color(0xffe7e8ea),
                          starColor: Colors.green,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "April 10, 2023",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ReadMoreText(
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: APPCOLOR.appGreen,
            trimCollapsedText: 'Read More',
            trimExpandedText: 'Show less',
            style: context.customMedium(APPCOLOR.balck1A1A1A, 14),
          ),
        ],
      ),
    );
  }

  Widget similarProducts() {
    return SizedBox(
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
                              style: context
                                  .customMedium(
                                      Colors.grey.withOpacity(0.8), 12)
                                  .copyWith(
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
    );
  }

  // Widget bottomBar() {
  //   return Container(
  //     padding: EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Row(
  //           children: [
  //             IconButton(
  //               icon: Icon(Icons.remove_circle_outline),
  //               onPressed: () {
  //                 if (quantity > 1) {
  //                   setState(() => quantity--);
  //                 }
  //               },
  //             ),
  //             Text("$quantity",
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //             IconButton(
  //               icon: Icon(Icons.add_circle_outline),
  //               onPressed: () => setState(() => quantity++),
  //             ),
  //           ],
  //         ),
  //         Container(
  //           height: 50,
  //           // width: 0,
  //           decoration: BoxDecoration(
  //             color: APPCOLOR.lightGreen,
  //             borderRadius: BorderRadius.circular(5),
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Center(
  //                 child: Row(
  //               children: [
  //                 Text(
  //                   'Add to Cart',
  //                   style: TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white),
  //                 ),
  //                 SizedBox(
  //                   width: 20,
  //                 ),
  //                 Container(width: 2, height: 50, color: APPCOLOR.whiteFBFEFB),
  //                 SizedBox(
  //                   width: 20,
  //                 ),
  //                 Text(
  //                   "\$${widget.product.discountPrice ?? ""}",
  //                   style: TextStyle(
  //                       fontSize: 25,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white),
  //                 ),
  //               ],
  //             )),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget bottomBar() {
    return Consumer<ProductProvider>(
      builder: (context, cartProvider, child) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: cartProvider.decreaseQuantity,
                  ),
                  Text("${cartProvider.quantity}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: cartProvider.increaseQuantity,
                  ),
                ],
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: APPCOLOR.lightGreen,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Container(
                            width: 2, height: 50, color: APPCOLOR.whiteFBFEFB),
                        SizedBox(width: 10),
                        Text(
                          "\$${cartProvider.totalPrice}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


//   Widget _slider(BuildContext context) {
//   double height = MediaQuery.of(context).size.height * .43;
//   double statusBarHeight = MediaQuery.of(context).padding.top;

//   // Fetch product data from Provider
//   final productProvider = Provider.of<ProductProvider>(context);
//   Product? model = productProvider.selectedProduct; // Ensure you have a selected product

//   if (model == null) {
//     return Center(child: CircularProgressIndicator()); // Show loading if no product data
//   }

//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context,
//         PageRouteBuilder(
//           pageBuilder: (_, __, ___) => ProductPreview(
//             pos: _curSlider,
//             secPos: widget.secPos,
//             index: widget.index,
//             id: model.id,
//             imgList: sliderList,
//             list: widget.list,
//             video: model.video,
//             videoType: model.videType,
//             from: true,
//           ),
//         ),
//       );
//     },
//     child: Stack(
//       children: <Widget>[
//         Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.only(top: statusBarHeight + kToolbarHeight),
//           child: PageView.builder(
//             physics: const BouncingScrollPhysics(),
//             itemCount: sliderList.length,
//             scrollDirection: Axis.horizontal,
//             controller: _pageController,
//             reverse: false,
//             onPageChanged: (index) {
//               setState(() {
//                 _curSlider = index;
//               });
//             },
//             itemBuilder: (BuildContext context, int i) {
//               return sliderList[i] != "youtube"
//                   ? networkImageCommon(sliderList[i]!, height, true)
//                   : playIcon(model);
//             },
//           ),
//         ),
//         Positioned(
//           bottom: 30,
//           height: 20,
//           width: MediaQuery.of(context).size.width,
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               sliderList.length,
//               (index) => AnimatedContainer(
//                 duration: const Duration(milliseconds: 500),
//                 width: _curSlider == index ? 30.0 : 8.0,
//                 height: 8.0,
//                 margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       color: Theme.of(context).colorScheme.primary),
//                   borderRadius: BorderRadius.circular(20.0),
//                   color: _curSlider == index
//                       ? Theme.of(context).colorScheme.primary
//                       : Colors.transparent,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         indicatorImage(model),
//       ],
//     ),
//   );
// }


