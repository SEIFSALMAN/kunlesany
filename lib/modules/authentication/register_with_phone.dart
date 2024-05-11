import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kunlesany/models/user_model.dart';
import 'package:kunlesany/shared/cubits/register/register_cubit.dart';
import 'package:kunlesany/shared/providers/auth_providers.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../layout/home_layout.dart';
import '../../shared/components/navigator.dart';
import '../../shared/components/toast_messages.dart';
import 'login_view.dart';

class RegisterWithPhoneView extends StatefulWidget {

  @override
  State<RegisterWithPhoneView> createState() => _RegisterWithPhoneViewState();
}

class _RegisterWithPhoneViewState extends State<RegisterWithPhoneView> {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose()
  {
    super.dispose();
  nameController.dispose();
  emailController.dispose();
  passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {

        if (state is RegisterWithPhoneErrorState) {
          showToast(
              message: state.error.substring(37).toUpperCase(), state: ToastStates.ERROR, duartion: 1);
        }
        if(state is CreateUserSuccessState){
          showToast(message: "Account Created Successfully", state: ToastStates.SUCCESS, duartion: 1);
          AppNavigator.customNavigator(context: context, screen: const HomeLayout(), finish: true);
        }
      },
      builder: (context, state) {
        final isLoading = Provider
            .of<AuthProvider>(context, listen: true)
            .isLoading;
        final ap = Provider
            .of<AuthProvider>(context, listen: false);
        var registerCubit = RegisterCubit.get(context);
        return Scaffold(
          appBar: AppBar(elevation: 0),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(40,0,40,10),
            child: isLoading == true
                ?
            Center(child: CircularProgressIndicator(color: Colors.blue))
                :
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(AppLocalizations.of(context)!.registerOnceTextPhone,
                      textAlign: TextAlign.center,),
                      const SizedBox(
                        height: 50,
                      ),
                      Lottie.network(
                          'https://lottie.host/4d0028f4-474a-423b-9dc0-46d358d5432e/RUEQYNiCZh.json',
                          height: 130),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text( AppLocalizations.of(context)!.register, style: const TextStyle(fontSize: 26),),),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (String? value){
                          if(value!.isEmpty)
                          {
                            return  AppLocalizations.of(context)!.usernameHint;
                          }
                          else {
                            return null;
                          }
                        },
                        controller: nameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(height: 1, fontSize: 15,fontFamily: 'PlaypenSans'),
                          hintText:  AppLocalizations.of(context)!.username,
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
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
                          hintStyle: const TextStyle(height: 1, fontSize: 15,fontFamily: 'PlaypenSans'),
                          hintText:  AppLocalizations.of(context)!.email,
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                      TextFormField(
                        validator: (String? value){
                          if(value!.isEmpty)
                          {
                            return  AppLocalizations.of(context)!.passwordHint;
                          }
                          else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        obscureText: registerCubit.isPassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(height: 1, fontSize: 15,fontFamily: 'PlaypenSans'),
                          hintText:  AppLocalizations.of(context)!.password,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(onPressed: (){
                            registerCubit.changePasswordVisibility();
                          } , icon: Icon(registerCubit.suffix)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),

                      const SizedBox(height: 15),

                      ConditionalBuilder(condition: state is! RegisterWithPhoneLoadingState,
                          builder:(context) =>  ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                            ),
                            onPressed: () {
                              if(formKey.currentState!.validate()){
                                if(state is CreateUserSuccessState)
                                  {
                                    storeData();
                                  }
                              registerCubit.userRegisterWithPhone(name: nameController.text, email: emailController.text, password: passwordController.text,phoneNumber: ap.firebaseAuth.currentUser!.phoneNumber);
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
                                  AppLocalizations.of(context)!.register,
                                  style:
                                  const TextStyle(fontSize: 16, fontFamily: 'PlaypenSans',color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          fallback: (context)=> const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Center(child: CircularProgressIndicator(color: Colors.blue)),
                          )),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void storeData() async
  {
    final ap = Provider.of<AuthProvider>(context,listen: false);
    UserModel userModel = UserModel(
      name: nameController.text,
      email: emailController.text,
      uId: ap.firebaseAuth.currentUser!.uid,
      phoneNumber: ap.firebaseAuth.currentUser!.phoneNumber,
      age: 22
    );
    ap.saveUserDataToFirebase(
      context: context,
      userModel: userModel,
      onSuccess: (){
        ap.saveUserDatatoSP().then((value) => ap.setSignIn().then((value) => AppNavigator.customNavigator(context: context, screen: HomeLayout(), finish:true)));
      }
    );

  }

}
