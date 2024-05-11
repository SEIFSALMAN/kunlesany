import 'package:flutter/material.dart';
import 'package:kunlesany/modules/authentication/login_view.dart';
import 'package:kunlesany/shared/components/navigator.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ForgetPasswordView extends StatelessWidget {
  var formKey = GlobalKey<FormState>();


  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0,40,40,0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Lottie.network(
                      "https://lottie.host/3753e012-5317-4c9d-b32b-c13a26a633d8/IrnxYmnRBO.json",
                      height: 190,
                      fit: BoxFit.cover,
                      width: double.infinity),
                  SizedBox(
                    height: 60,
                  ),
                  Text( AppLocalizations.of(context)!.resetPassword, style: TextStyle(fontSize: 26)),
                  Text( AppLocalizations.of(context)!.resetPasswordText,
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text( AppLocalizations.of(context)!.email, style: TextStyle())),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return  AppLocalizations.of(context)!.emailHint;
                      }
                      else {
                        return null;
                      }
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText:  AppLocalizations.of(context)!.email,
                        hintStyle: TextStyle(
                          height: 1,
                          fontSize: 15,
                          fontFamily: 'PlaypenSans',
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        //Send email to reset pass..
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: TextStyle(fontSize: 16, fontFamily: 'PlaypenSans',color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        AppNavigator.customNavigator(
                            context: context, screen: LoginView(), finish: true);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back,color:Theme.of(context).iconTheme.color),
                          SizedBox(width: 10,),
                          Text(AppLocalizations.of(context)!.backToLogin,style: TextStyle(fontFamily: 'PlaypenSans',color:Theme.of(context).iconTheme.color),)
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
