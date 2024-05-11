import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:kunlesany/layout/home_layout.dart';
import 'package:kunlesany/shared/components/navigator.dart';
import 'package:kunlesany/shared/providers/auth_providers.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class ContinueWithPhoneView extends StatefulWidget {
  const ContinueWithPhoneView({super.key});

  @override
  State<ContinueWithPhoneView> createState() => _ContinueWithPhoneViewState();
}

class _ContinueWithPhoneViewState extends State<ContinueWithPhoneView> {
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  Country selectedCountry = Country(
      phoneCode: "20",
      countryCode: "EG",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Egypt",
      example: "Egypt",
      displayName: "Egypt",
      displayNameNoCountryCode: "EG",
      e164Key: "");


  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));

    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 150,
                        child: Lottie.network(
                          'https://lottie.host/df08ea54-8857-4573-b891-64477cbaae32/aNBQq2OcRE.json',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        AppLocalizations.of(context)!.registerPhoneText,
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
                        child: TextFormField(
                          cursorColor: Colors.blue[400],
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          maxLength: phoneController.text.startsWith("0") ? 11 : 10,
                          onChanged: (value) {
                            setState(() {
                              phoneController.text = value;
                            });
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!.passwordHint;
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.enterYourPhone,
                              hintStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w800,color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black12)),
                              prefixIcon: Container(
                                padding: EdgeInsets.all(8),
                                child: InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                        context: context,
                                        countryListTheme: CountryListThemeData(
                                            bottomSheetHeight: 500,
                                            padding:
                                                EdgeInsets.symmetric(vertical: 10)),
                                        onSelect: (value) {
                                          setState(() {
                                            selectedCountry = value;
                                          });
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 1,left: 5),
                                    child: Text(
                                        "${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              suffixIcon: selectedCountry.name == "Egypt" &&
                                          phoneController.text.startsWith("0") &&
                                          phoneController.text.length >= 11 ||
                                      selectedCountry.name == "Egypt" &&
                                          phoneController.text.startsWith("1") &&
                                          phoneController.text.length >= 10
                                  ? Container(
                                      margin: EdgeInsets.all(10),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                      child: Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    )
                                  : null),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .scaffoldBackgroundColor,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            sendPhoneNumber();
                           // AppNavigator.customNavigator(context: context, screen: HomeLayout(), finish: false);
                          }
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.sendSMS,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'PlaypenSans'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }


  void sendPhoneNumber()
  {
    final ap = Provider.of<AuthProvider>(context,listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }

}
