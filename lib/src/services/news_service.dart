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
    Category(icon: FontAwesomeIcons.building, name: 'Business'),
    Category(icon: FontAwesomeIcons.tv, name: 'Entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, name: 'General'),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'Health'),
    Category(icon: FontAwesomeIcons.vials, name: 'Science'),
    Category(icon: FontAwesomeIcons.futbol, name: 'Sports'),
    Category(icon: FontAwesomeIcons.memory, name: 'Technology')
  ];

  NewsService(){
    getTopHeadLines();
  }

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
}