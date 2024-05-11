import 'package:flutter/material.dart';
import 'package:kunlesany/layout/home_layout.dart';
import 'package:kunlesany/modules/authentication/register_with_phone.dart';
import 'package:kunlesany/modules/authentication/signup_view.dart';
import 'package:kunlesany/shared/components/navigator.dart';
import 'package:kunlesany/shared/providers/auth_providers.dart';
import 'package:kunlesany/shared/utils/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PhoneOtpView extends StatefulWidget {
  final String? verificationId;

  const PhoneOtpView({super.key, this.verificationId});

  @override
  State<PhoneOtpView> createState() => _PhoneOtpViewState();
}

class _PhoneOtpViewState extends State<PhoneOtpView> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SafeArea(
        child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 150,
                            child: Lottie.network(
                              'https://lottie.host/bc067e73-38ad-41f6-bca7-e14d85d13d82/FY02GUYzba.json',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(AppLocalizations.of(context)!.verificationCode),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.enterYourOTP,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: 'PlaypenSans'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Directionality(
                          textDirection: TextDirection.ltr,
                            child: Pinput(
                              pinAnimationType: PinAnimationType.scale,
                              length: 6,
                              showCursor: true,
                              defaultPinTheme: PinTheme(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.blue.shade400)),
                                  textStyle: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w700)),
                              onCompleted: (value) {
                                setState(() {
                                  otpCode = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                              ),
                              onPressed: () {
                                print(otpCode);
                                if (otpCode != null) {
                                  verifyOtp(context, otpCode!);
                                } else {

                                  showSnackBar(
                                      context, AppLocalizations.of(context)!.enter6Digit);
                                }
                              },
                              child: Container(
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.verify,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'PlaypenSans',color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            AppLocalizations.of(context)!.didntReceiveAnyCode,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.resendCode,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId!,
        userOtp: userOtp,
        onSuccess: () {
          ap.checkExistingUser().then((value) async {
            if (value == true) {
              //Exist
              ap.getDataFromFirebase().then(
                    (value) => ap.saveUserDatatoSP().then(
                          (value) => ap.setSignIn().then((value) =>
                              AppNavigator.customNavigator(
                                  context: context,
                                  screen: HomeLayout(),
                                  finish: true)),
                        ),
                  );
            } else {
              //New
              AppNavigator.customNavigator(
                  context: context,
                  screen: RegisterWithPhoneView(),
                  finish: false);
            }
          }).catchError((error) {});
        });
  }
}
