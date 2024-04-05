import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sozluk/provider/like_words.dart';

import '../../provider/snakbar_every_time.dart';

class FavoriPage extends StatefulWidget {
  const FavoriPage({Key? key}) : super(key: key);

  @override
  State<FavoriPage> createState() => _FavoriPageState();
}

class _FavoriPageState extends State<FavoriPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<LikeWords>(context);
    final like = provider.like;
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade400,
          elevation: 0,
          title: Text("Halanlarym",
              style: TextStyle(fontSize: 25, fontFamily: 'Regular', color: Colors.white)),
        ),
        body: like.isNotEmpty
            ? ListView.builder(
          itemCount: like.length,
          itemBuilder: (context, index) {
            final lik = like[index];
            return Container(
              padding: EdgeInsets.only(top: 5),
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Card(
                elevation: 15,
                child: InkWell(
                  onTap: (){
                    // Navigator.of(context, rootNavigator: true)
                    //     .push(MaterialPageRoute(
                    //     builder: (context) => ProductDetails(
                    //       product: lik,
                    //     )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "${lik[0].toUpperCase()+lik.substring(1)}",textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue.shade600,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Bold'
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.pressButton(lik);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  elevation: 0,
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor: Colors.transparent,
                                  behavior: SnackBarBehavior.floating,
                                  content: SnakBarEveryTime(titleee: "${lik[0].toUpperCase()+lik.substring(1)} halanlaryňdan aýryldy"))
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.redAccent.withOpacity(0.2),
                            radius: 20,
                            child: provider.isExist(lik) ? Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.redAccent,
                              size: 22,
                            ) : Icon(
                              Icons.home,
                              color: Colors.redAccent,
                              size: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
            : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite , size: 75,color: Colors.red.shade100,),
                SizedBox(height: 20),
                Text(
                  "Halan sözlerim ýok !",
                  style: TextStyle(
                      color: Colors.blue.shade200,
                      fontSize: 28,
                      fontFamily: 'Regular'),
                ),
              ],
            )
        ));
  }
}
