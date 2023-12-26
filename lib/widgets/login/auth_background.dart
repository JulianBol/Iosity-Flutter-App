import 'package:flutter/material.dart';

// < AuthBackground > retorna mediante un contenedor todo el 
// background de la pantalla de login.
class AuthBackground extends StatelessWidget {
  
  final Widget child;
  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      height: double.infinity,

      child: Stack(
        children: [
          _ColorBox(),
          _HeaderIcon(),
          child
        ],
      )
    );
  }
}

// < _ColorBox > es un contendedor decorado mediante un gradiente 
// que ocupa el 40% de la pantalla. Asu vez, sobre él existen pequeñas 
// '_Bubble' para decorar .
class _ColorBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _boxDecoration(),
      
      child: const Stack(
        children: [
          
          Positioned(
            top: -20,
            left: -5,
            child: _Bubble()
          ),

          Positioned(
            top: 40,
            right: 15,
            child: _Bubble()
          ),

          Positioned(
            bottom: -50,
            left: 35,
            child: _Bubble()
          ),

          Positioned(
            top: 150,
            left: 120,
            child: _Bubble()
          ),

          Positioned(
            bottom: -30,
            right: -15,
            child: _Bubble()
          )

        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(195, 164, 6, 6),
          Color.fromARGB(255, 217, 130, 36)
        ]
      )
    );

}


// < _Bubble > es un widget que retorna una pequeña burbuja 
// circular semitransparente. 
class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: _bubbleDecoration(),
    );
  }

  BoxDecoration _bubbleDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    color: const Color.fromRGBO(255, 255, 255, 0.05)
  );

}

// < _HeaderIcon > retorna un widget mediante un contenedor, 
//el cual entrega un pin (icono) de usuario en la parte superior de
// la pantalla.
class _HeaderIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100,),
      ),
    );
  }
}