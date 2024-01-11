import 'package:flutter/material.dart';

class AppTheme {

  final Color _primaryColor = Colors.blue;
  
  ThemeData getTheme() => ThemeData(

    // Establece Tema Oscuro
    brightness: Brightness.dark,
    colorSchemeSeed: _primaryColor,


    // En este caso, se ha utilizado la propiedad < splashFactory > 
    // en el tema general para especificar la fábrica de salpicaduras
    // que debería utilizarse. Se refiere a la ANIMACIÓN que 
    // se expande desde el punto de contacto cuando se interactúa con el widget.
    splashFactory: InkSplash.splashFactory,

    // Se utiliza para ESTABLECER el COLOR de resaltado o realce cuando 
    // un usuario toca un área interactiva. En el contexto de InkWell, 
    // la propiedad < highlightColor > representa el color que se muestra cuando 
    // el usuario toca el área del widget. Este color de resaltado es un efecto 
    // visual que indica al usuario que ha tocado correctamente el área 
    // interactiva (FloatingActionButton, IconButton, etc).
    highlightColor: Colors.transparent,


    // Tema general de < BottomNavigationBar >
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: _primaryColor,
      backgroundColor: Colors.transparent,
      unselectedItemColor: const Color.fromARGB(191, 213, 222, 239),
    ),


    // Tema general de < CircularProgressIndicator >
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: _primaryColor
    )
    
  );

  Color get primaryColor => _primaryColor;
}