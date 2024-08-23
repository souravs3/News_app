import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/model/news_model.dart';
import 'package:news/view/style/spacer.dart';

class Newsdetails extends StatelessWidget {
  final NewsModel newsModel;
  const Newsdetails({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Text('Back'),
                      ],
                    ),
                  ),
                )
              ],
            ),
            20.h,
            Container(
              height: 350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  newsModel.urlToImage ??
                      'https://indianexpress.com/wp-content/uploads/2024/08/mayank-yadav-2.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return Image.asset(
                      'Assets/Photos/placeholder.jpg', // Use a placeholder image
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            20.h,
            Flexible(
              child: Text(
                newsModel.title!,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            10.h,
            Text(
              '${newsModel.publishedAt}  *tech',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            15.h,
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(newsModel.urlToImage!),
                  radius: 15,
                ),
                10.w,
                Text(
                  newsModel.author!,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                )
              ],
            ),
            15.h,
            Text(newsModel.description!)
          ],
        ),
      ),
    );
  }
}
