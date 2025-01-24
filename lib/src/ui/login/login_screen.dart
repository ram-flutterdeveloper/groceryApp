import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/common_widget/textfield_widget.dart';
import 'package:grocery_app/src/core/routes/routes.dart';
import 'package:grocery_app/src/logic/provider/auth_provider.dart';
import 'package:grocery_app/src/ui/otp/otp_screen.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/constants/string_constant.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

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
              Text(
                APPSTRING.enterYourMobileNumber,
                style: context.customMedium(APPCOLOR.balck1A1A1A, 18),
              ),
              const SizedBox(height: 40),
              Text(
                APPSTRING.whatYourPhoneNumber,
                style: context.customMedium(APPCOLOR.black333333, 18),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  APPSTRING.codeSentText,
                  style: context.customMedium(APPCOLOR.grey666666, 14),
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: AppTextFieldWidget(
                  length: 10,
                  controller: phoneController,
                  hintText: APPSTRING.phoneNumberHint,
                  onValidate: (value) => validatePhoneNumber(value),
                ),
              ),
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
                if (_formKey.currentState?.validate() ?? false) {
                  final success =
                      await pageNotifier.sendOtp(phoneController.text, context);

                  if (success) {
                    context.push(MyRoutes.OTPSCREEN);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Failed to send OTP. Please try again."),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Enter a valid 10-digit phone number."),
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: APPCOLOR.appGreen,
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text(
                    APPSTRING.verifyButton,
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
