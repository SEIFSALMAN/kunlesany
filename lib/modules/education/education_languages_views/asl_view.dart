import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/navigator.dart';
import '../bookmarks_view.dart';
import '../single_video_education_view.dart';

class ASLModel {
  final String videoName;
  final String languageTypeName;
  final String abbreviation;
  final String image;
  final String url;

  ASLModel(this.videoName, this.languageTypeName, this.abbreviation, this.image,
      this.url);
}

List<ASLModel> aslModel = [
  ASLModel(
      'Beginner ASL Course Introduction',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/3nu8PEqI3jY/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLAPxRDThLCm9LNfHbcIGvz087hwZA',
      'https://youtu.be/3nu8PEqI3jY?si=Cji8AF_hwH1LLCSw'),
  ASLModel(
      '1a. Beginner ASL Lesson One Part I: Vocabulary',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/aDoMvhP2u7k/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDVQB8wuUBrtQUeDmZ9XmH1GEugYg',
      'https://youtu.be/aDoMvhP2u7k?si=d90CBKclkNxt-fYZ'),
  ASLModel(
      '1b. Beginner ASL Lesson One Part II: Sentences',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/E9cWe0pFv-4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLAgPfJhtGTAc6m8PiIwWDkuoIL8Uw',
      'https://youtu.be/E9cWe0pFv-4?si=iYVWtCsGEpAS6rd8'),
  ASLModel(
      '1c. Beginner ASL Lesson One Part III Quiz',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/IG9j_dzPLHo/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLANUPFqK7F1rYHbje6BJy7xUbrj1A',
      'https://youtu.be/IG9j_dzPLHo?si=DsHsZc_ZFGgdtdmp'),
  ASLModel(
      '2a. Beginner ASL Lesson Two Part I: Vocabulary',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/YJ5yjwKwxC4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCX895WRKjmpwYGcRDEyL990116ZQ',
      'https://youtu.be/YJ5yjwKwxC4?si=Z9DdhQB5K9xJWedi'),
  ASLModel(
      '2b. Beginner ASL Lesson Two Part II: Sentences',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/K7WNkwwVDRg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCRHPmgAEh0docyuVtT5qtB0VBgsA',
      'https://youtu.be/K7WNkwwVDRg?si=w9W7nvt7O-cuBJr2'),
  ASLModel(
      '2c. Beginner ASL Lesson Two Part III: Quiz',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/gdWAd9KaZxU/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLAU6sfhZwRTmbAVcuY8EFE_EJaRAA',
      'https://youtu.be/gdWAd9KaZxU?si=WY-fd8b4Nd9SHW3W'),
  ASLModel(
      '3a. Beginner ASL Lesson Three Part I: Vocabulary',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/PRfb-Xp3wOg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCKMLM160415RSpFq_hHAuyXvhU4g',
      'https://youtu.be/PRfb-Xp3wOg?si=cWsVZ2bsmV1KUs8O'),
  ASLModel(
      '3b. Beginner ASL Lesson Three Part II: Sentences',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/58aGCCR3Uec/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLBWs-hvKVPerrlwLxuy_RlK1Jgj3Q',
      'https://youtu.be/58aGCCR3Uec?si=5kKexJwFtKNlGs63'),
  ASLModel(
      '3c. Beginner ASL Lesson three Part III: Quiz',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/DsSqXMOVXm4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDF-LMYEd92pTFwjOE9Q7eDZh7CIA',
      'https://youtu.be/wxJpnsAmrDs?si=8rmxV0PUFvCqwncD'),
  ASLModel(
      '4a. Beginner ASL Lesson Four Part I: Vocabulary',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/XA4TD99OqJE/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCoqULEko668Em4QtkwgwyBSnsTAA',
      'https://youtu.be/DsSqXMOVXm4?si=IzMlq6eKkB2u5Hwi'),
  ASLModel(
      '4b. Beginner ASL Lesson Four Part II: Sentences',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/XA4TD99OqJE/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCoqULEko668Em4QtkwgwyBSnsTAA',
      'https://youtu.be/XA4TD99OqJE?si=61IGQa3_UvfmaVVY'),
  ASLModel(
      '4c. Beginner ASL Lesson Four Part III: Quiz',
      'American Sign Language',
      'ASL',
      'https://i.ytimg.com/vi/qRO8NCqL_Xw/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDXvh4ymgUo1kXULc9XOLKadEUCag',
      'https://youtu.be/qRO8NCqL_Xw?si=nWPm0Og-DU28s69c'),
  ASLModel(
      '5a. Beginner ASL Lesson Five Part I: Vocabulary',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/K7WNkwwVDRg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCRHPmgAEh0docyuVtT5qtB0VBgsA',
      'https://youtu.be/7KN24x_db5E?si=W9rjVUHYvHrTWNVq'),
  ASLModel(
      '5b. Beginner ASL Lesson Five Part II: Sentences',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/YJ5yjwKwxC4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCX895WRKjmpwYGcRDEyL990116ZQ',
      'https://youtu.be/4Iw231ImHIk?si=_HLyFx4_NbJJjAH-'),
  ASLModel(
      '5c. Beginner ASL Lesson Five Part III Quiz',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/IG9j_dzPLHo/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLANUPFqK7F1rYHbje6BJy7xUbrj1A',
      'https://youtu.be/4Iw231ImHIk?si=qQBI775gpPb-0IKR'),
  ASLModel(
      '6a. Beginner ASL Lesson Six Part I: Vocabulary',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/YJ5yjwKwxC4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCX895WRKjmpwYGcRDEyL990116ZQ',
      'https://youtu.be/DxfCmf92VpM?si=T6QASUTwoZZBxTr-'),
  ASLModel(
      '6b. Beginner ASL Lesson Six Part II: Sentences',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/K7WNkwwVDRg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCRHPmgAEh0docyuVtT5qtB0VBgsA',
      'https://youtu.be/JgHj6pA6mGc?si=8_gDDVEWQBP75hve'),
  ASLModel(
      '6c. Beginner ASL Lesson Six Part III Quiz',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/IG9j_dzPLHo/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLANUPFqK7F1rYHbje6BJy7xUbrj1A',
      'https://youtu.be/3XSn0k3gFpk?si=uFQZoanajRjl_K8H'),
  ASLModel(
      '7a. Beginner ASL Lesson Seven Part I: Vocabulary',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/IG9j_dzPLHo/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLANUPFqK7F1rYHbje6BJy7xUbrj1A',
      'https://youtu.be/SpSOin_oeZM?si=Q_kYj9e7NUhBcuRD'),
  ASLModel(
      '7b. Beginner ASL Lesson Seven Part II: Sentences',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/K7WNkwwVDRg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCRHPmgAEh0docyuVtT5qtB0VBgsA',
      'https://youtu.be/t8WFCEp3Fr4?si=cBCPpCP8Gn6gFpCd'),
  ASLModel(
      '7c. Beginner ASL Lesson Seven Part III Quiz',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/YJ5yjwKwxC4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCX895WRKjmpwYGcRDEyL990116ZQ',
      'https://youtu.be/scqDGH34g7I?si=ERgha6ZaoJou4DY_'),
  ASLModel(
      '8a. Beginner ASL Lesson Eight Part I: Vocabulary',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/K7WNkwwVDRg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCRHPmgAEh0docyuVtT5qtB0VBgsA',
      'https://youtu.be/yN46-WqQ6d4?si=tvlDF2c9ZTZNe8Rw'),
  ASLModel(
      '8b. Beginner ASL Lesson Eight Part II: Sentences',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/IG9j_dzPLHo/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLANUPFqK7F1rYHbje6BJy7xUbrj1A',
      'https://youtu.be/dohaOkA49Mo?si=OStB7RNXJy8y9YTJ'),
  ASLModel(
      '8c. Beginner ASL Lesson Eight Part III Quiz',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/YJ5yjwKwxC4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCX895WRKjmpwYGcRDEyL990116ZQ',
      'https://youtu.be/ZbqQ3irwEJA?si=uM7JQ5n1U2IV2cl1'),
  ASLModel(
      '9a. Beginner ASL Lesson Nine Part I: Vocabulary',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/K7WNkwwVDRg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCRHPmgAEh0docyuVtT5qtB0VBgsA',
      'https://youtu.be/SI0JrmQxtM0?si=l_CHB29sZJfZI1m3'),
  ASLModel(
      '9b. Beginner ASL Lesson Nine Part II: Sentences',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/K7WNkwwVDRg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCRHPmgAEh0docyuVtT5qtB0VBgsA',
      'https://youtu.be/M8WlFyB7wMo?si=zLAQbkBOnXA-gMN3'),
  ASLModel(
      '9c. Beginner ASL Lesson Nine Part III Quiz',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/YJ5yjwKwxC4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCX895WRKjmpwYGcRDEyL990116ZQ',
      'https://youtu.be/Rm0AqhNe15U?si=x2EYecPbVweJwGDH'),
  ASLModel(
      '10a. Beginner ASL Lesson Ten Part I: Vocabulary',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/IG9j_dzPLHo/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLANUPFqK7F1rYHbje6BJy7xUbrj1A',
      'https://youtu.be/yPAPkxoDKb0?si=MTMr_ZGJIHTFAc_e'),
  ASLModel(
      '10b. Beginner ASL Lesson Ten Part II: Sentences',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/YJ5yjwKwxC4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCX895WRKjmpwYGcRDEyL990116ZQ',
      'https://youtu.be/7ykVRqlCq-w?si=5JsYsSmqcEVj1vJs'),
  ASLModel(
      '10c. Beginner ASL Lesson Ten Part III Quiz',
      "American Sign Language",
      'ASL',
      'https://i.ytimg.com/vi/IG9j_dzPLHo/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLANUPFqK7F1rYHbje6BJy7xUbrj1A',
      'https://youtu.be/QYx9Re9VHSk?si=EfRLDWJ0cLV3fC16'),
];

