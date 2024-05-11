import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kunlesany/modules/education/bookmarks_view.dart';
import 'package:kunlesany/modules/education/single_video_education_view.dart';
import 'package:kunlesany/modules/quizzes/letters_quiz_view.dart';
import 'package:kunlesany/shared/components/navigator.dart';
import 'package:kunlesany/shared/cubits/education/education_cubit.dart';
import 'package:kunlesany/shared/providers/bookmark_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../shared/components/toast_messages.dart';

class EducationView extends StatefulWidget {
  @override
  State<EducationView> createState() => _EducationViewState();
}

class _EducationViewState extends State<EducationView> {
  double percent = 0.3;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EducationCubit, EducationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(height: 0),
                                Text(
                                  (percent == 1.0)
                                      ? AppLocalizations.of(context)!.wellDone
                                      : AppLocalizations.of(context)!.progress,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                CircularPercentIndicator(
                                  radius: 50.0,
                                  animation: true,
                                  animationDuration: 900,
                                  lineWidth: 10.0,
                                  percent: percent,
                                  reverse: false,
                                  center: const Text(
                                    "30%",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.white),
                                  ),
                                  arcType: ArcType.FULL,
                                  startAngle: 0.0,
                                  animateFromLastPercent: true,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  backgroundColor: Colors.yellow,
                                  linearGradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    tileMode: TileMode.clamp,
                                    stops: [0.0, 1.0],
                                    colors: <Color>[
                                      Colors.white,
                                      Colors.grey,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, bottom: 12),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .arabicCourseText,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'PlaypenSans',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.asset(
                                  "assets/images/boy.png",
                                  height: 170,
                                  width: 170,
                                )),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          AppNavigator.customNavigator(
                              context: context,
                              screen: const BookmarkView(),
                              finish: false);
                        },
                        icon: const Icon(
                          Icons.bookmark,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: ExpansionTile(
                      textColor: Colors.blue,
                      iconColor: Colors.blue,
                      collapsedShape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      title: Text(AppLocalizations.of(context)!.section1,style: TextStyle(fontSize: 16),
                      ),
                      leading: const Icon(Icons.sort_by_alpha),
                      //add icon
                      collapsedBackgroundColor: Theme.of(context).cardColor,
                      //children padding
                      children: [buildLettersListTileRow()],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
                      onTap: () => AppNavigator.customNavigator(
                          context: context,
                          screen: const QuizLettersView(),
                          finish: false),
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.quiz),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(AppLocalizations.of(context)!.quizOnLetters,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: ExpansionTile(
                      textColor: Colors.blue,
                      iconColor: Colors.blue,
                      collapsedShape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      title: Text(AppLocalizations.of(context)!.section2,style: TextStyle(fontSize: 16)),
                      leading: const Icon(Icons.numbers),
                      //add icon
                      collapsedBackgroundColor: Theme.of(context).cardColor,
                      //children padding
                      children: [buildNumbersListTileRow()],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
                      onTap: () => AppNavigator.customNavigator(
                          context: context,
                          screen: const QuizLettersView(),
                          finish: false),
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.quiz),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(AppLocalizations.of(context)!.quizOnNumbers)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: ExpansionTile(
                      textColor: Colors.blue,
                      iconColor: Colors.blue,
                      collapsedShape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      title: Text(AppLocalizations.of(context)!.section3,style: TextStyle(fontSize: 16)),
                      leading: const Icon(Icons.type_specimen_rounded),
                      //add icon
                      collapsedBackgroundColor: Theme.of(context).cardColor,
                      //children padding
                      children: [buildWordsListTileRow()],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
                      onTap: () => AppNavigator.customNavigator(
                          context: context,
                          screen: const QuizLettersView(),
                          finish: false),
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.quiz),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(AppLocalizations.of(context)!.quizOnWords)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: ExpansionTile(
                      textColor: Colors.blue,
                      iconColor: Colors.blue,
                      collapsedShape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      title: Text(AppLocalizations.of(context)!.section4,style: TextStyle(fontSize: 16)),
                      leading: const Icon(Icons.type_specimen_rounded),
                      //add icon
                      collapsedBackgroundColor: Theme.of(context).cardColor,
                      //children padding
                      children: [buildSentenceListTileRow()],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
                      onTap: () => AppNavigator.customNavigator(
                          context: context,
                          screen: const QuizLettersView(),
                          finish: false),
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.quiz),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(AppLocalizations.of(context)!.quizOnSentence)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildLettersListTileRow() {
    var arabicModel = EducationCubit.get(context).arabicLettersModel;
    final favoriteProvider = Provider.of<BookmarkLettersProvider>(context);

    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      child: ListView.builder(
        itemCount: arabicModel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${index += 1}"),
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 220,
                        child: Text(
                          arabicModel[index -= 1].videoName,
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        )),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${AppLocalizations.of(context)!.duration} : ${arabicModel[index].duration}",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      favoriteProvider
                          .toggleFavorite(arabicModel[index]);
                      arabicModel[index].bookmarked =
                          !arabicModel[index].bookmarked;
                    });
                    showToast(
                        message: (arabicModel[index].bookmarked == false)
                            ? AppLocalizations.of(context)!.removeBookmark
                            : AppLocalizations.of(context)!.addedBookmark,
                        state: ToastStates.WARNING,
                        duartion: 5);
                  },
                  icon: Icon(
                      // (arabicModel[index].bookmarked == false)
                      //     ? Icons.bookmark_add_outlined
                      //     : Icons.bookmark,
                      // color: (arabicModel[index].bookmarked == false)
                      //     ? Colors.grey
                      //     : Colors.blue[700],

                      (favoriteProvider.isExist(arabicModel[index]) ==
                              true)
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined,
                      color: (favoriteProvider
                                  .isExist(arabicModel[index]) ==
                              true)
                          ? Colors.blue[600]
                          : Colors.grey,
                      size: 25),
                )
              ],
            ),
            onTap: () {
              AppNavigator.customNavigator(
                  context: context,
                  screen: SingleVideoEducationView(
                    arabicModel[index].image,
                    arabicModel[index].videoName,
                    arabicModel[index].languageTypeName,
                    arabicModel[index].url,
                    arabicModel[index].descriptionOfVideo,
                    arabicModel[index].bookmarked,
                  ),
                  finish: false);
            },
          );
        },
      ),
    );
  }

  Widget buildNumbersListTileRow() {
    var arabicModel = EducationCubit.get(context).arabicNumbersModel;
    final favoriteProvider = Provider.of<BookmarkNumbersProvider>(context);

    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      child: ListView.builder(
        itemCount: arabicModel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${index += 1}"),
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 220,
                        child: Text(
                          arabicModel[index -= 1].videoName,
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        )),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${AppLocalizations.of(context)!.duration} : ${arabicModel[index].duration}",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      favoriteProvider
                          .toggleFavorite(arabicModel[index]);
                      arabicModel[index].bookmarked =
                      !arabicModel[index].bookmarked;
                    });
                    showToast(
                        message: (arabicModel[index].bookmarked == false)
                            ? AppLocalizations.of(context)!.removeBookmark
                            : AppLocalizations.of(context)!.addedBookmark,
                        state: ToastStates.WARNING,
                        duartion: 5);
                  },
                  icon: Icon(
                    // (arabicModel[index].bookmarked == false)
                    //     ? Icons.bookmark_add_outlined
                    //     : Icons.bookmark,
                    // color: (arabicModel[index].bookmarked == false)
                    //     ? Colors.grey
                    //     : Colors.blue[700],

                      (favoriteProvider.isExist(arabicModel[index]) ==
                          true)
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined,
                      color: (favoriteProvider
                          .isExist(arabicModel[index]) ==
                          true)
                          ? Colors.blue[600]
                          : Colors.grey,
                      size: 25),
                )
              ],
            ),
            onTap: () {
              AppNavigator.customNavigator(
                  context: context,
                  screen: SingleVideoEducationView(
                    arabicModel[index].image,
                    arabicModel[index].videoName,
                    arabicModel[index].languageTypeName,
                    arabicModel[index].url,
                    arabicModel[index].descriptionOfVideo,
                    arabicModel[index].bookmarked,
                  ),
                  finish: false);
            },
          );
        },
      ),
    );
  }

  Widget buildWordsListTileRow() {
    var arabicModel = EducationCubit.get(context).arabicWordsModel;
    final favoriteProvider = Provider.of<BookmarkLettersProvider>(context);

    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      child: ListView.builder(
        itemCount: arabicModel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${index += 1}"),
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 220,
                        child: Text(
                          arabicModel[index -= 1].videoName,
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        )),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${AppLocalizations.of(context)!.duration} : ${arabicModel[index].duration}",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      favoriteProvider
                          .toggleFavorite(arabicModel[index]);
                      arabicModel[index].bookmarked =
                      !arabicModel[index].bookmarked;
                    });
                    showToast(
                        message: (arabicModel[index].bookmarked == false)
                            ? AppLocalizations.of(context)!.removeBookmark
                            : AppLocalizations.of(context)!.addedBookmark,
                        state: ToastStates.WARNING,
                        duartion: 5);
                  },
                  icon: Icon(
                    // (arabicModel[index].bookmarked == false)
                    //     ? Icons.bookmark_add_outlined
                    //     : Icons.bookmark,
                    // color: (arabicModel[index].bookmarked == false)
                    //     ? Colors.grey
                    //     : Colors.blue[700],

                      (favoriteProvider.isExist(arabicModel[index]) ==
                          true)
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined,
                      color: (favoriteProvider
                          .isExist(arabicModel[index]) ==
                          true)
                          ? Colors.blue[600]
                          : Colors.grey,
                      size: 25),
                )
              ],
            ),
            onTap: () {
              AppNavigator.customNavigator(
                  context: context,
                  screen: SingleVideoEducationView(
                    arabicModel[index].image,
                    arabicModel[index].videoName,
                    arabicModel[index].languageTypeName,
                    arabicModel[index].url,
                    arabicModel[index].descriptionOfVideo,
                    arabicModel[index].bookmarked,
                  ),
                  finish: false);
            },
          );
        },
      ),
    );
  }

  //To be used
  Widget buildSentenceListTileRow() {
    var arabicModel = EducationCubit.get(context).arabicLettersModel;
    final favoriteProvider = Provider.of<BookmarkLettersProvider>(context);

    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      width: double.infinity,
      child: ListView.builder(
        itemCount: arabicModel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${index += 1}"),
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 220,
                        child: Text(
                          arabicModel[index -= 1].videoName,
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        )),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${AppLocalizations.of(context)!.duration} : ${arabicModel[index].duration}",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      favoriteProvider
                          .toggleFavorite(arabicModel[index]);
                      arabicModel[index].bookmarked =
                      !arabicModel[index].bookmarked;
                    });
                    showToast(
                        message: (arabicModel[index].bookmarked == false)
                            ? AppLocalizations.of(context)!.removeBookmark
                            : AppLocalizations.of(context)!.addedBookmark,
                        state: ToastStates.WARNING,
                        duartion: 5);
                  },
                  icon: Icon(
                    // (arabicModel[index].bookmarked == false)
                    //     ? Icons.bookmark_add_outlined
                    //     : Icons.bookmark,
                    // color: (arabicModel[index].bookmarked == false)
                    //     ? Colors.grey
                    //     : Colors.blue[700],

                      (favoriteProvider.isExist(arabicModel[index]) ==
                          true)
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined,
                      color: (favoriteProvider
                          .isExist(arabicModel[index]) ==
                          true)
                          ? Colors.blue[600]
                          : Colors.grey,
                      size: 25),
                )
              ],
            ),
            onTap: () {
              AppNavigator.customNavigator(
                  context: context,
                  screen: SingleVideoEducationView(
                    arabicModel[index].image,
                    arabicModel[index].videoName,
                    arabicModel[index].languageTypeName,
                    arabicModel[index].url,
                    arabicModel[index].descriptionOfVideo,
                    arabicModel[index].bookmarked,
                  ),
                  finish: false);
            },
          );
        },
      ),
    );
  }

}
