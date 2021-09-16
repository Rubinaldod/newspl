import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordpress_app/cards/bookmark_card.dart';
import 'package:wordpress_app/config/config.dart';
import 'package:wordpress_app/models/article.dart';
import 'package:wordpress_app/models/constants.dart';
import 'package:wordpress_app/services/bookmark_service.dart';
import 'package:wordpress_app/utils/empty_image.dart';
import 'package:easy_localization/easy_localization.dart';

class BookmarkTab extends StatefulWidget {
  const BookmarkTab({Key? key}) : super(key: key);

  @override
  _BookmarkTabState createState() => _BookmarkTabState();
}

class _BookmarkTabState extends State<BookmarkTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bookmarkList = Hive.box(Constants.bookmarkTag);
    return Scaffold(
      appBar: AppBar(
        title: Text('bookmarks').tr(),
        automaticallyImplyLeading: false,
        
        actions: [
          TextButton(
            onPressed: () => BookmarkService().clearBookmarkList(),
            child: Text('clear all').tr(),
            style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.only(right: 15, left: 15))),
          ),

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: bookmarkList.listenable(),
                builder: (BuildContext context, dynamic value, Widget? child) {
                  if(bookmarkList.isEmpty) return EmptyPageWithImage(
                    image: Config.bookmarkImage,
                    title: 'bookmark is empty'.tr(),
                    description: 'save your favourite contents here'.tr(),
                  );
                  
                  return ListView.separated(
                    padding: EdgeInsets.all(15),
                    itemCount: bookmarkList.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      Article article = Article(
                          id: bookmarkList.getAt(index)['id'],
                          title: bookmarkList.getAt(index)['title'],
                          content: bookmarkList.getAt(index)['content'],
                          image: bookmarkList.getAt(index)['image'],
                          video: bookmarkList.getAt(index)['video'],
                          author: bookmarkList.getAt(index)['author'],
                          avatar: bookmarkList.getAt(index)['avatar'],
                          category: bookmarkList.getAt(index)['category'],
                          date: bookmarkList.getAt(index)['date'],
                          timeAgo: bookmarkList.getAt(index)['time_ago'],
                          link: bookmarkList.getAt(index)['link'],
                          catId: bookmarkList.getAt(index)['catId'],
                          tags: bookmarkList.getAt(index)['tags']
                      );

                      return BookmarkCard(article: article);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


