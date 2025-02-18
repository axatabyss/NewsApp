

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/news_controller.dart';
import '../widgets/animated_button.dart';
import '../widgets/fade_in_widget.dart';
import '../widgets/shimmer_loader.dart';
import '../widgets/article_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final NewsController newsController = Get.find<NewsController>();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Widget> _pages() {
    return [

      RefreshIndicator(
        onRefresh: () async {
          await newsController.fetchArticles(isRefresh: true);
        },
        child: Obx(() {
          if (newsController.isLoading.value && newsController.articles.isEmpty) {
            return ShimmerLoader();
          } else if (newsController.articles.isEmpty) {
            return Center(child: Text('No articles found.'));
          } else {
            return ListView.builder(
              controller: _scrollController,
              itemCount: newsController.articles.length + 1,
              itemBuilder: (context, index) {
                if (index < newsController.articles.length) {
                  final article = newsController.articles[index];
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) {
                      newsController.removeArticle(index);
                      Get.snackbar('Removed', 'Article removed from list',
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ArticleTile(article: article),
                  );
                } else {
                  // Pagination loading indicator
                  if (newsController.isMoreDataAvailable.value) {
                    newsController.fetchArticles();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return SizedBox();
                  }
                }
              },
            );
          }
        }),
      ),

      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FadeInWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                  onPressed: () {
                    Get.changeThemeMode(ThemeMode.dark);
                  },
                  label: 'Switch to Dark Mode',
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 20),
                AnimatedButton(
                  onPressed: () {
                    Get.changeThemeMode(ThemeMode.light);
                  },
                  label: 'Switch to Light Mode',
                  backgroundColor: Colors.grey[700]!,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      )

    ];
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 300) {
        if (!newsController.isLoading.value && newsController.isMoreDataAvailable.value) {
          newsController.fetchArticles();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _selectedIndex == 0 ?
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search articles...',
            hintStyle: TextStyle(color: Colors.grey.shade600),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.blueAccent, width: 2),
            ),
          ),
          onSubmitted: (value) {
            newsController.searchArticles(value.trim());
          },
        )
          :
        Text('Settings'),
      ),
      body: _pages()[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
