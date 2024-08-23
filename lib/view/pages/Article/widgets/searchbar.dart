import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/controller/news_controller.dart';
import 'package:news/view/style/spacer.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surfaceContainer),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search here ...',
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w400)),
          )),
          10.w,
          Obx(
            () => newsController.isNewsForYouLoading.value
                ? Container(
                    width: 50,
                    padding: EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(0, 195, 43, 100),
                    ),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      newsController.searchNews(searchController.text);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(0, 195, 43, 100)),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
