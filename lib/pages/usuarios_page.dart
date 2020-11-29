

import 'package:flutter/material.dart';

import 'package:chat_app/model/usuarios.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:chat_app/services/auth_services.dart';


class UsuariosPage extends StatefulWidget {

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final usuarios=[
   
   Usuario(nombre: 'Maria',email:'test1@test',uid: '1',online: true),
   Usuario(nombre: 'Melisa',email:'test2@test',uid: '2',online: false),
   Usuario(nombre: 'Fernando',email:'test3@test',uid: '3',online: true),

  ];


  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        
        title: Text(usuario.nombre,style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading:IconButton(
        icon:Icon(Icons.exit_to_app,color: Colors.black87) , 
        onPressed:(){


          // TODO Desconectar el socket server
          
          Navigator.pushReplacementNamed(context, 'login');
          AuthService.deleteToken();

        }
        ) ,
        actions:<Widget> [
          
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.check_circle,color: Colors.blueAccent),
            //Icon(Icons.offline_bolt,color: Colors.red)
          )


        ],

      ),
      body:SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuario,
        header: WaterDropHeader(

          complete: Icon(Icons.check,color:Colors.blue[400]),
          waterDropColor: Colors.blue[400],
        ),
        child:  _listViewUsuario(size),
        
        
        ),
     );
   
  }

  ListView _listViewUsuario(Size size) {
    return ListView.separated(

      physics: BouncingScrollPhysics(),
      itemBuilder: (_,i)=>_usuarioListTitle(usuarios[i], size), 
      separatorBuilder: (_,i)=>Divider(), 
      itemCount: usuarios.length,
      );
  }

  ListTile _usuarioListTitle(Usuario usuario, Size size) {
    return ListTile(

        
        
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
             
             child: Text(usuario.nombre.substring(0,2)),
            backgroundColor: Colors.blue[100],

        ),
        trailing: Container(
          
          height: size.height*0.03,
          width: size.width*0.03,
          decoration: BoxDecoration(
            color:usuario.online? Colors.green:Colors.red,
            shape:BoxShape.circle 
          ),
        ),


      );
  }

   _cargarUsuario()async{


     
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
   
}