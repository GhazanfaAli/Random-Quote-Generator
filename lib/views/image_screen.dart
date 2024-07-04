import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  final List<String> images = [
    'https://images2.alphacoders.com/683/683089.jpg',
    'https://images.pexels.com/photos/6845709/pexels-photo-6845709.jpeg?auto=compress&cs=tinysrgb&w=600'
    'https://marketplace.canva.com/EAEoWjiyv84/1/0/1600w/canva-simple-motivational-quotes-and-landscapes-desktop-wallpaper-T0aGxz-mosA.jpg',
    'https://e1.pxfuel.com/desktop-wallpaper/941/982/desktop-wallpaper-focus-quotes-achieve.jpg',
    'https://images.pexels.com/photos/3806690/pexels-photo-3806690.jpeg?auto=compress&cs=tinysrgb&w=600'
    'https://c4.wallpaperflare.com/wallpaper/559/457/188/inspirational-motivational-quote-quotes-wallpaper-preview.jpg',
    'https://wallpaper-mania.com/wp-content/uploads/2018/09/High_resolution_wallpaper_background_ID_77701085287.jpg',
    'https://i.pinimg.com/originals/44/a4/da/44a4da3cfaad1469d3a821d2202cdd16.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Images'),
      
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Stack(
                children: [
                  Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Image ${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
