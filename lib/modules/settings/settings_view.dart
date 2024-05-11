import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kunlesany/modules/authentication/change_password_view.dart';
import 'package:kunlesany/modules/authentication/edit_profile_view.dart';
import 'package:kunlesany/modules/settings/report_bug_view.dart';
import 'package:kunlesany/shared/components/navigator.dart';
import 'package:kunlesany/shared/components/switcher.dart';
import 'package:kunlesany/shared/components/toast_messages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kunlesany/shared/network/local/cache_helper.dart';
import 'package:kunlesany/shared/providers/auth_providers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../main.dart';
import '../../models/languages.dart';
import '../../shared/constants/language_constants.dart';
import '../authentication/login_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String dropdownValue = 'English';
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text( AppLocalizations.of(context)!.homePage,
            style: const TextStyle(
                fontFamily: 'Caveat',
                fontWeight: FontWeight.w800,
                fontSize: 28)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( AppLocalizations.of(context)!.account, style: TextStyle(color: Colors.blue[400])),
              const SizedBox(
                height: 10,
              ),
              // ContentPolicy
              InkWell(
                onTap: () {
                  AppNavigator.customNavigator(context: context, screen: EditProfileView(), finish: false);
                },
                child: Row(
                  children: [
                    const Icon(Icons.edit),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.022,
                    ),
                    Text(
                      AppLocalizations.of(context)!.editProfile,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              //PrivacyPolicy
              InkWell(
                onTap: () {
                  AppNavigator.customNavigator(context: context, screen: ChangePasswordView(), finish: false);
                },
                child: Row(
                  children: [
                    const Icon(Icons.password),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.022,
                    ),
                    Text(
                      AppLocalizations.of(context)!.changePassword,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              //PrivacyPolicy
              InkWell(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(AppLocalizations.of(context)!.areYouSure),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(AppLocalizations.of(context)!.logOutText),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(AppLocalizations.of(context)!.yes),
                            onPressed: () {
                              ap.userSignOut().then((value) => AppNavigator.customNavigator(context: context, screen: const LoginView(), finish: true));
                              },
                          ),
                          TextButton(
                            child: Text(AppLocalizations.of(context)!.no),
                            onPressed: () {
                              Navigator.of(context).pop(); // Dismiss the Dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    const Icon(Icons.logout,color: Colors.red,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.022,
                    ),
                    Text(
                      AppLocalizations.of(context)!.logout,
                      style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          fontFamily: 'PlaypenSans'
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Theme.of(context).iconTheme.color,
                height: 10,
                endIndent: 10,
                indent: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text( AppLocalizations.of(context)!.advanced, style: TextStyle(color: Colors.blue[400])),
              // DarkMode
              Row(
                children: [
                  const Icon(Icons.dark_mode_outlined),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.012,
                  ),
                  Text(
                    AppLocalizations.of(context)!.darkMode,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  DarkLightSwitcher()
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.language),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.012,
                  ),
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                DropdownButton<Language>(
                  iconSize: 20,
                  hint: Text(translation(context).currentLanguage),
                  onChanged: (Language? language) async {
                    if (language != null) {
                      Locale locale = await setLocale(language.languageCode);
                      MyApp.setLocale(context, locale);
                    }
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                      value: e,
                      child:
                          Text(e.name)
                    ),
                  )
                      .toList(),
                )
                ],
              ),
              Divider(
                color: Theme.of(context).iconTheme.color,
                height: 10,
                endIndent: 10,
                indent: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              //////////////////////////////////////////////////////////////
              Text( AppLocalizations.of(context)!.aboutUs, style: TextStyle(color: Colors.blue[400])),
              const SizedBox(
                height: 15,
              ),
              //PrivacyPolicy
              InkWell(
                onTap: () async {
                  const url = "https://www.termsfeed.com/live/d03d5f31-dcbb-4056-9d2c-948f9eae7cc3";

                  if (await canLaunchUrlString(url)){
                    await launchUrlString(url,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true));
                  }

                },
                child: Row(
                  children: [
                    const Icon(Icons.lock_outline_rounded),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.022,
                    ),
                    Text(
                      AppLocalizations.of(context)!.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              //UserAgreement
              InkWell(
                onTap: () async {
                  const url = "https://www.termsfeed.com/live/a65f8422-6a33-46f6-b757-73b20e8d95f2";

                  if (await canLaunchUrlString(url)){
                    await launchUrlString(url,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true));
                  }

                },
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.022,
                    ),
                    Text(
                      AppLocalizations.of(context)!.userAgreement,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Theme.of(context).iconTheme.color,
                height: 10,
                endIndent: 10,
                indent: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              //////////////////////////////////////////////////////////////////
              Text(AppLocalizations.of(context)!.support, style: TextStyle(color: Colors.blue[400])),
              const SizedBox(
                height: 10,
              ),
              // Report a bug
              InkWell(
                onTap: () {
                  AppNavigator.customNavigator(context: context, screen: const ReportBugView(), finish: false);
                },
                child: Row(
                  children: [
                    const Icon(Icons.email_outlined),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.022,
                    ),
                    Text(
                      AppLocalizations.of(context)!.reportBug,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              //Write a review
              InkWell(
                onTap: () => showRating(),
                child: Row(
                  children: [
                    const Icon(Icons.star_half),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.022,
                    ),
                    Text(
                      AppLocalizations.of(context)!.giveRating,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRating() => RatingBar.builder(
        onRatingUpdate: (rating) => setState(() {
          this.rating = rating;
        }),
        minRating: 1,
        allowHalfRating: true,
        itemPadding: const EdgeInsets.symmetric(horizontal: 3),
        itemBuilder: (context, _) => Icon(Icons.star,color: Colors.blue[400]),
        updateOnDrag: true,
      );

  void showRating() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text( AppLocalizations.of(context)!.rateUp,style: const TextStyle(fontFamily: 'PlaypenSans')),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text( AppLocalizations.of(context)!.rateText,style: const TextStyle(fontFamily: 'PlaypenSans')),
                const SizedBox(
                  height: 25,
                ),
                buildRating(),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showToast(message:  AppLocalizations.of(context)!.rateSuccess, state: ToastStates.SUCCESS, duartion: 5);
                  }, child: Text( AppLocalizations.of(context)!.send,style: TextStyle(color: Colors.blue[400],fontFamily: 'PlaypenSans'),))
            ],
          ));

  void showSignOut() =>
      showDialog(context: context, builder:(context) =>
        AlertDialog(


        title: const Text("Sign Out?",style: TextStyle(fontFamily: "PlaypenSans"),),
        content: const Text("Are you sure you wanna sign out?",style: TextStyle(fontFamily: "PlaypenSans"),),
        actions: [
          TextButton(
            child: const Text("Yes",style: TextStyle(fontFamily: "PlaypenSans",fontSize:16),),
            onPressed:  () {

              CacheHelper.saveData(key: "uId", value: '');
              AppNavigator.customNavigator(context: context, screen: const LoginView(), finish: true);
            },
          ),
          TextButton(
            child: const Text("No",style: TextStyle(fontFamily: "PlaypenSans",fontSize: 16),),
            onPressed:  () {
              Navigator.pop(context);
            },
          )
        ],
       ));

  Future<void> logOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('We will be redirected to login page.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the Dialog
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate to login
              },
            ),
          ],
        );
      },
    );
  }

}
