// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Contacts Demo',
//       debugShowCheckedModeBanner: false,
//       home: StorageUpload(),
//     );
//   }
// }
//
// class StorageUpload extends StatefulWidget {
//   @override
//   StorageUploadState createState() => new StorageUploadState();
// }
//
// class StorageUploadState extends State<StorageUpload> {
//   List results = [];
//
//   var rows = [];
//   String query = '';
//   TextEditingController tc = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     tc = TextEditingController();
//     rows = [
//       {
//         'contact_name': 'Test User 1',
//         'contact_phone': '066 560 4900',
//       },
//       {
//         'contact_name': 'Test User 2',
//         'contact_phone': '066 560 7865',
//       },
//       {
//         'contact_name': 'Test User 3',
//         'contact_phone': '906 500 4334',
//       }
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(
//           "Delivero Contacts",
//           style: new TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         padding: EdgeInsets.all(10),
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextField(
//                     controller: tc,
//                     decoration: InputDecoration(hintText: 'Search...'),
//                     onChanged: (v) {
//                       setState(() {
//                         query = v;
//                         setResults(query);
//                       });
//                     },
//                   ),
//                 ),
//                 Container(
//                   color: Colors.white,
//                   child: query.isEmpty
//                       ? ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: rows.length,
//                     itemBuilder: (con, ind) {
//                       return ListTile(
//                         title: Text(rows[ind]['contact_name']),
//                         subtitle: Text(rows[ind]['contact_phone']),
//
//                       );
//                     },
//                   )
//                       : ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: results.length,
//                     itemBuilder: (con, ind) {
//                       return ListTile(
//                         title: Text(results[ind]['contact_name']),
//                         subtitle: Text(results[ind]['contact_phone']),
//
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void setResults(String query) {
//     results = rows
//         .where((elem) =>
//     elem['contact_name']
//         .toString()
//         .toLowerCase()
//         .contains(query.toLowerCase()) ||
//         elem['contact_phone']
//             .toString()
//             .toLowerCase()
//             .contains(query.toLowerCase()))
//         .toList();
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:sozluk/firebase_api.dart';
import 'package:sozluk/provider/like_words.dart';
import 'package:sozluk/screens/turkmen/turkmen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseApi().initNotifcation();
  FlutterNativeSplash.remove();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LikeWords()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TurkmenClass(),
      ),
    );
  }
}







// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart' show rootBundle;
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.teal,
// //       ),
// //       home: SelectionScreen(),
// //     );
// //   }
// // }
// //
// // class SelectionScreen extends StatefulWidget {
// //   @override
// //   State<StatefulWidget> createState() {
// //     // TODO: implement createState
// //     return _selectionScreen();
// //   }
// // }
// //
// // class _selectionScreen extends State<SelectionScreen> {
// //   List fullData = [];
// //   List searchData = [];
// //   TextEditingController textEditingController = TextEditingController();
// //
// //   @override
// //   initState() {
// //     super.initState();
// //     getLocalJsonData();
// //   }
// //
// //   getLocalJson() {
// //     return rootBundle.loadString('assets/english_turkmen.json');   // Read your local Data
// //   }
// //
// //   Future getLocalJsonData() async {
// //     final responce = json.decode(await getLocalJson());
// //     List tempList = [];
// //     for (var i in responce['turkmen']) {
// //       tempList.add(i);   // Create a list and add data one by one
// //     }
// //     fullData = tempList;
// //   }
// //
// //   onSearchTextChanged(String text) async {
// //     searchData.clear();
// //     if (text.isEmpty) {    // Check textfield is empty or not
// //       setState(() {});
// //       return;
// //     }
// //
// //     for (var data in fullData) {
// //       if (data['turkmen']
// //       .toString()
// //           .toLowerCase()
// //           .contains(text.toLowerCase().toString())) {
// //         searchData.add(data);   // If not empty then add search data into search data list
// //       }
// //     }
// //
// //     setState(() {});
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: InkWell(
// //           child: Center(child: Text("Local Data"))
// //         ),
// //       ),
// //       body: Container(
// //           child: Column(
// //             children: [
// //               TextField(
// //                 controller: textEditingController,
// //                 onChanged: onSearchTextChanged,
// //               ),
// //               Expanded(
// //                 child: searchData.length == 0   // Check SearchData list is empty or not if empty then show full data else show search data
// //                     ? ListView.builder(
// //                   itemCount: fullData.length,
// //                   itemBuilder: (context, int index) {
// //                     return Container(
// //                       decoration: const BoxDecoration(
// //                           color: Colors.white,
// //                           boxShadow: [
// //                             BoxShadow(
// //                                 color: Colors.grey,
// //                                 spreadRadius: 2,
// //                                 offset: Offset(2, 2))
// //                           ]),
// //                       margin: EdgeInsets.all(10),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             "Post",
// //                             style: TextStyle(
// //                                 fontWeight: FontWeight.bold, fontSize: 16),
// //                           ),
// //                           Container(
// //                             height: 2,
// //                           ),
// //                           Text(fullData[index]['turkmen'].toString(), style: TextStyle(color: Colors.blue),)
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                 )
// //                     : ListView.builder(
// //                   itemCount: searchData.length,
// //                   itemBuilder: (context, int index) {
// //                     return Container(
// //                       decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           boxShadow: [
// //                             BoxShadow(
// //                                 color: Colors.grey,
// //                                 spreadRadius: 2,
// //                                 offset: Offset(2, 2))
// //                           ]),
// //                       margin: EdgeInsets.all(10),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             "Post",
// //                             style: TextStyle(
// //                                 fontWeight: FontWeight.bold, fontSize: 16),
// //                           ),
// //                           Container(
// //                             height: 2,
// //                           ),
// //                           Text(searchData[index]['turkmen'].toString())
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               )
// //             ],
// //           )),
// //     );
// //   }
// // }
// //
// //
//
//
