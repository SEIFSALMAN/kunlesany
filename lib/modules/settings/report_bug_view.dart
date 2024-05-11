import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/components/toast_messages.dart';

class ReportBugView extends StatefulWidget {
  const ReportBugView({super.key});

  @override
  State<ReportBugView> createState() => _ReportBugViewState();
}

class _ReportBugViewState extends State<ReportBugView> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        title: Text(
          AppLocalizations.of(context)!.reportBug,
          style: TextStyle(fontFamily: 'PlaypenSans', fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              showToast(
                  message: AppLocalizations.of(context)!.bugSuccess,
                  state: ToastStates.SUCCESS,
                  duartion: 5);
            },
            child: Text(
              AppLocalizations.of(context)!.send,
              style: TextStyle(
                  color: Colors.blue, fontSize: 16, fontFamily: 'PlaypenSans'),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TextFormField(
              expands: true,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
                hintText: AppLocalizations.of(context)!.bugText,
                hintStyle: TextStyle(fontSize: 14, fontFamily: 'PlaypenSans'),
                hintMaxLines: 2,
              ),
            ),
          ),
          SizedBox(
            height: selectedImages.isEmpty ? 0 : 120,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: selectedImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                      Image.file(File(selectedImages[index].path), fit: BoxFit.cover),
                          SizedBox( //<-- SEE HERE
                            width: 25,
                            height: 25,
                            child: FittedBox( //<-- SEE HERE
                              child: FloatingActionButton( //<-- SEE HERE
                                backgroundColor: Colors.blue,
                                onPressed: () {
                                 setState(() {
                                   selectedImages.removeAt(index++);
                                   print(selectedImages.length);
                                 });
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                    ]),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: () {
                  selectMultipleImages();
                },
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.upload,
                    style: TextStyle(fontSize: 16, fontFamily: 'PlaypenSans',color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }

  Future pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }

  List<XFile> selectedImages = [];

  void selectMultipleImages() async {
    final List<XFile>? selectedImage = await ImagePicker().pickMultiImage();
    if (selectedImage!.isNotEmpty) {
      setState(() {
        selectedImages.addAll(selectedImage);
        print(selectedImages.length);
      });
    }
  }
}
