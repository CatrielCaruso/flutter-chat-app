import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {


  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    Key key, 
    @required this.texto, 
    @required this.uid, 
    @required this.animationController}) 
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
          opacity: animationController,
          child: SizeTransition(
           
           sizeFactor: CurvedAnimation(parent: animationController, curve:Curves.elasticOut),

        child: Container(
        child:  this.uid=='123'
                 ? _myMessage()
                 : _notMyMessage()
      ),
          ),
    );
  }


  Widget _myMessage(){

    return Align(

      alignment: Alignment.centerRight,
      child: Container(
        
        margin: EdgeInsets.only(bottom: 5.0,
        left: 50.0,
        right: 5.0
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(this.texto,style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(

           color: Color(0xff4D9EF6),
           borderRadius: BorderRadius.circular(20.0)
        ),


      ),
    );

  }

  Widget _notMyMessage(){

   
   return Align(

      alignment: Alignment.centerLeft,
      child: Container(
        
        margin: EdgeInsets.only(bottom: 5.0,
        left: 5.0,
        right: 50.0
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(this.texto,style: TextStyle(color: Colors.black87),),
        decoration: BoxDecoration(

           color: Color(0xffE4E5E8),
           borderRadius: BorderRadius.circular(20.0)
        ),


      ),
    );

  }
}