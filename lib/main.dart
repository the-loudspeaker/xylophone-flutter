import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatefulWidget {

  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  void playSound(int n)async{
    await player.setAsset('assets/note$n.wav');
    player.play();
  }

  Expanded buildkey({Color color=Colors.purple, int number=3}){
    return Expanded(
      child: FlatButton(child: Text(''),color: color, onPressed: (){playSound(number);},),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
              child: Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildkey(color: Colors.red, number: 1),
                    buildkey(color: Colors.orange,number: 2),
                    buildkey(color: Colors.yellow, number: 3),
                    buildkey(color: Colors.green, number: 4),
                    buildkey(color: Colors.blue, number: 5),
                    buildkey(color: Colors.indigo, number: 6),
                    buildkey(color: Colors.purple, number: 7),
                  ],
                ),
              ),
      ),
    );
  }
}
