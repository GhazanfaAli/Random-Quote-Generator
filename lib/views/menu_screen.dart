import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:random_quote_gen/views/generate_quote_screen.dart';
import 'package:random_quote_gen/views/home_screen.dart';
import 'package:random_quote_gen/views/image_screen.dart';
import 'package:random_quote_gen/views/saved_quote.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isTapped = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      isTapped = true;
    });
  }

  void _onTapCancel() {
    setState(() {
      isTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).size.height * 0.2;
    var width = MediaQuery.of(context).size.width * 0.4;
    var shading = Colors.grey.shade400;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
 
        body: Container(
          height: screenHeight,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                    
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20)),
                      ),
                      child: const ClipRRect(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20)),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/new.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 310,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            DefaultTextStyle(
          style: const TextStyle(
            fontSize: 23,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            repeatForever: true,        
            isRepeatingAnimation: true,
        
            animatedTexts: [
            
              TyperAnimatedText('Choose below_'),
              TyperAnimatedText('options to generate_'),
              TyperAnimatedText('random quote_'),
              TyperAnimatedText('and perform crud_'),

            ],
          ),
        ),
                              const SizedBox(height: 20),

                            Row(
                              children: [
                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                         Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
                                      },
                                      child: Container(
                                        width: width,
                                        height: height,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(13)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: shading,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(0, 5),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 25,
                                      left: 5,
                                      right: 5,
                                      bottom: 0,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            child: InkWell(
                                              onTap: () {
                                                 Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
                                              },
                                              child: const Image(
                                                
                                                image: AssetImage('assets/generate.png')
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 17),
                                          const Text(
                                            'Generate a Quote',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 30,),
                                    Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                         Navigator.push(context,MaterialPageRoute(builder: (context) => UploadQuoteScreen()));
                                      },
                                      child: Container(
                                        width: width,
                                        height: height,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(13)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: shading,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(0, 5),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 25,
                                      left: 5,
                                      right: 5,
                                      bottom: 0,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            child: InkWell(
                                              onTap: () {
                                         Navigator.push(context,MaterialPageRoute(builder: (context) => UploadQuoteScreen()));
                                              },
                                              child: Icon(Icons.create_outlined, color: Colors.blue, size: 40,),
                                            ),
                                          ),
                                          const SizedBox(height: 17),
                                          const Text(
                                            'New quote',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                             
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                           Navigator.push(context,MaterialPageRoute(builder: (context) => SavedQuote()));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(13)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: shading,
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(0, 5),
                                              )
                                            ],
                                          ),
                                          width: width,
                                          height: height,
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        left: 5,
                                        right: 5,
                                        bottom: 0,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              child: InkWell(
                                                onTap: () {
                                                   Navigator.push(context,MaterialPageRoute(builder: (context) => SavedQuote()));
                                                },
                                                child: const Image(
                                                  image: AssetImage('assets/save.png'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 17),
                                            const Text(
                                              'Saved quote',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                           Navigator.push(context,MaterialPageRoute(builder: (context) => ImageScreen()));
                                        },
                                        child: Container(
                                          width: width,
                                          height: height,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(13)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: shading,
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(0, 5),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 25,
                                        left: 5,
                                        right: 5,
                                        bottom: 0,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              child: InkWell(
                                                onTap: () {
                                                   Navigator.push(context,MaterialPageRoute(builder: (context) => ImageScreen()));
                                                },
                                                child: Icon(Icons.image_outlined, color: Colors.blue, size: 40,),
                                              ),
                                            ),
                                            const SizedBox(height: 17),
                                            const Text(
                                              'Images',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
