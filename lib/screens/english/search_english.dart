import 'package:flutter/material.dart';

import '../../models/class_words.dart';

class SearchEnglish extends StatefulWidget {
  const SearchEnglish({Key? key}) : super(key: key);

  @override
  State<SearchEnglish> createState() => _SearchEnglishState();
}

final controller = TextEditingController();
List<Words> words = allWords;

class _SearchEnglishState extends State<SearchEnglish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Center(
            child: Text('Search',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.026,
                    fontFamily: 'Regular'))),
        actions: [
          IconButton(
              onPressed: () {

              }, icon: Icon(Icons.favorite_border_outlined)),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined),
                    hintText: 'Searching words',
                    suffixIcon: controller.text.isNotEmpty ? Container(
                      decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      margin: EdgeInsets.only(right: 7),
                      child: IconButton(
                        onPressed: (){
                          controller.text = '';
                          searchWord('');
                        },
                        icon: Icon(Icons.clear),),) : SizedBox(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.blue, width: 2))),
                onChanged: searchWord,
              ),
            ),
          ),
          words.isEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                    ),
                    Image.asset(
                      'assets/images/error.png',
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.27,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text('You search word was not found !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.024,
                            fontFamily: 'Regular',
                            color: Colors.blue.shade500)),
                  ],
                )
              : Expanded(
                  child: ListView.builder(
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
                                  side: BorderSide(
                                      color: Colors.blue.shade300, width: 1.5),
                                  borderRadius: BorderRadius.circular(15)),
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
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            fontFamily: 'Regular')),
                                  ),
                                  content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text('English : ',
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02,
                                                    fontFamily: 'Regular')),
                                            Text(
                                                word.english[0].toUpperCase() +
                                                    word.english.substring(1),
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02,
                                                    fontFamily: 'Regular')),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Turkmen : ',
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.02,
                                                  fontFamily: 'Regular'),
                                            ),
                                            Text(
                                              word.turkmen[0].toUpperCase() +
                                                  word.turkmen.substring(1),
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 5,
                                                backgroundColor:
                                                    Colors.blue.shade100,
                                                minimumSize: const Size(50, 45),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Icon(
                                                Icons.favorite_border_outlined,
                                                color: Colors.red,
                                              )),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blue.shade400,
                                                minimumSize:
                                                    const Size(150, 45),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
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
                            word.english[0].toUpperCase() +
                                word.english.substring(1),
                            style: TextStyle(
                                color: Colors.blue.shade800,
                                fontSize: 16,
                                fontFamily: 'Regular'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  void searchWord(String query) {
    final sugges = allWords.where((word) {
      final wordTitle = word.english.toLowerCase();
      final input = query.toLowerCase();
      return wordTitle.contains(input);
    }).toList();
    setState(() => words = sugges);
  }
}
