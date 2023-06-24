import 'package:online_shop/utils/export.dart';
class MainScreenNotifier with ChangeNotifier{
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int newIndex){
    _pageIndex = newIndex;
    notifyListeners();
  }
}