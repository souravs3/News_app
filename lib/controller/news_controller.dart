import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/news_model.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNews = <NewsModel>[].obs;
  RxList<NewsModel> newsForYour = <NewsModel>[].obs;
  RxList<NewsModel> newsForLimit = <NewsModel>[].obs;
  RxList<NewsModel> appleNews = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsLimit = <NewsModel>[].obs;
  RxList<NewsModel> usNewsList = <NewsModel>[].obs;
  RxList<NewsModel> usNewsListLimit = <NewsModel>[].obs;
  RxList<NewsModel> wallStreetArticle = <NewsModel>[].obs;
  RxList<NewsModel> wallStreetArticleLimit = <NewsModel>[].obs;

  RxBool isTrendingLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isAppleNewsLoading = false.obs;
  RxBool isTeslaLoading = false.obs;
  RxBool isUsBuisinessLoading = false.obs;
  RxBool isWalkStreetLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTrendingNews();
    getYourNews();
    getAppleNews();
    getUsBusinessData();
    getUsWallStreetArticle();
  }

  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    var baseUrl =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=861d2e3e52e342d2b5946a991e496289';

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          trendingNews.add(NewsModel.fromJson(news));
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    isTrendingLoading.value = false;
  }

  Future<void> getYourNews() async {
    isNewsForYouLoading.value = true;
    var baseUrl =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-07-23&sortBy=publishedAt&apiKey=861d2e3e52e342d2b5946a991e496289';

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          newsForYour.add(NewsModel.fromJson(news));
        }
        newsForLimit.value = newsForYour.sublist(0, 5).obs;
        print('newsForYour: ${newsForYour.length} articles loaded');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> getAppleNews() async {
    isAppleNewsLoading.value = true;
    var baseUrl =
        'https://newsapi.org/v2/everything?q=apple&from=2024-08-21&to=2024-08-21&sortBy=popularity&apiKey=861d2e3e52e342d2b5946a991e496289';

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          appleNews.add(NewsModel.fromJson(news));
        }
        appleNewsLimit.value = appleNews.sublist(0, 5).obs;

        print('newsForYour: ${newsForYour.length} articles loaded');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    isAppleNewsLoading.value = false;
  }

  Future<void> getUsBusinessData() async {
    isUsBuisinessLoading.value = true;
    var baseUrl =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=861d2e3e52e342d2b5946a991e496289';

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          usNewsList.add(NewsModel.fromJson(news));
        }
        usNewsListLimit.value = usNewsList.sublist(0, 5).obs;

        print('newsForYour: ${newsForYour.length} articles loaded');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    isUsBuisinessLoading.value = false;
  }

  Future<void> getUsWallStreetArticle() async {
    isWalkStreetLoading.value = true;
    var baseUrl =
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=861d2e3e52e342d2b5946a991e496289';

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          wallStreetArticle.add(NewsModel.fromJson(news));
        }
        wallStreetArticleLimit.value = wallStreetArticle.sublist(0, 5).obs;

        print('newsForYour: ${newsForYour.length} articles loaded');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    isWalkStreetLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    isNewsForYouLoading.value = true;
    var baseUrl =
        'https://newsapi.org/v2/everything?q=$search&apiKey=861d2e3e52e342d2b5946a991e496289';

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        newsForYour.clear();
        int i = 0;

        for (var news in articles) {
          i++;
          newsForYour.add(NewsModel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    isNewsForYouLoading.value = false;
  }
}
