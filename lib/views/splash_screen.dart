import 'dart:async'; // Correct import for Timer
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:random_quote_gen/views/menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MenuScreen()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          // Container(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                  child: Lottie.network('https://lottie.host/3a55466a-284c-4e90-a04c-f12e51f57173/ObzLbWtZxH.json')
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // DefaultTextStyle(
              //   style: TextStyle(
              //       fontSize: 23,
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold
              //   ),
              //   child: AnimatedTextKit(
              //     repeatForever: true,

              //     animatedTexts: [
              //       TypewriterAnimatedText('Loading...',),
              //     ],
              //   ),

              // ),
            ],
          )
          // Container(height: 10,),

        ],
      ),
    );
  }
}
