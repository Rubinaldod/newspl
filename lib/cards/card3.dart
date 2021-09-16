import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wordpress_app/models/article.dart';
import 'package:wordpress_app/models/constants.dart';
import 'package:wordpress_app/utils/cached_image.dart';
import 'package:wordpress_app/utils/next_screen.dart';
import 'package:wordpress_app/widgets/bookmark_icon.dart';
import 'package:wordpress_app/widgets/video_icon.dart';

//big card with title only
class Card3 extends StatelessWidget {
  const Card3(
      {Key? key,
      required this.article,
      required this.heroTag,
      required this.scaffoldKey})
      : super(key: key);
  final Article article;
  final String heroTag;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final bookmarkedList = Hive.box(Constants.bookmarkTag);
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 10,
                offset: Offset(0, 3)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        child: Hero(
                            tag: heroTag,
                            child: CustomCacheImage(
                                imageUrl: article.image, radius: 0))),
                  ),

                  VideoIcon(tags: article.tags, iconSize: 60,)
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.category!.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w500
                      ),
                    ),

                    SizedBox(height: 5,),
                    Text(
                      article.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.time,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          article.timeAgo!,
                          style: TextStyle(fontSize: 13),
                        ),
                        Spacer(),
                        BookmarkIcon(
                          bookmarkedList: bookmarkedList,
                          article: article,
                          iconSize: 18,
                          scaffoldKey: scaffoldKey,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
      onTap: () => navigateToDetailsScreen(context, article, heroTag)
    );
  }
}


