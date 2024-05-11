import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kunlesany/modules/home/audio_to_text_view.dart';
import 'package:kunlesany/shared/components/navigator.dart';
import 'package:kunlesany/shared/providers/auth_providers.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  var formKey = GlobalKey<FormState>();
  File? selectedImage;
  TextEditingController textToSignController = TextEditingController();
  int activeIndex = 0;
  final carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.jpg',
    'assets/images/carousel5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${AppLocalizations.of(context)!.welcomePage}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          backgroundImage: AssetImage("assets/images/guest.png"),
                        ),
                      ],
                    ),
                  ),
                  CarouselSlider.builder(
                      itemCount: carouselImages.length,
                      itemBuilder: (context, index, realIndex) {
                        final assetImage = carouselImages[index];
                        return buildImage(assetImage, index);
                      },
                      options: CarouselOptions(
                          height: 170,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index))),
                  SizedBox(
                    height: 10,
                  ),
                  buildIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.tts,
                    style: TextStyle(color: Colors.blue[300]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 210,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).dialogBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(AppLocalizations.of(context)!.enterYourTextToConvert),
                              SizedBox(
                                width: 50,
                              ),

                              IconButton(
                                  onPressed: () {
                                    textToSignController.clear();
                                  }, icon: Icon(Icons.clear))
                            ],
                          ),
                          TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return AppLocalizations.of(context)!.enter6Digit;
                                } else {
                                  return null;
                                }
                              },
                              controller: textToSignController,
                              minLines: 1,
                              maxLines: 4,
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.enterYourTextHere,
                                hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                                contentPadding: EdgeInsets.only(
                                    top: 20), // add padding to adjust text
                              )),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.29,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[400],
                                  shadowColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    // AppNavigator.customNavigator(
                                    //     context: context, screen: HomeLayout(), finish: false);
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.convert,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'PlaypenSans',
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.stt,
                    style: TextStyle(color: Colors.blue[300]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).dialogBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(AppLocalizations.of(context)!.uploadImageOrVideo),
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(mainAxisAlignment: MainAxisAlignment.center
                                ,children: [
                                  InkWell(
                                    onTap: (){
                                      PickImageFromCamera();
                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.camera_alt,color: Colors.white,size: 35),
                                      backgroundColor: Colors.blue,
                                      maxRadius: 35,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(AppLocalizations.of(context)!.camera)
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.center
                                ,children: [
                                  InkWell(onTap: (){
                                    PickImageFromGallery();
                                  },
                                    child: CircleAvatar(
                                      child: Icon(Icons.image,color: Colors.white,size: 35),
                                      backgroundColor: Colors.blue,
                                      maxRadius: 35,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(AppLocalizations.of(context)!.gallery,)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.ats,
                    style: TextStyle(color: Colors.blue[300]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).dialogBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: ()=> AppNavigator.customNavigator(context: context, screen: AudioToTextView(), finish: false),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center
                          ,children: [
                          CircleAvatar(
                            child: Icon(Icons.mic,color: Colors.white,size: 40),
                            backgroundColor: Colors.blue,
                            maxRadius: 35,
                          ),
                          SizedBox(height: 10,),
                          Text(AppLocalizations.of(context)!.tapHere)
                        ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        width: 900,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: carouselImages.length,
        effect: ExpandingDotsEffect(
            dotWidth: 7, dotHeight: 6, activeDotColor: Colors.blue),
      );


  Future PickImageFromGallery() async {
    final returnedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }

  Future PickImageFromCamera() async {
    final returnedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }
}

