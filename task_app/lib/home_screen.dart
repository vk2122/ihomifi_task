import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color = Colors.black;
  stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  void _startListening() async {
    PermissionStatus status = await Permission.microphone.request();
    if (status == PermissionStatus.granted) {
      bool available = await _speechToText.initialize();
      if (available) {
        setState(() {
          _isListening = true;
        });
        _speechToText.listen(
          onResult: (result) {
            setState(() {
              _text = result.recognizedWords;
            });
          },
        );
      }
    } else {
      print('Microphone permission denied');
    }
  }

  void _stopListening() {
    _speechToText.stop();
    setState(() {
      _isListening = false;
      _text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double textSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alexa Skill - Switch',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: textSize * 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: 300,
          width: 330,
          padding: EdgeInsets.all(10),
          child: Text(
            _text,
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: textSize * 16,
            ),
            maxLines: 15,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isListening) {
            _stopListening();
          } else {
            _startListening();
          }
          print(_isListening);
        },
        child: Icon(
          _isListening
              ? Icons.record_voice_over_sharp
              : Icons.voice_over_off_sharp,
          size: textSize * 22,
        ),
      ),
    );
  }
}
