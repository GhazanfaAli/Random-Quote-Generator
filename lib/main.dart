import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_quote_gen/provider/random_text_provider.dart';
import 'package:random_quote_gen/view_models/view_model.dart';
import 'package:random_quote_gen/views/splash_screen.dart';
//import 'firebase_options.dart'; // Ensure this import is correct

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: 'AIzaSyBqPYtzHb6om4fBKZJqM71yCB1mwyizB_I',
    appId: '1:770061416735:android:29fc8395fdcafc9ff2182a',
    messagingSenderId: '770061416735',
    projectId: 'random-quote-gen-3814b',
    storageBucket: 'random-quote-gen-3814b.appspot.com',
  )
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RandomTextProvider()),
        ChangeNotifierProvider(create: (_) => QuoteViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // Customize only what you need
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
