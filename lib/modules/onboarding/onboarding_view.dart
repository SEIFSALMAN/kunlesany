import 'package:flutter/material.dart';
import 'package:kunlesany/modules/authentication/login_view.dart';
import 'package:kunlesany/shared/components/navigator.dart';
import 'package:kunlesany/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class onBoardingModel {
  final String text;
  final String sloganText;
  final String image;

  onBoardingModel(this.text, this.sloganText, this.image);
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentIndex = 0;
  late PageController controller;

  List<onBoardingModel> onBoarding = [
    onBoardingModel(
        "Welcome to Kun Lesany",
        "We here to connect you with all people around world!",
        "assets/images/onBoardingImage1.png"),
    onBoardingModel(
        "Easy to communicate",
        "you can convert your sign language communication into voice and text and the opposite around",
        "assets/images/onBoardingImage2.png"),
    onBoardingModel(
        "Simple Learn",
        "we can teach you how to learn sign language with it's all different types",
        "assets/images/onBoardingImage3.png")
  ];

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  void submit() {
    //To Make it appear again .set value to False  ||||
    CacheHelper.saveData(key: "onBoarding", value: true).then((value) {
      print(CacheHelper.getData(key: 'onBoarding'));
      if (value) {
        AppNavigator.customNavigator(
            context: context, screen: LoginView(), finish: true);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          TextButton(
            child: Text(
              AppLocalizations.of(context)!.skip,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onPressed: () => submit(),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: 3,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Image.asset(onBoarding[index].image, height: 300),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        onBoarding[index].text,
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        onBoarding[index].sloganText,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              expansionFactor: 4,
              dotWidth: 10,
              activeDotColor: Colors.blue
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                shadowColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                if (currentIndex == 2) {
                  submit();
                }
                controller.nextPage(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeIn);
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  currentIndex == 2 ?  AppLocalizations.of(context)!.continuee :  AppLocalizations.of(context)!.next,
                  style: TextStyle(fontSize: 16, fontFamily: 'PlaypenSans',color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
