import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iosity/src/services/news_service.dart';
import 'package:iosity/src/widgets/widgets.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({super.key});

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final newsService = Provider.of<NewsService>(context);
    return (newsService.headLines.isEmpty)
           ? const Center(child: CircularProgressIndicator())
           : NewsList(news: newsService.headLines);
  }
  
  // Permite mantener el esatdo del scroll en el widget < NewsList > 
  // es decir, al cambiar de página y regresar a la misma, el scroll 
  // se mantendrá en su posicición. Se requiere que < Tab1Page > sea
  // un StatefulWidget.
  @override
  bool get wantKeepAlive => true;
}