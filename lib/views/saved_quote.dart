import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:random_quote_gen/views/comonents/utils.dart';

class SavedQuote extends StatefulWidget {
  const SavedQuote({super.key});

  @override
  State<SavedQuote> createState() => _SavedQuoteState();
}

class _SavedQuoteState extends State<SavedQuote> {
  final editQuoteText = TextEditingController();
  final userStream = FirebaseFirestore.instance.collection('user').snapshots();
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('user');

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Set the status bar to black to match the gradient
      statusBarIconBrightness: Brightness.light, // Light icons for dark background
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
            
              TyperAnimatedText('Your saved_'),
              TyperAnimatedText('quotes are here_'),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
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
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: userStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Some Error Occurred');
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final id = snapshot.data!.docs[index].id.toString();
                        final quoteText = snapshot.data!.docs[index]['quote_text'].toString();
                        return Card(
                          color: Colors.black.withOpacity(0.3),
                          elevation: 5,
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Text(
                              snapshot.data!.docs[index]['author_name'].toString(),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                            ),
                            subtitle: Text(
                              snapshot.data!.docs[index]['quote_text'].toString(),
                              style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 194, 190, 190)),
                            ),
                            trailing: PopupMenuButton(
                              icon: Icon(Icons.more_horiz, color: Colors.white,),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 1,
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showMyDialog(quoteText, id);
                                    },
                                    leading: Icon(Icons.edit),
                                    title: Text("Edit"),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 2,
                                  child: ListTile(
                                    onTap: () {
                                      collectionReference.doc(id.toString()).delete();
                                      Navigator.pop(context);
                                    },
                                    leading: Icon(Icons.delete_outline),
                                    title: Text("Delete"),
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
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> showMyDialog(String text, String id) async {
    editQuoteText.text = text.toString();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Update'),
          content: Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              maxLines: 5,
              controller: editQuoteText,
              decoration: InputDecoration(
                hintText: 'Edit here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                collectionReference.doc(id.toString()).update({
                  'quote_text': editQuoteText.text.toString(),
                }).then((onValue) {
                  Utils.toastMessage('Updated successfully');
                }).onError((error, StackTrace) {
                  Utils.toastMessage(error.toString());
                });
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
