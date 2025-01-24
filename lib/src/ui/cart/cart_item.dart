import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/src/common_widget/network_image.dart';
import 'package:grocery_app/src/ui/widgets/custom_icon_button.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';

class CartItem extends StatelessWidget {
  // final ProductModel product;
  const CartItem({
    Key? key,
    //  required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = context.theme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: AppNetworkImage(
              width: 50.w,
              height: 40.h,
              imageUrl:
                  'https://i.pinimg.com/originals/a5/f3/5f/a5f35fb23e942809da3df91b23718e8d.png',
              backGroundColor: APPCOLOR.bgGrey,
              radius: 10,
            ),
          ),
          //  Image.asset(product.image, width: 50.w, height: 40.h),

          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vegitables and Fruits",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.customMedium(APPCOLOR.balck1A1A1A, 14),
              ),
              5.verticalSpace,
              Text(
                '1kg, 10\$',
                style: context.customMedium(APPCOLOR.balck1A1A1A, 14),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              CustomIconButton(
                width: 20.w,
                height: 20.h,
                onPressed: () {},
                icon: SvgPicture.asset(
                  APPASSETS.removeIcon,
                  fit: BoxFit.none,
                ),
                backgroundColor: APPCOLOR.appGreen,
              ),
              16.horizontalSpace,
              Text(
                "10",
                style: context.customMedium(APPCOLOR.balck1A1A1A, 14),
              ),
              16.horizontalSpace,
              CustomIconButton(
                width: 20.w,
                height: 20.h,
                onPressed: () {},
                icon: SvgPicture.asset(
                  APPASSETS.addIcon,
                  fit: BoxFit.none,
                ),
                backgroundColor: APPCOLOR.appGreen,
              ),
            ],
          )
        ],
      ),
    );
  }
}
