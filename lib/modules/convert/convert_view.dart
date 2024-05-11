import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

import '../../shared/components/navigator.dart';
import '../wait_view.dart';

class ConvertView extends StatefulWidget {
  const ConvertView({super.key});

  @override
  State<ConvertView> createState() => _ConvertViewState();
}

class _ConvertViewState extends State<ConvertView>
    with SingleTickerProviderStateMixin {


  bool isFabVisible = true;


  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Convert',style:TextStyle(fontFamily: 'PlaypenSans')),
      ),
      body: NotificationListener<UserScrollNotification>(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 0),
          child: Column(children: [
            SizedBox(height: 5),
            Flexible(
                flex: 1,
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    width: double.infinity,
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(42)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrange[400]!,
                            offset: const Offset(0, 6),
                            blurRadius: 22,
                            spreadRadius: -5,
                          ),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.deepOrange[300]!,
                              Colors.deepOrange[100]!,
                              Colors.deepOrange[200]!,
                              Colors.deepOrange[300]!,
                            ],
                            stops: const [
                              0.1,
                              0.3,
                              0.9,
                              1.0
                            ])),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sign Input",style: TextStyle(fontSize: 25,fontFamily: 'PlaypenSans',color: Colors.black),),
                              Text("● Output will be voice or text",style: TextStyle(fontSize: 12,fontFamily: 'PlaypenSans',color: Colors.grey[900]),)
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset("assets/images/sign-language.png",height: 180,width: 140,)

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 25),
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: (){},
                child: Container(
                  width: double.infinity,
                  height: 210,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(42)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green[400]!,
                          offset: const Offset(0, 6),
                          blurRadius: 22,
                          spreadRadius: -5,
                        ),
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.green[300]!,
                            Colors.green[100]!,
                            Colors.green[200]!,
                            Colors.green[300]!,
                          ],
                          stops: const [
                            0.1,
                            0.3,
                            0.9,
                            1.0
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Voice Input",style: TextStyle(fontSize: 25,fontFamily: 'PlaypenSans',color: Colors.black),),
                            Text("● Output will be text or sign",style: TextStyle(fontSize: 12,fontFamily: 'PlaypenSans',color: Colors.grey[900]),)
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/images/microphone.png",height: 180,width: 140,)

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: (){},
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(42)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurpleAccent[400]!,
                          offset: const Offset(0, 1),
                          blurRadius: 25,
                          spreadRadius: -10,
                        ),
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.pink[300]!,
                            Colors.pink[100]!,
                            Colors.pink[200]!,
                            Colors.pink[300]!,
                          ],
                          stops: const [
                            0.1,
                            0.3,
                            0.9,
                            1.0
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Text Input",style: TextStyle(fontSize: 25,fontFamily: 'PlaypenSans',color: Colors.black),),
                            Text("● Output will be voice or sign",style: TextStyle(fontSize: 12,fontFamily: 'PlaypenSans',color: Colors.grey[900]),)
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/images/document.png",height: 180,width: 140,)

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
        // floatingActionButton: isFabVisible
        //     ? FloatingActionBubble(
        //   items: <Bubble>[
        //     Bubble(
        //       title: "Voice",
        //       iconColor: Colors.white,
        //       bubbleColor: Colors.blue,
        //       icon: Icons.keyboard_voice_rounded,
        //       titleStyle: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlaypenSans'),
        //       onPress: () {
        //         AppNavigator.customNavigator(context: context, screen: WaitView(), finish: false);
        //         _animationController!.reverse();
        //       },
        //     ),
        //     Bubble(
        //       title: "Text",
        //       iconColor: Colors.white,
        //       bubbleColor: Colors.blue,
        //       icon: Icons.text_fields_sharp,
        //       titleStyle: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlaypenSans'),
        //       onPress: () {
        //         AppNavigator.customNavigator(context: context, screen: WaitView(), finish: false);
        //         _animationController!.reverse();
        //       },
        //     ),
        //     Bubble(
        //       title: "Sign",
        //       iconColor: Colors.white,
        //       bubbleColor: Colors.blue,
        //       icon: Icons.waving_hand_rounded,
        //       titleStyle: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'PlaypenSans'),
        //       onPress: () {
        //         AppNavigator.customNavigator(context: context, screen: WaitView(), finish: false);
        //         _animationController!.reverse();
        //       },
        //     ),
        //   ],
        //   animation: _animation!,
        //   onPress: () => _animationController!.isCompleted
        //       ? _animationController!.reverse()
        //       : _animationController!.forward(),
        //   backGroundColor: Colors.blue,
        //   iconColor: Colors.white,
        //   iconData: Icons.swap_horiz_rounded,
        // )
        //     : null
    );
  }
}
