import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/view/style/spacer.dart';

class Trending_News extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback onTap;
  const Trending_News({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.time,
    required this.title,
    required this.author,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(14),
        width: 230,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Light grey shadow
              spreadRadius: 2,
              blurRadius: 6,

              offset: Offset(5, 9), // Changes the position of the shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            10.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tag,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    maxLines: 2,
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            10.h,
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                15.w,
                Flexible(
                  child: Text(
                    author,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
