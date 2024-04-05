import 'package:flutter/material.dart';
import 'package:sozluk/screens/english/search_english.dart';
import 'package:sozluk/screens/turkmen/search_turkmen.dart';
import 'package:sozluk/screens/turkmen/turkmen.dart';
import '../../models/class_words.dart';

class EnglishClass extends StatefulWidget {
  const EnglishClass({Key? key}) : super(key: key);

  @override
  State<EnglishClass> createState() => _EnglishClassState();
}

final controller = TextEditingController();
List<Words> words = allWords;

class _EnglishClassState extends State<EnglishClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.9,
        backgroundColor: Color(0xFFe2eaf2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            Image.asset(
              'assets/images/menu.png',
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 60, 40, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    side: BorderSide(color: Colors.blue.shade500, width: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const TurkmenClass()),
                  );
                },
                child: Text('For Turkmen language'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    side: BorderSide(color: Colors.blue.shade500, width: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) => const EnglishClass()),
                  // );
                },
                child: Text('Liked words',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontFamily: 'Regular')),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    side: BorderSide(color: Colors.blue.shade500, width: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) => const EnglishClass()),
                  // );
                },
                child: Text(
                  'About Programm',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontFamily: 'Regular'),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        title: Center(
            child: Text('English language',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.026,
                    fontFamily: 'Regular'))),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => SearchEnglish()));
              },
              icon: Icon(Icons.search_outlined)),
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return Container(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue.shade300, width: 1.5),
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.grey.shade100,
                  minimumSize: Size(double.infinity, 50)),
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(
                        child: Text("Translated",
                            style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                                fontFamily: 'Regular')),
                      ),
                      content: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('English : ',
                                    style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                        fontFamily: 'Regular')),
                                Text(
                                    word.english[0].toUpperCase() +
                                        word.english.substring(1),
                                    style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                        fontFamily: 'Regular')),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Turkmen : ',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.02,
                                      fontFamily: 'Regular'),
                                ),
                                Text(
                                  word.turkmen[0].toUpperCase() +
                                      word.turkmen.substring(1),
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.height *
                                          0.02,
                                      fontFamily: 'Regular'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    backgroundColor: Colors.blue.shade100,
                                    minimumSize: const Size(50, 45),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
                                  )),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue.shade400,
                                    minimumSize: const Size(150, 45),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Regular'),
                                  )),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              child: Text(
                word.english[0].toUpperCase() + word.english.substring(1),
                style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 16,
                    fontFamily: 'Regular'),
              ),
            ),
          );

          // child: Container(
          //   margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          //   decoration: BoxDecoration(
          //       border: Border.fromBorderSide(
          //           BorderSide(color: Colors.blue.shade300, width: 1)),
          //       borderRadius: BorderRadius.circular(20)),
          //   height: 55,
          //   child: Center(
          //     child: Text(
          //       word.turkmen[0].toUpperCase() +
          //           word.turkmen.substring(1),
          //       style: TextStyle(fontSize: 16, fontFamily: 'Regular'),
          //     ),
          //   ),
          // ),
        },
      ),
    );
  }
}
