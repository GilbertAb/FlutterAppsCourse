import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = "https://newsapi.org/v2";
final _API_KEY = "101c15bcbafb48408774ac4ebe39ce7f";

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, "business"),
    Category(FontAwesomeIcons.tv, "entertainment"),
    Category(FontAwesomeIcons.addressCard, "general"),
    Category(FontAwesomeIcons.headSideVirus, "health"),
    Category(FontAwesomeIcons.vials, "science"),
    Category(FontAwesomeIcons.volleyballBall, "sports"),
    Category(FontAwesomeIcons.memory, "technology"),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    categories.forEach((item) {
      categoryArticles[item.name] = [];
    });
    getArticlesByCategory(categories[0].name);
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String category) {
    _selectedCategory = category;
    getArticlesByCategory(category);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url =
        Uri.parse("$_URL_NEWS/top-headlines?country=us&apiKey=$_API_KEY");
    //"$_URL_NEWS/-headlines?country=us&apiKey=$_API_KEY";
    //"https://newsapi.org/v2/top-headlines?country=us&apiKey=101c15bcbafb48408774ac4ebe39ce7f");
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isEmpty) {
      final url = Uri.parse(
          "$_URL_NEWS/top-headlines?country=us&apiKey=$_API_KEY&category=$category");
      final response = await http.get(url);
      final newsResponse = NewsResponse.fromJson(response.body);

      categoryArticles[category]?.addAll(newsResponse.articles);

      notifyListeners();
    }
  }

  List<Article> get getCategoryArticles => categoryArticles[_selectedCategory]!;
}
