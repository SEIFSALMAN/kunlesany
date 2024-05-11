import 'package:flutter/material.dart';
import 'package:kunlesany/modules/education/single_video_education_view.dart';
import 'package:kunlesany/shared/providers/bookmark_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../shared/components/navigator.dart';
import '../../shared/components/toast_messages.dart';
import '../../shared/cubits/education/education_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  @override
  Widget build(BuildContext context) {
    final bookmarkLettersProvider = Provider.of<BookmarkLettersProvider>(context);
    final arabicLettersVideo = bookmarkLettersProvider.arabicLettersVideo;
    final bookmarkNumbersProvider = Provider.of<BookmarkNumbersProvider>(context);
    final arabicNumbersVideo = bookmarkNumbersProvider.arabicNumberVideo;
    final bookmarkWordsProvider = Provider.of<BookmarkWordsProvider>(context);
    final arabicWordsVideo = bookmarkWordsProvider.arabicWordsVideo;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.bookmarkVideos),
        centerTitle: true,
        elevation: 1,
      ),
      body: arabicLettersVideo.isEmpty && arabicNumbersVideo.isEmpty && arabicWordsVideo.isEmpty  ? Center(child: Text("No bookmark video"),) :
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: arabicLettersVideo.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final video = arabicLettersVideo[index];
                return ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("⚫"),
                      ),
                      SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 220,
                              child: Text(
                                video.videoName,
                                style: TextStyle(fontSize: 16),
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                              )),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "${AppLocalizations.of(context)!.duration} : ${video.duration}",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          bookmarkLettersProvider.toggleFavorite(video);
                          showToast(
                              message: (video.bookmarked == true)
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


                            (bookmarkLettersProvider.isExist(video) ==
                                true)
                                ? Icons.bookmark_remove
                                : Icons.bookmark_add_outlined,
                            color: (bookmarkLettersProvider
                                .isExist(video) ==
                                true)
                                ? Colors.blue[600]
                                : Colors.grey,
                            size: 22),
                      )
                    ],
                  ),
                  onTap: () {
                    AppNavigator.customNavigator(
                        context: context,
                        screen: SingleVideoEducationView(
                         video.image,
                         video.videoName,
                         video.languageTypeName,
                         video.url,
                         video.descriptionOfVideo,
                         video.bookmarked,
                        ),
                        finish: false);
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: arabicNumbersVideo.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final video = arabicNumbersVideo[index];
                return ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("⚫"),
                      ),
                      SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 220,
                              child: Text(
                                video.videoName,
                                style: TextStyle(fontSize: 16),
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                              )),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "${AppLocalizations.of(context)!.duration} : ${video.duration}",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          bookmarkNumbersProvider.toggleFavorite(video);
                          showToast(
                              message: (video.bookmarked == true)
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


                            (bookmarkNumbersProvider.isExist(video) ==
                                true)
                                ? Icons.bookmark_remove
                                : Icons.bookmark_add_outlined,
                            color: (bookmarkNumbersProvider
                                .isExist(video) ==
                                true)
                                ? Colors.blue[600]
                                : Colors.grey,
                            size: 22),
                      )
                    ],
                  ),
                  onTap: () {
                    AppNavigator.customNavigator(
                        context: context,
                        screen: SingleVideoEducationView(
                         video.image,
                         video.videoName,
                         video.languageTypeName,
                         video.url,
                         video.descriptionOfVideo,
                         video.bookmarked,
                        ),
                        finish: false);
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: arabicWordsVideo.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final video = arabicWordsVideo[index];
                return ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("⚫"),
                      ),
                      SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 220,
                              child: Text(
                                video.videoName,
                                style: TextStyle(fontSize: 16),
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                              )),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "${AppLocalizations.of(context)!.duration} : ${video.duration}",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          bookmarkWordsProvider.toggleFavorite(video);
                          showToast(
                              message: (video.bookmarked == true)
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


                            (bookmarkWordsProvider.isExist(video) ==
                                true)
                                ? Icons.bookmark_remove
                                : Icons.bookmark_add_outlined,
                            color: (bookmarkWordsProvider
                                .isExist(video) ==
                                true)
                                ? Colors.blue[600]
                                : Colors.grey,
                            size: 22),
                      )
                    ],
                  ),
                  onTap: () {
                    AppNavigator.customNavigator(
                        context: context,
                        screen: SingleVideoEducationView(
                         video.image,
                         video.videoName,
                         video.languageTypeName,
                         video.url,
                         video.descriptionOfVideo,
                         video.bookmarked,
                        ),
                        finish: false);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
