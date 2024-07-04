import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_quote_gen/views/comonents/round_button.dart';
import 'package:random_quote_gen/views/comonents/utils.dart';

class UploadQuoteScreen extends StatefulWidget {
  const UploadQuoteScreen({super.key});

  @override
  State<UploadQuoteScreen> createState() => _UploadQuoteScreenState();
}

class _UploadQuoteScreenState extends State<UploadQuoteScreen> {
  final authorController = TextEditingController();
  final quoteController = TextEditingController();
  bool loading = false;
  final firebaseStore = FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 23,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            repeatForever: true,        
            isRepeatingAnimation: true,
        
            animatedTexts: [
              WavyAnimatedText('Generate your '),
              TyperAnimatedText('quote here.'),
              // TyperAnimatedText('quotes are here_'),
            ],
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 6, 130, 231),
                Color.fromARGB(255, 7, 56, 219),
                Color.fromARGB(255, 6, 56, 165),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.5, 1.0],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: authorController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Author Name',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                   focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                maxLength: 100,
                maxLines: 3,
                controller: quoteController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Write Your Quote Here',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: RoundButton(
                title: 'Click to Generate quote',
                loading: loading,
                ontap: () {
                  setState(() {
                    loading = true;
                  });
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  firebaseStore.doc(id).set({
                    'author_name': authorController.text.toString(),
                    'quote_text': quoteController.text.toString(),
                    'id': id,
                  }).then((onValue) {
                    setState(() {
                      loading = false;
                    });
                    Utils.toastMessage('Post added');

                    

                  }).onError((error, StackTrace stackTrace) {
                    setState(() {
                      loading = false;
                    });
                    Utils.toastMessage(error.toString());
                  });
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 6, 56, 165),
    );
  }
}
