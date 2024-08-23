import 'package:flutter/material.dart';
import 'package:news/view/Components/loading_container.dart';
import 'package:news/view/style/spacer.dart';
import 'package:shimmer/shimmer.dart';

class NewsforContainer extends StatelessWidget {
  const NewsforContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Row(
        children: [
          // Image with a placeholder if URL is null or returns 404
          Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.surfaceContainer,
            highlightColor: const Color.fromARGB(255, 86, 86, 86),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(20)),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: Image.network(
              //     'imageUrl',
              //     height: 100,
              //     width: 100,
              //     fit: BoxFit.cover,
              //     errorBuilder: (context, error, stackTrace) {
              //       print('Error loading image: $error');
              //       return Image.asset(
              //         'Assets/Photos/water.jpg',
              //         height: 100,
              //         width: 100,
              //         fit: BoxFit.cover,
              //       );
              //     },
              //   ),
              // ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    LoadingContainer(width: 30, hight: 30),
                    LoadingContainer(
                      hight: 15,
                      width: MediaQuery.of(context).size.width / 6,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                LoadingContainer(
                    width: MediaQuery.of(context).size.width / 7, hight: 10),
                15.h,
                LoadingContainer(
                    width: MediaQuery.of(context).size.width / 3, hight: 12),
                20.h,
                Row(
                  children: [
                    LoadingContainer(
                        width: MediaQuery.of(context).size.width / 4,
                        hight: 10),
                    15.w,
                    LoadingContainer(
                        width: MediaQuery.of(context).size.width / 7, hight: 10)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
