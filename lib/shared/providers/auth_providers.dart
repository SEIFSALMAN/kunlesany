import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kunlesany/models/user_model.dart';
import 'package:kunlesany/modules/authentication/phone_otp_view.dart';
import 'package:kunlesany/shared/components/navigator.dart';
import 'package:kunlesany/shared/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  AuthProvider() {
    checkSign();
  }

  void checkSign() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _isSignedIn = sharedPreferences.getBool("is_signedIn") ?? false;
    notifyListeners();
  }

  Future setSignIn()
  async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedIn",true);
    _isSignedIn = true;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            showSnackBar(context, error.message.toString());
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            AppNavigator.customNavigator(
                context: context, screen: PhoneOtpView(verificationId: verificationId), finish: false);
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);

      User? user = (await firebaseAuth.signInWithCredential(creds)).user!;

      if (user != null) {
        _uid = user.uid;
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }


  Future<bool> checkExistingUser() async
  {
    DocumentSnapshot snapshot = await firebaseFireStore.collection("Users").doc(_uid).get();
    if(snapshot.exists)
      {
        print("User Exist!");
        return true;
      }
     else
       {
         print("New User");
         return false;
       }
  }


  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required Function onSuccess,
}) async
  {
    _isLoading = true;
    notifyListeners();
    try{
      _userModel = userModel;
      await firebaseFireStore.collection("Users").doc(_uid).set(userModel.toMap()).then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    }
    on FirebaseAuthException catch (e)
    {
      showSnackBar(context, e.message.toString());
      _isLoading =false;
      notifyListeners();
    }
  }

  Future getDataFromFirebase() async {
    await firebaseFireStore.collection("Users").doc(firebaseAuth.currentUser!.uid).get().then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
        name: snapshot['name'],
        phoneNumber: snapshot['phoneNumber'],
        age: snapshot['age'],
        uId: snapshot['uId'],
        email: snapshot['email']
      );
      _uid = userModel.uId;
    });
  }

  Future saveUserDatatoSP() async
  {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(userModel.toMap()));
  }

  Future getUserDataFromSP() async
  {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? "";
    _userModel = UserModel.fromJSON(jsonDecode(data));
    _uid = _userModel!.uId;
    notifyListeners();
  }

  Future userSignOut() async
  {
    SharedPreferences s = await SharedPreferences.getInstance();
    await firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    s.clear();
  }

}
