import 'package:flutter/material.dart';
import 'package:news_app/shared/component/cubit.dart';

// import 'package:webview_flutter/webview_flutter.dart';
import '../../modules/web_view/web_view.dart';

Widget buildScreenItem(article, context) => InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> WebViewScreen(article['url'])),
        );
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppCubit.get(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildSeparatedItem() => Container(
      width: double.infinity,
      height: 2,
      color: Colors.grey,
    );
