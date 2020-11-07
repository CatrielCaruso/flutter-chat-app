



import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  final IconData icon;
  final String placeholder;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput({
    Key key, 
    @required this.icon, 
    @required this.placeholder, 
    @required this.textEditingController, 
    this.keyboardType =TextInputType.text, 
    this.isPassword   =false
    }) : super(key: key);




  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return  Container(
            
            margin: EdgeInsets.only(bottom:size.height*0.02 ),
            padding: EdgeInsets.only(top:size.width*0.005,bottom:size.width*0.005,left: size.width*0.005,right: size.width*0.05 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow:<BoxShadow>[
                
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 5.0),
                  blurRadius: 5.0
                )


              ] 
            ),
            child: TextField(
              controller: this.textEditingController,
              autocorrect: false,
              keyboardType:this.keyboardType,
              obscureText: this.isPassword,
              decoration:InputDecoration(

                prefixIcon: Icon(this.icon),
                focusedBorder:InputBorder.none,
                border: InputBorder.none,

                hintText: this.placeholder


              ) ,

            ),
            
          );
          
  }
}