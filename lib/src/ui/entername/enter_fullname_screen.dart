import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/common_widget/textfield_widget.dart';
import 'package:grocery_app/src/core/routes/routes.dart';
import 'package:grocery_app/src/logic/provider/auth_provider.dart';
import 'package:grocery_app/src/ui/bottomnavigation/bottom_bar_widget.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/constants/string_constant.dart';
import 'package:grocery_app/utils/extensions/extensions.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:provider/provider.dart';

class EnterFullNameScreen extends StatefulWidget {
  const EnterFullNameScreen({super.key});

  @override
  State<EnterFullNameScreen> createState() => _EnterFullNameScreenState();
}

class _EnterFullNameScreenState extends State<EnterFullNameScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pageNotifier = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          color: Colors.greenAccent.withOpacity(0.1),
        ),
        child: Padding(
          padding: context.bodyAllPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(APPASSETS.back)),
              const SizedBox(height: 30),
              Text(
                APPSTRING.pleaseEnterYourFullName,
                style: context.customMedium(APPCOLOR.black333333, 18),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextFieldWidget(
                      controller: pageNotifier.name,
                      hintText: APPSTRING.firstNameHint,
                      onValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter first Name';
                        }
                        return null;
                      },
                    ),
                    AppTextFieldWidget(
                      controller: pageNotifier.lastName,
                      hintText: APPSTRING.lastNameHint,
                      onValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter last Name';
                        }
                        return null;
                      },
                    ),
                    AppTextFieldWidget(
                      controller: pageNotifier.email,
                      hintText: APPSTRING.emailHint,
                      onValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter eamil-id';
                        }
                        return null;
                      },
                    ),
                    // AppTextFieldWidget(
                    //   controller: pageNotifier.address,
                    //   hintText: APPSTRING.addressHint,
                    //   onValidate: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please Enter address';
                    //     }
                    //     return null;
                    //   },
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent.withOpacity(0.1),
        ),
        height: 100,
        child: Padding(
          padding: context.bodyAllPadding.copyWith(bottom: 20),
          child: Center(
            child: InkWell(
              onTap: () async {
                if (_formKey.currentState?.validate() ?? false) 
                {
                  final success = await pageNotifier.customerRegister(context);
                  print("dshfgjkdfjgh  ${success}");
                  if (success) {
                    context.clearAndPush(routePath: MyRoutes.BOTTOMNAV);
                  }
                }

                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) {
                //     return const BottomBarWidget();
                //   },
                // ));
              },
              child: Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: APPCOLOR.appGreen,
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text(
                    APPSTRING.continueBtn,
                    style: context.customMedium(Colors.white, 16),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
