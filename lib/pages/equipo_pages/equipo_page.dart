import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Contacto extends StatelessWidget {
  const Contacto({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          backgroundColor: Colors.black,
        title:Text('Información de equipo', style: TextStyle(color: Colors.white),),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
        ),
      
        ),
        body: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(10),
          child: ListView(children: [

            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                color: Colors.indigo,
              ),
               child: ListTile(
                 title: Text('Toro Susanibar, Williams'),
                subtitle: Text('Redes Sociales:'),
                leading: Icon(Icons.stars,size: 30,),
                iconColor: Colors.white,
                textColor: Colors.white,
                ),
              ),
            
             Container(
                margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                color: Colors.blue,
              ),
               child: ListTile(
                title: Text('Rojas de la Cruz, Melanie Emilia'),
                subtitle: Text('Redes Sociales:'),
                 leading: Icon(Icons.stars, size: 30,),
                iconColor: Colors.white,
                textColor: Colors.white,
               ),
             ),

              Container(
                 margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                color: Colors.deepOrange,
              ),
                child: ListTile(title: Text('Saico Yucra, Alexander'),
                 subtitle: Text('Redes Sociales:'),
            leading: Icon(Icons.stars, size: 30,),
              iconColor: Colors.white,
                textColor: Colors.white,
                ),
              ),

              Container(
               margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                color: Colors.green,
              ),
                child: ListTile(title: Text('Valladolid Florindez, Percy'),
                 subtitle: Text('Redes Sociales:'),
            leading: Icon(Icons.stars,size: 30,),
             iconColor: Colors.white,
                textColor: Colors.white,
             ),
              ),
          ],
          ),
        )
      );
    
  }
}