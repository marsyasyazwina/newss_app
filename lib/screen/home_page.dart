import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/model/articles.dart';
import 'package:newss_app/screen/news_page.dart';
import 'package:newss_app/service/data_service.dart';

import '../utils/utils.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                    image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.3LfMowPA2NfG74iaOZbb-wHaHa?w=176&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7',
                    ))),
            width: 10,
            margin: const EdgeInsets.all(5),
          ),
          title: const Text(
            'Good Morning',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.blue,
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: news.getNews(),
            builder: (context, snapshot) => snapshot.data != null
                ? NewsPage(snapshot.data as List<Article>)
                : const Center(child:   CircularProgressIndicator())));
  }
}