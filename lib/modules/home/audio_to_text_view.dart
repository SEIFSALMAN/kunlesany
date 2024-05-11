import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


const languages = [

  Language('English', 'en'),
  Language('Arabic', 'ar'),

];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}


class AudioToTextView extends StatefulWidget {

  @override
  State<AudioToTextView> createState() => _AudioToTextViewState();
}

class _AudioToTextViewState extends State<AudioToTextView> {

  /// hhh


  late SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool  _isListening = false;
  String transcription = '';
  String _currentLocale = 'en';
  Language selectedLang = languages.first;

  @override
  initState() {
    super.initState();
    activateSpeechRecognizer();
  }


  void activateSpeechRecognizer() {
    print('Speech.activateSpeechRecognizer... ');
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate(_currentLocale).then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }
  var speechText = "Hold the button and start speaking.";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.sort_rounded,color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.atsText,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
        actions: [
          PopupMenuButton<Language>(
            icon: Icon(Icons.language,color: Colors.white,),
            onSelected: _onLanguageSelected,
            itemBuilder: (BuildContext context) {
              return _buildLanguagesWidgets;
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
              margin: EdgeInsets.only(bottom: 10),
              child: Text(speechText,style: TextStyle(fontSize: 16,color: Theme.of(context).iconTheme.color,fontWeight: FontWeight.w200)),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        repeat: true,
        glowRadiusFactor: 2,
        startDelay: Duration(milliseconds: 100),
        duration: Duration(milliseconds: 2000),
        glowColor: Colors.blue,
        child: GestureDetector(
          onTapDown: (details) async {
            if(_speechRecognitionAvailable && !_isListening)
            {
              start();
            }
          },
          onTapUp: (details) {
            stop();
          },
          child: CircleAvatar(
            backgroundColor: Colors.blue[400],
            radius: 40,
            child: Icon(_isListening ? Icons.mic : Icons.mic_none,color: Colors.white,size: 40),
          ),
        ),
      ),
    );
  }


  /// All Functionalities


  void start() => _speech.activate(selectedLang.code).then((_) {
    return _speech.listen().then((result) {
      print('Speech.start => result $result');
      setState(() {
        _isListening = result;
      });
    });
  });

  // void cancel() =>
  //     _speech.cancel().then((_) => setState(() => _isListening = false));

  void stop() => _speech.stop().then((_) {
    setState(() => _isListening = false);
  });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    print('Speech.onCurrentLocale... $locale');
    setState(() => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() {
    // Utils().toastMessage('Listening....',Colors.green);
    setState(() => _isListening = true);
  }

  void onRecognitionResult(String text) {
    print('Speech.onRecognitionResult... $text');
    setState(() => speechText = text);
  }

  void onRecognitionComplete(String text) {
    // Utils().toastMessage('Completed....',Colors.green);
    print('Speech.onRecognitionComplete... $text');
    setState(() => _isListening = false);
  }


  List<CheckedPopupMenuItem<Language>> get _buildLanguagesWidgets => languages
      .map((l) => CheckedPopupMenuItem<Language>(
    value: l,
    checked: selectedLang == l,
    child: Text(l.name),
  ))
      .toList();

  void _selectLangHandler(Language lang) {
    setState(() => selectedLang = lang);
  }

  void errorHandler() => activateSpeechRecognizer();

  void _onLanguageSelected(Language lang) {
    setState(() {
      selectedLang = lang;
      // You can also update the speech recognizer language here
      _speech.activate(selectedLang.code);
    });
  }


}
