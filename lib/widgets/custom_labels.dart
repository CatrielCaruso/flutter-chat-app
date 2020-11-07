


import 'package:flutter/material.dart';

class CustomLabels extends StatelessWidget {

 final String ruta;
 final String titulo;
 final String subtitulo;

  const CustomLabels({Key key, 
  @required this.ruta, @required this.titulo,@required this.subtitulo}) 
  : super(key: key);


  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            this.titulo,
            style: TextStyle(
                color: Colors.black54,
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: size.height * 0.01),
          GestureDetector(
                      child: Text(
              this.subtitulo,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: size.height * 0.023,
                  fontWeight: FontWeight.bold),
            ),
            onTap: (){


              Navigator.pushReplacementNamed(context, this.ruta);
            },
          )
        ],
      ),
    );
  }
}