import 'package:get/get.dart';
import 'package:news/view/pages/Article/article_page.dart';
import 'package:news/view/pages/Home/home.dart';
import 'package:news/view/pages/Profile/profile_page.dart';

class BottomnavigationController extends GetxController {
  RxInt index = 0.obs;

 var pages = [
  Home(),
  ArticlePage(),
  ProfilePage(),
 ];
}
