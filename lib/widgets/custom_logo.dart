



import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
 
 final String titulo;

  const CustomLogo({Key key, 
    @required this.titulo}) 
  : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: size.height * 0.06),
        width: size.width * 0.4,
        //height: size.height*0.4,

        child: Column(
          children: <Widget>[
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(height: size.height * 0.02),
            Text(
              this.titulo,
              style: TextStyle(fontSize: size.height * 0.04),
            )
          ],
        ),
      ),
    );
  }
}