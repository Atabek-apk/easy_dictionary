import 'package:flutter/foundation.dart';

class LikeWords extends ChangeNotifier {

  List<String> _likes = [];
  List<String> get like => _likes;

  void pressButton(String product){
    final isExist = _likes.contains(product);
    if(isExist){
      _likes.remove(product);
    }else{
      _likes.add(product);
    }
    notifyListeners();
  }

  bool isExist(String like){
    final isExist = _likes.contains(like);
    return isExist;
  }
}
