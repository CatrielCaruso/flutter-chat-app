
import 'package:chat_app/helpers/mostrar_alerta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_app/widgets/custom_labels.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/custom_logo.dart';
import 'package:chat_app/widgets/boton_azul.dart';
import 'package:chat_app/services/auth_services.dart';


class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(

            physics: BouncingScrollPhysics(),

            child: Container(
              height:size.height*0.9 ,
              child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomLogo(titulo: 'Register'),
                  _Form(),
                  CustomLabels(ruta: 'login',
                  
                  titulo: '¿Ya tienes cuenta?',
                  subtitulo: 'Ingresa ahora',
                  ),
                  Text(
                    'Terminos y condicones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();
  final nameCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {

   final authService = Provider.of<AuthService>(context);


    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.04),
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.05),
      child: Column(
        children: <Widget>[


            CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textEditingController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'E-mail',
            keyboardType: TextInputType.emailAddress,
            textEditingController: emailCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            //keyboardType: TextInputType.text,
            isPassword: true,
            textEditingController: passCtrl,
          ),

          //TODO crear boton
          BotonAzul(text: 'Crear cuenta',
          onPress: authService.autenticando?null:()async{
                
                print(nameCtrl.text);
                print(emailCtrl.text);
                print(passCtrl.text);

                final registroOk= await  authService.register(nameCtrl.text.trim(), emailCtrl.text.trim(),passCtrl.text.trim());

                if(registroOk==true){
                  
                  //Conectar al socket server
                  Navigator.pushReplacementNamed(context,'usuario');


                }else{


                  mostrarAlerta(context, 'Registro incorrecto', registroOk);
                }
               

          }, ),
         
        ],
      ),
    );
  }
}
