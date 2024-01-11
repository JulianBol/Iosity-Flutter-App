import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iosity/src/pages/pages.dart';

class TabsPages extends StatelessWidget {
  const TabsPages({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      
      // Creamos una instancia de < _NavigationModel() > y al declararlo en este nivel 
      // del árbol de widgets, todo widget por debajo (dentro) de Scaffold podrá tener
      // acceso a la instancia creada y a sus atributos y métodos, así cómo escuchar y
      // ver si tuvo cambios en sus valores.
      create: (_) => _NavigationModel(),
      
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}


// < _Navigation > retorna un ' BottomNavigationBar ' el cual es una barra 
// de navegación, en este caso la barra de navegación contiene tres items 
// ('Para ti', 'Encabezados' y 'Clima'). Este widget privado se implementa 
// dentro de ' TabsPages ' dentro de su Scaffold:

//            return Scaffold(
//                    ...
//                    bottomNavigationBar: _Navigation()
//                    ...
//                   )
class _Navigation extends StatelessWidget {
  const _Navigation({super.key});

  @override
  Widget build(BuildContext context) {

    // Obtenemos la instancia de nuestro modelo de < _NavigationModel >, esta 
    // instacia, gracias al Provider, posee en todo momento los cambios hechos
    // en esa instancia, por lo que sus atributos siempre estan actualizados.
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      elevation: 0,
      onTap: (value) => navigationModel.updatePagebyButton(value),
      currentIndex: navigationModel.actualPage,
      
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
        BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Clima')
      ]  
    );
  }
}


// < _Pages > retorna un ' PageView ' que es un widget que se utiliza para crear 
// un conjunto de páginas desplazables, generalmente asociadas con un control 
// deslizante horizontal o vertical. Este widget permite a los usuarios desplazarse 
// horizontalmente entre diferentes páginas de contenido ('Para ti', 'Encabezados' y 'Clima'). 
// Este widget privado se implementa dentro de ' TabsPages ' dentro de su Scaffold:

//            return Scaffold(
//                    ...
//                    body: _Pages()
//                    ...
//                   )
class _Pages extends StatelessWidget {
  const _Pages({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Obtenemos la instancia de nuestro modelo de < _NavigationModel >, esta 
    // instacia, gracias al Provider, posee en todo momento los cambios hechos
    // en esa instancia, por lo que sus atributos siempre estan actualizados.
    final navigationModel = Provider.of<_NavigationModel>(context);

    // < PageView > permite hacer un scroll a pantalla completa entre 
    // sus widgets hijos, silimilar a un listView. Su diferencia es 
    // que sus widgets hijos ocupan toda la pantalla o espacio disponible en ella.
    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: navigationModel.pageController,
      onPageChanged: (value) => navigationModel.actualPage = value,

      children: [
        const Tab1Page(),
        Container(color: Colors.green),
        Container(color: Colors.blue)
      ],
    );
  }
}


// < _NavigationModel > es nuestro Provider, este modelo posee información 
// de reelevancia para cambiar los estados de la app, especificamente en la 
// paginación de la vista, controlla el valor de la pagina actual en la que
// se encuentra el usuario. Si este valor cambia el modelo notifica a los widgets
// oyentes para renderizar (actualizar) el estado de un widget.
class _NavigationModel extends ChangeNotifier {

  int _actualPage = 0;
  final _pageController = PageController();

  int get actualPage => _actualPage;
  
  set actualPage(int value) {
    _actualPage = value;
    notifyListeners();
  }

  void updatePagebyButton(int value){
    _actualPage = value;
    _pageController.animateToPage(value, duration: const Duration(milliseconds: 250), curve: Curves.easeOutCirc);
    
    notifyListeners();
  }

  PageController get pageController => _pageController;
}