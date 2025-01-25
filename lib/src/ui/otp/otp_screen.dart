import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/logic/provider/auth_provider.dart';
import 'package:grocery_app/src/ui/entername/enter_fullname_screen.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/constants/string_constant.dart';
import 'package:grocery_app/utils/extensions/color_ex.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../../core/routes/routes.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String maskNumber(String number) {
    // Ensure the input has at least 4 digits to avoid errors
    if (number.length < 4) {
      throw Exception('Number is too short to mask');
    }

    // Replace all characters except the last 4 with '*'
    String maskedPart = '*' * (number.length - 4);
    String visiblePart = number.substring(number.length - 4);
    return maskedPart + visiblePart;
  }

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
                APPSTRING.enterVerificationCode,
                style: context.customMedium(APPCOLOR.black333333, 18),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "Enter the 6-digit code  sent to you at ${maskNumber(pageNotifier.numberwithCode)}",
                  style: context.customRegular(APPCOLOR.grey666666, 16),
                ),
              ),
              const SizedBox(height: 20),
              OTPTextField(
                length: 6,
                onChanged: (c) {
                  // if (c.length == 6) {
                  //   Navigator.push(context, MaterialPageRoute(
                  //     builder: (context) {
                  //       return const EnterFullNameScreen();
                  //     },
                  //   ));
                  // }
                },
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: HexColor('F4F5F5'),
                ),
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceBetween,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) async {
                  final success = await pageNotifier.verifiOtp(pin, context);

                  if (success) 
                  {
                    context.push(MyRoutes.FULLNAME);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.grey,
                        content: Text("Failed to send OTP. Please try again."),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Didn’t get the code? ',
                      style: context.customRegular(APPCOLOR.gery48514D, 14),
                      children: [
                    TextSpan(
                      text: 'Resend',
                      style: context.customRegular(APPCOLOR.appGreen, 14),
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
