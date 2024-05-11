// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../shared/components/navigator.dart';
// import '../bookmarks_view.dart';
// import '../single_video_education_view.dart';
//
// class ArabicModel {
//   final String videoName;
//   final String languageTypeName;
//   final String abbreviation;
//   final String image;
//   final String url;
//
//   ArabicModel(this.videoName, this.languageTypeName, this.abbreviation, this.image,
//       this.url);
// }
//
// List<ArabicModel> arabicModel = [
//   ArabicModel(
//       'الحروف الابجدية بلغة الاشاره العربيه | The letters in Arabic Sign Language',
//       'Arabic Sign Language',
//       '',
//       'https://i.ytimg.com/vi/AJeEBx3sbEc/hqdefault.jpg?sqp=-oaymwE1CKgBEF5IVfKriqkDKAgBFQAAiEIYAXABwAEG8AEB-AH-CYAC0AWKAgwIABABGGUgWChBMA8=&rs=AOn4CLB_FpExm4mpOuZvZ--aj4-QfHCiOg',
//       'https://youtu.be/AJeEBx3sbEc?si=uG5D-QjIZxhI_pOb'),
//   ArabicModel(
//       'الاحساس بلغة الاشاره العربيه | The feeling is in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/pngr7NcWyOw/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCQdN4nsSYTNIccGgElIyO9zEzLAQ',
//       'https://youtu.be/pngr7NcWyOw?si=0SvXhPjHdnmxs7rt'),
//   ArabicModel(
//       'الاعداد بلغه الاشاره العربيه | The numbers are in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/k8DXozUtsDI/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLAgI_rLzZpzFi4LZ-t_QtgVuCE7dw',
//       'https://youtu.be/k8DXozUtsDI?si=mtgygUuHl23xARAj'),
//   ArabicModel(
//       'الالوان بلغه الاشاره العربيه | The colors are in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/IaJRTJbOpyM/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCLOCdZsoOYjiCWzNQa2cf4ghkOHw',
//       'https://youtu.be/IaJRTJbOpyM?si=nkmpPQ8splU1r6uB'),
//   ArabicModel(
//       'الصلاه بلغه الاشاره العربيه | Prayer in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/eCY8bHakcAs/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCo8lpM_iflkg7kGDe-93RPZqiN1w',
//       'https://youtu.be/eCY8bHakcAs?si=L-6AwVRTo8YVoW25'),
//   ArabicModel(
//       'المستشفى بلغه الاشاره العربيه | The hospital is in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/bFJxp3zvN0E/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCCMjRGgEl37FITfDKMGkWBD1xhfA',
//       'https://youtu.be/bFJxp3zvN0E?si=5-TGjzm-DW9E1bbn'),
//   ArabicModel(
//       'الوجبات السريعه بلغه الاشاره العربيه | Fast food in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/tRR0-2hD53E/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLAAlh1wxw3ZJxVPOoQOvMzJ2Vu0xA',
//       'https://youtu.be/tRR0-2hD53E?si=WBt8lO6Oorch40bx'),
//   ArabicModel(
//       'العملات بلغه الاشاره العربيه | Currencies in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/adW4lsYm1hc/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLBWKndOoC2IR6IeaBEY2skBSNioOA',
//       'https://youtu.be/adW4lsYm1hc?si=ndexQ6GBSeuGQJ51'),
//   ArabicModel(
//       'العائله بلغه الاشاره العربيه | The family in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/g84TS0NXuIo/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDQvStD758_UgqD38eLbWKEiyRsTg',
//       'https://youtu.be/g84TS0NXuIo?si=nFAU3Go60P6pXWCW'),
//   ArabicModel(
//       'المنزل بلغه الاشاره العربيه | The house is in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/L7lXHvKuKds/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCH1CDASJfdpfX07BJNxTpR_7aVdw',
//       'https://youtu.be/L7lXHvKuKds?si=FKKY8hB3zoyaYI5-'),
//   ArabicModel(
//       'الاطعمه بلغه الاشاره العربيه | The foods are in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/vNYlOCJQZbo/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLB7dzgxqePBRwQi7SlJrWI4QgEV0A',
//       'https://youtu.be/vNYlOCJQZbo?si=oMIzzWIolca5nH0g'),
//   ArabicModel(
//       'عرف بنفسك بلغه الاشاره العربيه | Introduce yourself in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/JtVf-jaf4ko/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLA_WrdxNgHOLPFLa7suKPSzYOGqsA',
//       'https://youtu.be/JtVf-jaf4ko?si=MrPe_BseMnvZX8zv'),
//   ArabicModel(
//       'ايام الاسبوع بلغه الاشاره العربيه | A week in Arabia Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/fZHh6eFF8Lg/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLC7-SBUccsCBxRR7OwHMHX38VV1GA',
//       'https://youtu.be/fZHh6eFF8Lg?si=7u3pGMv4PCGH61fI'),
//   ArabicModel(
//       'شوارع المدينه | City Streets',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/YtAGzLPEfxI/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCAMLjAc3C_xt8B1iqtHpcNCO8YAA',
//       'https://youtu.be/YtAGzLPEfxI?si=b_gdxoEWHuzVwvMe'),
//   ArabicModel(
//       'وسائل النقل الاساسيه بلغه الاشاره العربيه | Basic means of transportation in Arabic Sign Language',
//       'Arabic Sign Language',
//       'ASL',
//       'https://i.ytimg.com/vi/w8iPe1wisns/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLCQ0qG_A0TzUM3Ih-i2nuYVlIaNtQ',
//       'https://youtu.be/w8iPe1wisns?si=QPLSucYFNTpMDbpo'),
// ];
//
// class ArabicView extends StatefulWidget {
//   @override
//   State<ArabicView> createState() => _ArabicViewState();
// }
//
// class _ArabicViewState extends State<ArabicView> {
//   bool bookmarked = false;
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Padding(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
//               child: Column(
//                 children: [
//                   // Padding(
//                   //   padding: const EdgeInsets.all(14.0),
//                   //   child: CupertinoSearchTextField(
//                   //     controller: searchController,
//                   //     onChanged: (value) {},
//                   //     onSubmitted: (value) {},
//                   //     autocorrect: true,
//                   //   ),
//                   // ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             InkWell(
//                               child: buildSingleVideoRow(
//                                   context: context,
//
//                                   text: arabicModel[index].videoName,
//                                   imageURL: arabicModel[index].image),
//                               onTap: () {} ),
//                             SizedBox(
//                               height: 2,
//                             ),
//                             Divider(
//                               thickness: 1,
//                             )
//                           ],
//                         );
//                       },
//                       itemCount: arabicModel.length,
//                     ),
//                   ),
//                 ],
//               ))),
//     );
//   }
//
//   Widget buildSingleVideoRow({
//     required BuildContext context,
//     required String text,
//     required String imageURL,
//   }) =>
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 110,
//             height: 75,
//             decoration: BoxDecoration(
//                 image: DecorationImage(image: NetworkImage(imageURL)),
//                 borderRadius: BorderRadius.circular(10)),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Expanded(
//               child: Text(
//                 text,
//                 style: TextStyle(fontSize: 13),
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//               )),
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0, top: 15),
//             child: IconButton(
//               onPressed: () {
//                 setState(() {
//                   bookmarked = !bookmarked;
//                 });
//               },
//               icon: Icon(
//                 (bookmarked == false)
//                     ? Icons.bookmark_add_outlined
//                     : Icons.bookmark,
//                 size: 25,
//               ),
//             ),
//           )
//         ],
//       );
// }