class ASLView extends StatefulWidget {
  @override
  State<ASLView> createState() => _ASLViewState();
}

class _ASLViewState extends State<ASLView> {
  bool bookmarked = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(14.0),
                  //   child: CupertinoSearchTextField(
                  //     controller: searchController,
                  //     onChanged: (value) {},
                  //     onSubmitted: (value) {},
                  //     autocorrect: true,
                  //   ),
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              child: buildSingleVideoRow(
                                  context: context,
                                  text: aslModel[index].videoName,
                                  imageURL: aslModel[index].image),
                              onTap: (){}
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Divider(
                              thickness: 1,
                            )
                          ],
                        );
                      },
                      itemCount: aslModel.length,
                    ),
                  ),
                ],
              ))),
    );
  }

  Widget buildSingleVideoRow({
    required BuildContext context,
    required String text,
    required String imageURL,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110,
            height: 75,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(imageURL)),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
            text,
            style: TextStyle(fontSize: 13),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 15),
            child: IconButton(
              onPressed: () {
                setState(() {
                  bookmarked = !bookmarked;
                });
              },
              icon: Icon(
                (bookmarked == false)
                    ? Icons.bookmark_add_outlined
                    : Icons.bookmark,
                size: 25,
              ),
            ),
          )
        ],
      );
}
