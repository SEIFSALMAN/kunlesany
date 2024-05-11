
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kunlesany/layout/home_layout.dart';
import 'package:kunlesany/modules/authentication/continue_phone_view.dart';
import 'package:kunlesany/modules/authentication/forget_pass_view.dart';
import 'package:kunlesany/modules/authentication/signup_view.dart';
import 'package:kunlesany/shared/components/navigator.dart';
import 'package:kunlesany/shared/components/toast_messages.dart';
import 'package:kunlesany/shared/cubits/login/login_cubit.dart';
import 'package:kunlesany/shared/network/local/cache_helper.dart';
import 'package:kunlesany/shared/providers/auth_providers.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ap =Provider.of<AuthProvider>(context,listen: false);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessState) {
          CacheHelper.saveData(key: "uId", value: state.uId)
              .then((value) {
            AppNavigator.customNavigator(context: context, screen: const HomeLayout(), finish: true);
            showToast(message: AppLocalizations.of(context)!.welcomeBack, state: ToastStates.SUCCESS, duartion:1);
          })
              .catchError((error){
            showToast(message: "Error", state: ToastStates.SUCCESS, duartion:1);

          });
        }
        if(state is LoginGoogleSuccessState) {
          CacheHelper.saveData(key: "uId", value: state.uId)
              .then((value) {
            AppNavigator.customNavigator(context: context, screen: const HomeLayout(), finish: true);
            showToast(message: "${AppLocalizations.of(context)!.welcomeBack} Using Google!" , state: ToastStates.SUCCESS, duartion:1);
          })
              .catchError((error){
            showToast(message: "Error", state: ToastStates.SUCCESS, duartion:1);
          });
        }
        if(state is LoginFacebookSuccessState) {
          CacheHelper.saveData(key: "uId", value: state.uId)
              .then((value) {
            AppNavigator.customNavigator(context: context, screen: const HomeLayout(), finish: true);
            showToast(message: "${AppLocalizations.of(context)!.welcomeBack} Using Facebook!" , state: ToastStates.SUCCESS, duartion:1);
          })
              .catchError((error){
            showToast(message: "Error", state: ToastStates.SUCCESS, duartion:1);
          });
        }
        if (state is LoginErrorState) {
          showToast(
              message: state.error.substring(35).toUpperCase(), state: ToastStates.ERROR, duartion: 1);
        }
      },
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(elevation: 0, actions: [
              TextButton(
                  onPressed: () {
                    AppNavigator.customNavigator(
                        context: context, screen: const HomeLayout(), finish: true);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.continueAsGuest,
                    style: TextStyle(fontFamily: 'PlaypenSans',color: Colors.deepOrange),
                  ))
            ]),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 8),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Lottie.network(
                            'https://lottie.host/b5ff933e-565c-4e21-b615-52d0c521bd32/TOYLQ0FlKF.json',
                            height: 160),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(AppLocalizations.of(context)!.login,
                                style: const TextStyle(fontSize: 28))),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!.emailHint;
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                height: 1,
                                fontSize: 15,
                                fontFamily: 'PlaypenSans'),
                            hintText: AppLocalizations.of(context)!.email,
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!.passwordHint;
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: loginCubit.isPassword,
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.password,
                              hintStyle: const TextStyle(
                                height: 1,
                                fontSize: 15,
                                fontFamily: 'PlaypenSans',
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                size: 20,
                              ),
                              suffixIcon: IconButton(onPressed: (){
                                loginCubit.changePasswordVisibility();
                              } , icon: Icon(loginCubit.suffix)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                                onPressed: () {
                                  AppNavigator.customNavigator(
                                      context: context,
                                      screen: ForgetPasswordView(),
                                      finish: false);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.forgetPassword,
                                  style: const TextStyle(fontFamily: 'PlaypenSans',color: Colors.deepOrange),
                                ))),
                        ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    shadowColor: Colors.transparent,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      loginCubit.userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);

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
                                        AppLocalizations.of(context)!.login,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontFamily: 'PlaypenSans'),
                                      ),
                                    ),
                                  ),
                                ),
                            fallback: (context) => const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Center(
                                      child: CircularProgressIndicator(color: Colors.blue,)),
                                )),
                        const SizedBox(height: 10),
                        const Row(children: [
                          Expanded(
                              child: Divider(
                            thickness: 2,
                          )),
                          Text("OR", style: TextStyle(fontSize: 12)),
                          Expanded(
                              child: Divider(
                            thickness: 2,
                          )),
                        ]),
                        const SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 3),
                            MaterialButton(
                              elevation: 0,
                              minWidth: double.maxFinite,
                              height: 50,
                              onPressed: () {
                                loginCubit.signInWithGoogle();
                              },
                              color: Colors.teal.shade500,
                              textColor: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.google),
                                  SizedBox(width: 10),
                                  Text(AppLocalizations.of(context)!.signInGoogle,
                                      style: TextStyle(color: Colors.white, fontSize: 14)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            MaterialButton(
                              elevation: 0,
                              minWidth: double.maxFinite,
                              height: 50,
                              onPressed: () async {
                               if(ap.isSignedIn == true){
                                 await ap.getUserDataFromSP().whenComplete(() =>AppNavigator.customNavigator(context: context, screen: ContinueWithPhoneView(), finish: true));
                               }
                               else {
                                 AppNavigator.customNavigator(context: context, screen: ContinueWithPhoneView(), finish: false);
                               }
                              },
                              color: Colors.grey[800],
                              textColor: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.squarePhone),
                                  SizedBox(width: 10),
                                  Text(AppLocalizations.of(context)!.continueWithPhone,
                                      style: TextStyle(color: Colors.white, fontSize: 14)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!.newMember,
                                style: const TextStyle(fontSize: 13)),
                            TextButton(
                                onPressed: () {
                                  AppNavigator.customNavigator(
                                      context: context,
                                      screen: RegisterView(),
                                      finish: false);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.register,
                                  style: const TextStyle(
                                      fontFamily: 'PlaypenSans', fontSize: 13,color: Colors.deepOrange),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
