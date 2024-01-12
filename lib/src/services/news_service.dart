import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iosity/src/models/category_model.dart';
import 'package:iosity/src/models/news_models.dart';
import 'package:http/http.dart' as http;


const _URL_NEWS = 'https://newsapi.org/v2';
const _HOST = 'newsapi.org';
const _PATH = '/v2/top-headlines';
const _COUNTRY = 'us';
const _API_KEY = 'a1492f40ffec4f0286854aed71a16691'; 


class NewsService extends ChangeNotifier {

  List <Article> headLines = [];
  List <Category> categories = [
    Category(icon: FontAwesomeIcons.building, name: 'business'),
    Category(icon: FontAwesomeIcons.tv, name: 'entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, name: 'general'),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'health'),
    Category(icon: FontAwesomeIcons.vials, name: 'science'),
    Category(icon: FontAwesomeIcons.futbol, name: 'sports'),
    Category(icon: FontAwesomeIcons.memory, name: 'technology')
  ];


  Map <String, List <Article>> categoryArticles = {};
  String _selectedCategory = 'business';


  NewsService(){

    // Hacemos la petición para obtener 
    // las Noticias en Tendencia.
    getTopHeadLines();

    // Inicializamos el Mapa de < categoryArticles >
    categories.forEach((element) {
      categoryArticles[element.name] = <Article> [];
    });

    // Hacemos la petición para obtener 
    // las Noticias de la categoria por
    // defecto 'business'.
    getHeadLinesByCategory(_selectedCategory);
  }


  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
    getHeadLinesByCategory(value);

    notifyListeners();
  }

  List<Article> get getArticlesCategory => (categoryArticles[_selectedCategory]!);

  void getTopHeadLines() async {

    final Uri url = Uri(
      scheme: 'https',
      host: _HOST,
      path: _PATH,
      queryParameters: {'country': _COUNTRY, 'apiKey': _API_KEY}
    );

    final response = await http.get(url);

    final NewsResponse newsResponse = newsResponseFromJson(response.body);
    headLines.addAll(newsResponse.articles);

    notifyListeners();
  }

   getHeadLinesByCategory(String category) async {

    if(categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }

    final Uri url = Uri(
      scheme: 'https',
      host: _HOST,
      path: _PATH,
      queryParameters: {'country': _COUNTRY, 'apiKey': _API_KEY, 'category': category}
    );

    final response = await http.get(url);

    final NewsResponse newsResponse = newsResponseFromJson(response.body);
    categoryArticles[category]!.addAll(newsResponse.articles);

    notifyListeners();
  }
}