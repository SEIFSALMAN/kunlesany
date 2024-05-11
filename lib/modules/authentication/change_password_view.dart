import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../layout/home_layout.dart';
import '../../shared/components/navigator.dart';
import 'login_view.dart';

class ChangePasswordView extends StatelessWidget {
  var formKey = GlobalKey<FormState>();


  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, actions: [
        TextButton(
            onPressed: () {
              // if (formKey.currentState!.validate()) {
              //   AppNavigator.customNavigator(
              //       context: context, screen: HomeLayout(), finish: true);
              // }
            },
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppLocalizations.of(context)!.change,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontFamily: 'PlaypenSans'),
                )))
      ]),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 60, 40, 10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
              Lottie.network(
                  'https://lottie.host/5b558eef-f312-48a2-96cc-cf0da0116bd3/LYCXVqCMZM.json',
                  height: 130),
                SizedBox(height: 15),
                Align(
                    alignment: Alignment.center,
                    child:
                    Text( AppLocalizations.of(context)!.changePassword, style: TextStyle(fontSize: 26))),
                SizedBox(
                  height: 20,
                ),

                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.usernameHint;
                    } else {
                      return null;
                    }
                  },
                  controller: oldPasswordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        height: 1, fontSize: 15, fontFamily: 'PlaypenSans'),
                    hintText:  AppLocalizations.of(context)!.oldPassword,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.passwordHint;
                    } else {
                      return null;
                    }
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        height: 1, fontSize: 15, fontFamily: 'PlaypenSans'),
                    hintText: AppLocalizations.of(context)!.password,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.passwordHint;
                    } else {
                      return null;
                    }
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        height: 1, fontSize: 15, fontFamily: 'PlaypenSans'),
                    hintText: AppLocalizations.of(context)!.confirmPassword,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 15,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
