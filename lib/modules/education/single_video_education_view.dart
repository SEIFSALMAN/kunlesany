import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

class SingleVideoEducationView extends StatefulWidget {
  final String imageURL;
  final String videoName;
  final String languageTypeName;
  final String videoURL;
  final String descriptionOfVideo;
  bool bookmarked;

  SingleVideoEducationView(this.imageURL, this.videoName, this.languageTypeName,
      this.videoURL ,this.descriptionOfVideo, this.bookmarked, {super.key});

  @override
  State<SingleVideoEducationView> createState() =>
      _SingleVideoEducationViewState();
}

class _SingleVideoEducationViewState extends State<SingleVideoEducationView> {
  bool bookmarked = false;

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  void initPlayer() async {
    videoPlayerController = VideoPlayerController.asset(widget.videoURL);
    videoPlayerController.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 5 / 3,
        autoPlay: true,
        looping: true,
        additionalOptions: (context) {
          return <OptionItem>[
            OptionItem(
                onTap: () => debugPrint("Option1 Pressed"),
                iconData: Icons.bookmark_add,
                title: "Save to bookmark"),
            OptionItem(
                onTap: () => debugPrint("Option2 Pressed"),
                iconData: Icons.share,
                title: "Share"),
          ];
        });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          '${AppLocalizations.of(context)!.learning}: ${widget.languageTypeName}',
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 270,
                width: double.maxFinite,
                child: Chewie(controller: chewieController)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(child: Text(widget.videoName)),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Text("DESCRIPTION", style: TextStyle(fontSize: 12)),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ReadMoreText(widget.descriptionOfVideo,
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: AppLocalizations.of(context)!.seeMore,
                      trimExpandedText: AppLocalizations.of(context)!.seeLess,
                      lessStyle: TextStyle(color: Colors.blue[400]),
                      moreStyle: TextStyle(color: Colors.blue[400]),
                      textAlign: TextAlign.center,


                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Text("RECOMMENDED VIDEOS",
                            style: TextStyle(fontSize: 12)),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    SingleRecommendedVideo(numberText: "1", assetImageText: "assets/images/quizLettersImages/02.png", titleText: "حرف الباء", durationText: "0:02"),
                    const SizedBox(height: 10),
                    SingleRecommendedVideo(numberText: "2", assetImageText: "assets/images/quizLettersImages/03.png", titleText: "حرف التاء", durationText: "0:01"),
                    const SizedBox(height: 10),
                    SingleRecommendedVideo(numberText: "3", assetImageText: "assets/images/quizLettersImages/04.png", titleText: "حرف الخاء", durationText: "0:02"),
                    const SizedBox(height: 10),
                    SingleRecommendedVideo(numberText: "4", assetImageText: "assets/images/quizLettersImages/05.png", titleText: "حرف الجيم", durationText: "0:03"),
                    const SizedBox(height: 10),
                    SingleRecommendedVideo(numberText: "5", assetImageText: "assets/images/quizLettersImages/06.png", titleText: "حرف الحاء", durationText: "0:02"),
                    const SizedBox(height: 10),
                    SingleRecommendedVideo(numberText: "6", assetImageText: "assets/images/quizLettersImages/07.png", titleText: "حرف الخاء", durationText: "0:02"),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SingleRecommendedVideo({
    required String numberText,
    required String assetImageText,
    required String titleText,
    required String durationText,
})
  {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Theme.of(context).dialogBackgroundColor),
      padding: EdgeInsets.all(10),
      width:  double.infinity,
      height: 70,
      child: Row(
        children: [
          Text(numberText),
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(assetImageText)
                )
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(titleText), Text(durationText)],
          )
        ],
      ),
    );

  }

}
