import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/navigator.dart';
import '../bookmarks_view.dart';
import '../single_video_education_view.dart';

class BSLModel {
  final String videoName;
  final String languageTypeName;
  final String abbreviation;
  final String image;
  final String url;

  BSLModel(this.videoName, this.languageTypeName, this.abbreviation, this.image,
      this.url);
}

List<BSLModel> bslMode = [
  BSLModel(
      'Learn how to sign: Basic Greetings - using British Sign Language',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/7qDijc7cogI/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLBVx63LKy664YtcDMaNd8hAacYHyw',
      'https://youtu.be/PPIJNrboJGs?si=RcsFrz9nqXhTjqNV'),
  BSLModel(
      'Learn how to sign: Food items - using British Sign Language',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/8qOjAGnW4tQ/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLBCQ90mwIKidJ9j_o2bAu6dFP3VFA',
      'https://youtu.be/8qOjAGnW4tQ?si=46DSid3R0TinW9wn'),
  BSLModel(
      'Learn how to sign: Family - using British Sign Language',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/ePwluq1EB-4/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLClUE7EoxdcNNGz663XuH3fvq46bw',
      'https://youtu.be/ePwluq1EB-4?si=ETnuo5eUYz-L6Jeu'),
  BSLModel(
      'Learn how to sign: Hobbies - using British Sign Language.',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/8msCvGJCfNg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLAYHsvviYYoynktniJEo0fuvd-B7w',
      'https://youtu.be/8msCvGJCfNg?si=iYygCDaoBks6CCgs'),
  BSLModel(
      'Learn how to sign: Emotions - using British Sign Language',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/lrb68_u-YKA/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLC_xao_0v55gh-JMtZDtj5Mj7xKCw',
      'https://youtu.be/lrb68_u-YKA?si=WyhMBXeiem8ISo1G'),
  BSLModel(
      'Learn how to sign: British sign language common signs - using British Sign Language',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/XYex04nGdfg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLA5YPT4W_RyFhJbzcfOIVntnGgSKQ',
      'https://youtu.be/XYex04nGdfg?si=Lqq5ikQctWS9DHLK'),
  BSLModel(
      'Learn how to sign: Order drinks - using British Sign Language',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/2s74NmGtWig/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLBvVnH3e4FWIp7G0MD07oGyFK34lA',
      'https://youtu.be/2s74NmGtWig?si=5L1tcA8IMtft71Hw'),
  BSLModel(
      'Learn how to sign: Stay at Home, Save Lives - using British Sign Language',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/9z6gPkUm5H0/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLAtNOeY1o4-Sjh_hlV3ub1dfjd4Og',
      'https://youtu.be/9z6gPkUm5H0?si=gmRvHZlX4gdbehvD'),
  BSLModel(
      'Learn how to sign: Handwave for key workers - using British Sign Language',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/5MChLxhpxF0/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLA19IjlkKA_RekysaG8fMJeXR2W4A',
      'https://youtu.be/5MChLxhpxF0?si=H9cwYauqBXQqIpYd'),
  BSLModel(
      'Learn how to sign: Finger spelling names - using British Sign Language',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/7FJloivZYJM/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLBuHM7DaUIQUTWfekMWbP-3PMDmlg',
      'https://youtu.be/7FJloivZYJM?si=l6SF-M8HVtIdbRpC'),
  BSLModel(
      'Learn how to sign: Basic Greetings - using British Sign Language',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/PPIJNrboJGs/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLC7bEdy53_P6jHoKlDzynSlb-0LFw',
      'https://youtu.be/PPIJNrboJGs?si=cCadjT4vHQgc6Liy'),
  BSLModel(
      'BSL video for survey introduction',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/1TY9j5yT8tw/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCAKBZJ_qJC4DqfZPXs_V-aVvGzCg',
      'https://youtu.be/1TY9j5yT8tw?si=QwgI7fdA2p0BKsYb'),
  BSLModel(
      'Sign Solutions, BSL Video Interpreting, Q and A session',
      'British Sign Language',
      'BSL',
      'https://i.ytimg.com/vi/2VSscj0XUos/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDcK0wp8ohzmD48Po-eX6niLl0icw',
      'https://youtu.be/2VSscj0XUos?si=uT8QOsfW8WMv7hZK'),
];

class BritishView extends StatefulWidget {
  @override
  State<BritishView> createState() => _BritishViewState();
}

class _BritishViewState extends State<BritishView> {
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
                                  text: bslMode[index].videoName,
                                  imageURL: bslMode[index].image),
                              onTap: () {
                              }
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
                      itemCount: bslMode.length,
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
