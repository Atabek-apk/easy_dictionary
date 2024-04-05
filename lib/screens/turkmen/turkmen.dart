import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sozluk/provider/like_words.dart';
import 'package:sozluk/screens/english/english.dart';
import 'package:sozluk/screens/favori/favori.dart';
import 'package:sozluk/screens/turkmen/search_turkmen.dart';
import '../../models/class_words.dart';
import '../../models/language_model.dart';
import '../../provider/snakbar_every_time.dart';

class TurkmenClass extends StatefulWidget {
  const TurkmenClass({Key? key}) : super(key: key);

  @override
  State<TurkmenClass> createState() => _TurkmenClassState();
}

final controller = TextEditingController();
List<Words> words = allWords;

class _TurkmenClassState extends State<TurkmenClass> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LikeWords>(context);
    final ChangeLanguage lang;
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.9,
        backgroundColor: Color(0xFFe2ead8),
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
                        builder: (context) => const EnglishClass()),
                  );
                },
                child: Text('Iňlis dili üçin'),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const FavoriPage()),
                  );
                },
                child: Text('Halanan sözlerim',
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
                  'Programma barada',
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
        backgroundColor: Colors.blue.shade400,shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
        title: Center(
            child: Text('Türkmen dili',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.026,
                    fontFamily: 'Regular'))),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => SearchTurkmen()));
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
                        child: Text("Terjimesi",
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
                                Text('Turkmen : ',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        fontFamily: 'Regular')),
                                Text(
                                    word.turkmen[0].toUpperCase() +
                                        word.turkmen.substring(1),
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
                                  'English : ',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      fontFamily: 'Regular'),
                                ),
                                Text(
                                  word.english[0].toUpperCase() +
                                      word.english.substring(1),
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
                                  onPressed: () {
                                    provider.pressButton(word.turkmen);
                                    provider.isExist(word.turkmen)
                                        ? ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                elevation: 0,
                                                duration: Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    Colors.transparent,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: SnakBarEveryTime(
                                                    titleee:
                                                        "${word.turkmen} halanlaryma goşuldy")))
                                        : ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                elevation: 0,
                                                duration: Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    Colors.transparent,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: SnakBarEveryTime(
                                                    titleee:
                                                        "${word.turkmen} halanlarymdan aýryldy")));
                                  },
                                  child: provider.isExist(word.turkmen)
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red.shade600,
                                        )
                                      : Icon(Icons.favorite_border,
                                    color: Colors.red.shade600,)),
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
                word.turkmen[0].toUpperCase() + word.turkmen.substring(1),
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

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:sozluk/screens/english.dart';
//
// class TurkmenClass extends StatefulWidget {
//   const TurkmenClass({Key? key}) : super(key: key);
//
//   @override
//   State<TurkmenClass> createState() => _TurkmenClassState();
// }
//
// class _TurkmenClassState extends State<TurkmenClass> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         width: MediaQuery.of(context).size.width * 0.9,
//         backgroundColor: Color(0xFFe2eaf2),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: MediaQuery.of(context).size.height * 0.13,),
//             Image.asset(
//               'assets/splash/es.png', fit: BoxFit.contain,
//               height: MediaQuery.of(context).size.height * 0.3,
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(40, 60, 40, 0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue.shade300,
//                   side: BorderSide(color: Colors.blue.shade500, width: 1),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                   ),
//                   minimumSize: Size(double.infinity, 50)
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                         builder: (context) => const EnglishClass()),
//                   );
//                 },
//                 child: Text('Iňlis dili üçin'),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue.shade300,
//                   side: BorderSide(color: Colors.blue.shade500, width: 1),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                   ),
//                   minimumSize: Size(double.infinity, 50)
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                         builder: (context) => const EnglishClass()),
//                   );
//                 },
//                 child: Text('Halanan sözler', style: TextStyle(fontSize: MediaQuery.of(context).size.height *0.02, fontFamily: 'Regular')),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue.shade300,
//                   side: BorderSide(color: Colors.blue.shade500, width: 1),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)
//                   ),
//                   minimumSize: Size(double.infinity, 50)
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                         builder: (context) => const EnglishClass()),
//                   );
//                 },
//                 child: Text('Programma barada', style: TextStyle(fontSize: MediaQuery.of(context).size.height *0.02, fontFamily: 'Regular'),),
//               ),
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         title: Center(
//             child: Text(
//           'Türkmen dili',
//           style:
//               TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
//         )),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               setState(() {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => SearchWords()));
//               });
//             },
//           )
//         ],
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: DefaultAssetBundle.of(context)
//               .loadString('assets/english_turkmen.json'),
//           builder: (context, snapshot) {
//             var mydata = const JsonCodec().decode(snapshot.data.toString());
//             return ListView.builder(
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   padding: const EdgeInsets.fromLTRB(35, 6, 35, 0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       showDialog<String>(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: const Center(child: Text("Terjimesi")),
//                               content: Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.08,
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         const Text('Turkmen : '),
//                                         Text(mydata[index]['turkmen'][0]
//                                                 .toString()
//                                                 .toUpperCase() +
//                                             mydata[index]['turkmen']
//                                                 .toString()
//                                                 .substring(1)),
//                                       ],
//                                     ),
//                                     SizedBox(height: 5),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         const Text('English : '),
//                                         Text(mydata[index]['english'][0]
//                                                 .toString()
//                                                 .toUpperCase() +
//                                             mydata[index]['english']
//                                                 .toString()
//                                                 .substring(1)),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               actions: [
//                                 Center(
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             minimumSize: const Size(50, 45),
//                                             shape: const RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.all(
//                                                 Radius.circular(20),
//                                               ),
//                                             ),
//                                           ),
//                                           onPressed: () =>
//                                               Navigator.pop(context, 'OK'),
//                                           child: const Icon(
//                                               Icons.favorite_border_outlined)),
//                                       ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             minimumSize: const Size(150, 45),
//                                             shape: const RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.all(
//                                                 Radius.circular(20),
//                                               ),
//                                             ),
//                                           ),
//                                           onPressed: () =>
//                                               Navigator.pop(context, 'OK'),
//                                           child: Text('OK')),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             );
//                           });
//                     },
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         minimumSize: const Size(350, 55)),
//                     child: Text(
//                       mydata[index]['turkmen'][0].toString().toUpperCase() +
//                           mydata[index]['turkmen'].toString().substring(1),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.normal),
//                     ),
//                   ),
//                 );
//               },
//               itemCount: mydata == null ? 0 : mydata.length,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
