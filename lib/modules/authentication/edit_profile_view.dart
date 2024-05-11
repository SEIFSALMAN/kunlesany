import 'package:flutter/material.dart';
import 'package:kunlesany/modules/authentication/change_password_view.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../layout/home_layout.dart';
import '../../shared/components/navigator.dart';
import 'login_view.dart';

class EditProfileView extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
                  AppLocalizations.of(context)!.done,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontFamily: 'PlaypenSans'),
                )))
      ]),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40,40, 40, 10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.network(
                    'https://lottie.host/748d3ea4-27bb-4f04-bfb6-ee5745769fb7/cCB4BvWSps.json',
                    height: 120),
                SizedBox(
                  height: 30,
                ),
                Text(AppLocalizations.of(context)!.editProfile, style: TextStyle(fontSize: 26)),
                SizedBox(
                  height: 20,
                ),

                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return  AppLocalizations.of(context)!.usernameHint;
                    } else {
                      return null;
                    }
                  },
                  controller: userController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        height: 1, fontSize: 15, fontFamily: 'PlaypenSans'),
                    hintText:  AppLocalizations.of(context)!.username,
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 13),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return  AppLocalizations.of(context)!.emailHint;
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        height: 1, fontSize: 15, fontFamily: 'PlaypenSans'),
                    hintText:  AppLocalizations.of(context)!.email,
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 13),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return  AppLocalizations.of(context)!.passwordHint;
                    } else {
                      return null;
                    }
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        height: 1, fontSize: 15, fontFamily: 'PlaypenSans'),
                    hintText:  AppLocalizations.of(context)!.password,
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 15,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
