import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  
  final String text;
  final Function onPress;

  const BotonAzul({Key key, 
  @required this.text, 
  @required this.onPress
  }) : super(key: key);

 


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RaisedButton(
      elevation: 2.0,
      highlightElevation: 5.0,
      color: Colors.blue,
      shape: StadiumBorder(),
      onPressed: this.onPress,
      child: Container(
        height: size.height * 0.06,
        width: double.infinity,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white, fontSize: size.height * 0.02),
          ),
        ),
      ),
    );
  }
}
