import 'package:flutter/material.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/src/data/product_model.dart';
import 'package:grocery_app/src/logic/provider/home_provider.dart';
import 'package:grocery_app/src/ui/header.dart';
import 'package:grocery_app/src/ui/widgets/custom_title.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // List<ProductModel> _favProducts = [
  //   ProductModel("", 'Bell pepper red', '7pcs', '\$4.99'),
  //   ProductModel("", 'Ginger', '1kg', '\$4.99'),
  //   ProductModel("", 'Egg pasta', '30gm', '\$15.9'),
  // ];

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false)
        .gettAllWishList(context);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(left: 30),
        //   child: Container(
        //     height: 80,
        //     width: MediaQuery.sizeOf(context).width,
        //     decoration: BoxDecoration(
        //         color: APPCOLOR.lightGreen,
        //         borderRadius: BorderRadius.circular(15)),
        //     child: Padding(
        //       padding: const EdgeInsets.all(10),
        //       child: Row(
        //         children: [
        //           SizedBox(
        //             width: 80,
        //             child: Stack(
        //               children: [
        //                 Container(
        //                   height: 70,
        //                   width: 70,
        //                   decoration: BoxDecoration(
        //                       color: Colors.white.withOpacity(0.5),
        //                       borderRadius: BorderRadius.circular(10)),
        //                 ),
        //                 const Positioned(
        //                   left: 20,
        //                   bottom: 0,
        //                   top: 0,
        //                   right: 0,
        //                   child: AppNetworkImage(
        //                     height: 70,
        //                     width: 70,
        //                     radius: 10,
        //                     imageUrl:
        //                         "https://5.imimg.com/data5/SELLER/Default/2024/2/385126988/OL/DA/VW/8627346/1l-fortune-sunflower-oil.jpg",
        //                     backGroundColor: Colors.white,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 '2 Items',
        //                 style: context.customRegular(Colors.white, 18),
        //               ),
        //               Text(
        //                 '\$25',
        //                 style: context.customExtraBold(Colors.white, 20),
        //               )
        //             ],
        //           ),
        //           const Spacer(),
        //           Text(
        //             'View Cart',
        //             style: context.customMedium(Colors.white, 24),
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           const Icon(
        //             Icons.arrow_forward,
        //             color: Colors.white,
        //             size: 35,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        body: Padding(
          padding: context.bodyAllPadding.copyWith(
            top: 0,
          ),
          child: Column(
            children: [
              Header(),

              itemList(),

              Consumer<ProductProvider>(
                  builder: (context, wishListProvider, _) {
                return wishListProvider.totalItems > 0
                    ? Padding(
                        padding: const EdgeInsets.only(),
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
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '2 Items',
                                      style: context.customRegular(
                                          Colors.white, 18),
                                    ),
                                    Text(
                                      '\$25',
                                      style: context.customExtraBold(
                                          Colors.white, 20),
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
                      )
                    : SizedBox.shrink();
              }),

              // Padding(
              //   padding:
              //       const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 78),
              //   child: NectarButton(
              //     onPressed: () {},
              //     text: 'Add All To Cart',
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemList() {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      print(
          "sdhfgkj  ${provider.wishListItem.length}   ${provider.isWishListItemLoadingg}");
      if (provider.isWishListItemLoadingg) {
        return Expanded(child: Center(child: CircularProgressIndicator()));
      } else if (provider.wishListItem.isEmpty) {
        return Expanded(child: Center(child: Text('No products available')));
      } else {
        return Expanded(
          child: ListView.separated(
            itemCount: provider.wishListItem.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemBuilder: (_, index) {
              final item = provider.wishListItem[index];
              final product = item.product!;
              final productId = product.id!;

              final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    (0.5 / provider.wishListItem.length) * index,
                    1,
                    curve: Curves.easeOut,
                  ),
                ),
              );

              _animationController.forward(from: 0);

              return Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: APPCOLOR.bgGrey,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AppNetworkImage(
                            imageUrl:
                                "https://i.pinimg.com/originals/a5/f3/5f/a5f35fb23e942809da3df91b23718e8d.png",
                            backGroundColor: APPCOLOR.bgGrey,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              product.name ?? "",

                              style: context.customMedium(
                                  APPCOLOR.balck1A1A1A, 14),
                              //textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\$${product.discountPrice}",
                                  style:
                                      context.customSemiBold(Colors.black, 14),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "\$${product.basePrice ?? ""}",
                                  style: context
                                      .customMedium(
                                          Colors.grey.withOpacity(0.8), 12)
                                      .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Add to Cart Button
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: provider.isLoading[productId] ?? false
                          ? null
                          : () => provider.addToCart(context, productId),
                      child: Container(
                        height: 35,
                        width: 50,
                        decoration: BoxDecoration(
                          color: provider.cartItems.contains(productId)
                              ? Colors.grey
                              : APPCOLOR.lightGreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: provider.isLoading[productId] ?? false
                              ? CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 2)
                              : Text(
                                  provider.cartItems.contains(productId)
                                      ? 'Added'
                                      : 'Add',
                                  style:
                                      context.customRegular(Colors.white, 14),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => Divider(),
          ),
        );
        // Expanded(
        //   child: ListView.separated(
        //     itemCount: provider.wishListItem.length,
        //     shrinkWrap: true,
        //     padding: const EdgeInsets.all(16),
        //     itemBuilder: (_, index) {
        //       _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        //         CurvedAnimation(
        //           parent: _animationController,
        //           curve: Interval(
        //             (0.5 / provider.wishListItem.length) * index,
        //             1,
        //             curve: Curves.easeOut,
        //           ),
        //         ),
        //       );
        //       _animationController.forward(from: 0);
        //       var item = provider.wishListItem[index];
        //       return AnimatedBuilder(
        //         animation: _animationController,
        //         builder: (_, child) {
        //           return FadeTransition(
        //             opacity: _animation,
        //             child: Transform(
        //               transform: Matrix4.translationValues(
        //                 0.0,
        //                 50 * (1.0 - _animation.value),
        //                 0.0,
        //               ),
        //               child: child,
        //             ),
        //           );
        //         },
        //         child: ListTile(
        //           onTap: () {},
        //           leading: Container(
        //             decoration: BoxDecoration(
        //               color: Colors.greenAccent.withOpacity(0.1),
        //               borderRadius: BorderRadius.circular(5),
        //             ),
        //             child: AppNetworkImage(
        //               height: 80,
        //               width: 80,
        //               imageUrl:
        //                   'https://i.pinimg.com/originals/a5/f3/5f/a5f35fb23e942809da3df91b23718e8d.png',
        //               backGroundColor: APPCOLOR.bgGrey,
        //               radius: 10,
        //             ),
        //           ),
        //           // Image.asset(_favProducts[index].productImage),
        //           title: Text(item.product!.name ?? ""),
        //           subtitle: Text(item.product!.unit ?? ""),
        //           trailing: Row(
        //             children: [
        //               Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text("\$" + item.product!.discountPrice),
        //                   Text(
        //                     "\$${item.product!.basePrice ?? ""}",
        //                     textAlign: TextAlign.left,
        //                     maxLines: 1,
        //                     overflow: TextOverflow.ellipsis,
        //                     style: context
        //                         .customMedium(
        //                           Colors.grey.withOpacity(0.8),
        //                           12,
        //                         )
        //                         .copyWith(
        //                           decoration: TextDecoration.lineThrough,
        //                         ),
        //                   ),
        //                 ],
        //               ),
        //               Align(
        //                 alignment: Alignment.centerRight,
        //                 child: GestureDetector(
        //                   // onTap: provider.isLoading[bestdealproduct.id] ??
        //                   //         false
        //                   //     ? null
        //                   //     : () => provider.addToCart(
        //                   //         context, bestdealproduct.id!),
        //                   child: Container(
        //                     height: MediaQuery.of(context).size.height * 0.035,
        //                     width: MediaQuery.of(context).size.width * 0.1,
        //                     decoration: BoxDecoration(
        //                       color:
        //                           // provider.cartItems
        //                           //         .contains(bestdealproduct.id)
        //                           //     ? Colors.grey
        //                           //     :
        //                           APPCOLOR.lightGreen,
        //                       borderRadius: BorderRadius.circular(5),
        //                     ),
        //                     child: Center(
        //                       child:
        //                           // provider.isLoading[
        //                           //             bestdealproduct.id] ??
        //                           //         false
        //                           //     ? CircularProgressIndicator(
        //                           //         color: Colors.white, strokeWidth: 2)
        //                           //     :

        //                           Text(
        //                         // provider.cartItems.contains(
        //                         //         bestdealproduct.id)
        //                         //     ? 'Added'
        //                         //     :

        //                         'Add',
        //                         style: context.customRegular(Colors.white, 12),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       );
        //     },
        //     separatorBuilder: (_, index) {
        //       _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        //         CurvedAnimation(
        //           parent: _animationController,
        //           curve: Interval(
        //             (0.5 / provider.wishListItem.length) * index,
        //             1,
        //             curve: Curves.easeOut,
        //           ),
        //         ),
        //       );
        //       _animationController.forward(from: 0);
        //       return AnimatedBuilder(
        //         animation: _animationController,
        //         builder: (_, child) {
        //           return FadeTransition(
        //             opacity: _animation,
        //             child: Transform(
        //               transform: Matrix4.translationValues(
        //                 0.0,
        //                 50 * (1.0 - _animation.value),
        //                 0.0,
        //               ),
        //               child: child,
        //             ),
        //           );
        //         },
        //         child: Divider(),
        //       );
        //     },
        //   ),
        // );
      }
    });
  }
}
