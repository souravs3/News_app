import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/controller/news_controller.dart';
import 'package:news/view/Components/newsfor_container.dart';
import 'package:news/view/Components/trending_loading_card.dart';
import 'package:news/view/pages/Details/newsdetails.dart';
import 'package:news/view/pages/Home/widgets/news_tile.dart';
import 'package:news/view/pages/Home/widgets/trending.dart';
import 'package:news/view/style/spacer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    newsController.getTrendingNews(); // Load data at the start
    newsController.newsForYour(); // Load data at the start

    return Scaffold(
      extendBody: true,
      body: Container(
        padding: EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              50.h,
              // AppBar with title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.surfaceContainer),
                    child: Icon(
                      Icons.dashboard,
                      size: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Global',
                        style: GoogleFonts.poppins(
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color.fromRGBO(0, 195, 43, 100),
                        ),
                      ),
                      10.w,
                      Text('News',
                          style: GoogleFonts.poppins(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          )),
                    ],
                  ),
                  InkWell(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).colorScheme.surfaceContainer),
                      child: Icon(
                        Icons.person,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              20.h,
              // Hottest News Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hottest News',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              20.h,
              // Trending News Section with GetX Reactive State Management
              Obx(() {
                if (newsController.trendingNews.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isTrendingLoading.value
                        ? Row(
                            children: [
                              TrendingLoadingCard(),
                              TrendingLoadingCard(),
                            ],
                          )
                        : Row(
                            children: newsController.trendingNews
                                .map(
                                  (e) => Trending_News(
                                    onTap: () {
                                      Get.to(Newsdetails(
                                        newsModel: e,
                                      ));
                                    },
                                    imageUrl: e.urlToImage!,
                                    tag: 'Trending no 1',
                                    author: e.author ?? 'Unknown',
                                    time: e.publishedAt!,
                                    title: e.title!,
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                );
              }),
              20.h,
              // News For You Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News For You',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              20.h,
              // News For You Section with GetX Reactive State Management
              Obx(() => newsController.isNewsForYouLoading.value
                  ? Column(
                      children: [
                        NewsforContainer(),
                        NewsforContainer(),
                        NewsforContainer(),
                      ],
                    )
                  : Column(
                      children: newsController.newsForLimit.map((e) {
                        return NewsTile(
                          onTap: () {
                            Get.to(Newsdetails(newsModel: e));
                          },
                          imageUrl: e.urlToImage ??
                              'https://plus.unsplash.com/premium_photo-1690303193898-f9c721d0770b?q=80&w=2066&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          title: e.title ?? 'No Title',
                          time: e.publishedAt ?? 'Unknown Date',
                          author: e.author ?? 'Unknown',
                        );
                      }).toList(),
                    )),

              20.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Apple News',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              15.h,
              Obx(() {
                if (newsController.appleNewsLimit.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isAppleNewsLoading.value
                        ? CircularProgressIndicator()
                        : Row(
                            children: newsController.appleNewsLimit
                                .map(
                                  (e) => Trending_News(
                                    onTap: () {
                                      Get.to(Newsdetails(
                                        newsModel: e,
                                      ));
                                    },
                                    imageUrl: e.urlToImage ??
                                        "https://plus.unsplash.com/premium_photo-1690303193898-f9c721d0770b?q=80&w=2066&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    tag: 'Trending no 1',
                                    author: e.author ?? 'Unknown',
                                    time: e.publishedAt!,
                                    title: e.title!,
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
