import 'package:flutter/material.dart';
import 'package:news/view/Components/loading_container.dart';
import 'package:news/view/style/spacer.dart';

class TrendingLoadingCard extends StatelessWidget {
  const TrendingLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.all(10),
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              child: Column(
                children: [
                
                  LoadingContainer(
                    hight: 200,
                    width: MediaQuery.of(context).size.width,
                  ),
                  10.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LoadingContainer(
                        hight: 10,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      LoadingContainer(
                        hight: 10,
                        width: MediaQuery.of(context).size.width / 6,
                      ),
                    ],
                  ),
                  10.h,
                  Row(
                    children: [
                      Flexible(
                        child: LoadingContainer(
                          hight: 10,
                          width: MediaQuery.of(context).size.width / 6,
                        ),
                      ),
                    ],
                  ),
                  10.h,
                  Row(
                    children: [
                      LoadingContainer(
                        hight: 30,
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      15.w,
                      LoadingContainer(
                        hight: 10,
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                    ],
                  ),
                ],
              ),
            );
  }
}