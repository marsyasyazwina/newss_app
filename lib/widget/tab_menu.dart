import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/model/articles.dart';
import 'package:newss_app/service/data_service.dart';
import 'package:newss_app/widget/news_item.dart';

class TabMenu extends StatefulWidget {

  // membuat constructor / param untuk mengambil data dari model
  final List<Article> article;
  TabMenu(this.article);

  @override
  _TabMenuState createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu>  with SingleTickerProviderStateMixin{

  late TabController _tabController;
  final List<Tab> myTabs = <Tab> [
    //berisi judul tab2 kita
    // business
    // entertainment
    // general
    // health
    // science
    // sports
    // technology
    const Tab(
      text: 'business',
    ),
     const Tab(
      text: 'entertaiment',
    ),
    const Tab(
      text: 'general',
    ),
    const Tab(
      text: 'health',
    ),
    const Tab(
      text: 'science',
    ),
    const Tab(
      text: 'sports',
    ),
    const Tab(
      text: 'technology',
    ),
  ];

  @override
  void initState(){
    // TODO implement initstate
    _tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // buat var news utk koneksi ke server by category dikelas new
    News news = News();
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
              labelColor: Colors.deepOrange,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BubbleTabIndicator(
                indicatorHeight: 30.0,
                indicatorColor: Colors.black,
                tabBarIndicatorSize: TabBarIndicatorSize.tab
              ),
              tabs: myTabs,
            isScrollable: true,
          ),
          SizedBox(height: 10,),
          Expanded(
              child: TabBarView(
                controller: _tabController,
                children: myTabs.map((Tab tab) {
                  return FutureBuilder(
                    future: news.getNewsByCategory(tab.text.toString()),
                      builder: (context, snapshot) => snapshot.data != null
                          ? _listNewsByCategory(snapshot.data as List<Article>)
                          : const Center(child: CircularProgressIndicator(),)
                  );
                }).toList(),
              )
          )
        ],
      ),
    );
  }

  Widget _listNewsByCategory(List<Article> article) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListView.builder(
          itemBuilder: (context, index) => NewsItem(article[index]),
      itemCount: article.length,
      ),
    );

  }
}
