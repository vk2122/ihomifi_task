import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  bool _switchState = false;
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    double textSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Switch Skill',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: textSize * 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(height: 250, width: 250, color: _color),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _switchState = !_switchState;
            _color = _switchState ? Colors.amber : Colors.black;
          });
        },
        child: Icon(
          Icons.record_voice_over_sharp,
        ),
      ),
    );
  }
}
