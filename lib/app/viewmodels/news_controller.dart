
import 'package:get/get.dart';
import '../models/article.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {

  final NewsService _newsService = NewsService();

  var articles = <Article>[].obs;
  var isLoading = false.obs;
  var page = 1.obs;
  var searchQuery = ''.obs;
  var isMoreDataAvailable = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }


  Future<void> fetchArticles({bool isRefresh = false}) async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      if (isRefresh) {
        page.value = 1;
        articles.clear();
        isMoreDataAvailable.value = true;
      }
      final fetchedArticles = await _newsService.fetchNews(page: page.value, query: searchQuery.value);
      if (fetchedArticles.isNotEmpty) {
        articles.addAll(fetchedArticles);
        page.value++;
      } else {
        isMoreDataAvailable.value = false;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> searchArticles(String query) async {
    searchQuery.value = query;
    await fetchArticles(isRefresh: true);
  }


  void removeArticle(int index) {
    articles.removeAt(index);
  }

}
