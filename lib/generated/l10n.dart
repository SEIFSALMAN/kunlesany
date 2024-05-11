// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Kun Lesany`
  String get homePage {
    return Intl.message(
      'Kun Lesany',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `Hi, Guest`
  String get welcomePage {
    return Intl.message(
      'Hi, Guest',
      name: 'welcomePage',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get username {
    return Intl.message(
      'User name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your username`
  String get usernameHint {
    return Intl.message(
      'Please enter your username',
      name: 'usernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get newMember {
    return Intl.message(
      'Don\'t have an account?',
      name: 'newMember',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuee {
    return Intl.message(
      'Continue',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Continue as Guest!`
  String get continueAsGuest {
    return Intl.message(
      'Continue as Guest!',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `No worries, we'll send you reset instructions.`
  String get resetPasswordText {
    return Intl.message(
      'No worries, we\'ll send you reset instructions.',
      name: 'resetPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Back to log in`
  String get backToLogin {
    return Intl.message(
      'Back to log in',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Already a member?`
  String get alreadyMember {
    return Intl.message(
      'Already a member?',
      name: 'alreadyMember',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get currentLanguage {
    return Intl.message(
      'English',
      name: 'currentLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Content Policy`
  String get contentPolicy {
    return Intl.message(
      'Content Policy',
      name: 'contentPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `User Agreement`
  String get userAgreement {
    return Intl.message(
      'User Agreement',
      name: 'userAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Help FAQ`
  String get helpFAQ {
    return Intl.message(
      'Help FAQ',
      name: 'helpFAQ',
      desc: '',
      args: [],
    );
  }

  /// `Report a Bug`
  String get reportBug {
    return Intl.message(
      'Report a Bug',
      name: 'reportBug',
      desc: '',
      args: [],
    );
  }

  /// `Give us a Rating`
  String get giveRating {
    return Intl.message(
      'Give us a Rating',
      name: 'giveRating',
      desc: '',
      args: [],
    );
  }

  /// `Rate this app`
  String get rateUp {
    return Intl.message(
      'Rate this app',
      name: 'rateUp',
      desc: '',
      args: [],
    );
  }

  /// `Please leave a star rating`
  String get rateText {
    return Intl.message(
      'Please leave a star rating',
      name: 'rateText',
      desc: '',
      args: [],
    );
  }

  /// `Briefly explain what happened or what's not working.`
  String get bugText {
    return Intl.message(
      'Briefly explain what happened or what\'s not working.',
      name: 'bugText',
      desc: '',
      args: [],
    );
  }

  /// `Rating Sent Successfully`
  String get rateSuccess {
    return Intl.message(
      'Rating Sent Successfully',
      name: 'rateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Report Sent Successfully`
  String get bugSuccess {
    return Intl.message(
      'Report Sent Successfully',
      name: 'bugSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Rating failed`
  String get rateFailed {
    return Intl.message(
      'Rating failed',
      name: 'rateFailed',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Section 1 : Letters`
  String get section1 {
    return Intl.message(
      'Section 1 : Letters',
      name: 'section1',
      desc: '',
      args: [],
    );
  }

  /// `Section 2 : Numbers`
  String get section2 {
    return Intl.message(
      'Section 2 : Numbers',
      name: 'section2',
      desc: '',
      args: [],
    );
  }

  /// `Section 3 : Words`
  String get section3 {
    return Intl.message(
      'Section 3 : Words',
      name: 'section3',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Added to bookmark Successfully`
  String get addedBookmark {
    return Intl.message(
      'Added to bookmark Successfully',
      name: 'addedBookmark',
      desc: '',
      args: [],
    );
  }

  /// `Removed from bookmark Successfully`
  String get removeBookmark {
    return Intl.message(
      'Removed from bookmark Successfully',
      name: 'removeBookmark',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message(
      'Advanced',
      name: 'advanced',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Well Done`
  String get wellDone {
    return Intl.message(
      'Well Done',
      name: 'wellDone',
      desc: '',
      args: [],
    );
  }

  /// `Your Progress`
  String get progress {
    return Intl.message(
      'Your Progress',
      name: 'progress',
      desc: '',
      args: [],
    );
  }

  /// ` Beginner\n Sign Language\n Course In Arabic`
  String get arabicCourseText {
    return Intl.message(
      ' Beginner\n Sign Language\n Course In Arabic',
      name: 'arabicCourseText',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Upload picture`
  String get upload {
    return Intl.message(
      'Upload picture',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
