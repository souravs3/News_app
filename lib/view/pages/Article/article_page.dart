import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/news_controller.dart';
import 'package:news/view/pages/Article/widgets/searchbar.dart';
import 'package:news/view/pages/Details/newsdetails.dart';
import 'package:news/view/pages/Home/widgets/news_tile.dart';
import 'package:news/view/style/spacer.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              40.h,
              SearchBarWidget(),
              20.h,
              Obx(() => Column(
                    children: newsController.newsForYour
                        .map(
                          (e) => NewsTile(
                            imageUrl: e.urlToImage ??
                                'https://indianexpress.com/wp-content/uploads/2024/08/mayank-yadav-2.jpg',
                            title: e.title!,
                            time: e.publishedAt ?? '1 Day Ago',
                            author: e.author ?? 'Unavailble',
                            onTap: () {
                              Get.to(Newsdetails(newsModel: e));
                            },
                          ),
                        )
                        .toList(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
