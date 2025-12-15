import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:swipe_card_app/controllers/categoriasController.dart';
import 'package:swipe_card_app/controllers/menuGameController.dart';
import 'package:swipe_card_app/widgets/selectorOpciones.dart';

class CategoriasScreen extends StatelessWidget {
  final categoriasController = Get.put(CategoriasController(),permanent: true);

  @override
  Widget build(BuildContext context) {    
    
    return Scaffold(
      
      body:  
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: 
            Get.isDarkMode?
            [
              Color.fromARGB(255, 73, 73, 73),
              Color.fromARGB(255, 0, 0, 0),
            ]:
            [
              Color(0xFF36d2f0),
              Color(0xFF23f3d5),
              Color(0xFF8ca8f4),
              Color(0xFFd064fe),
              Color(0xFF8f42ff),
            ],
          ),
        ),
        child: Stack(
            children: [              
              Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: 
              //Column(children: [
              
              Stack(
                children: [
                  
              Container(
                
                padding: const EdgeInsets.all(5),
                child: 
                
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Text("Selecciona una categoria".tr,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          ),),
                    const SizedBox(height: 5),
                    Obx(() => SizedBox(
                        height: 250,
                        child: ListView.builder(
                        itemCount: categoriasController.opciones.length,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = categoriasController.opciones[index];

                          return Obx(() => Container(
                                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: categoriasController.seleccionado.value == index
                                      ? Colors.blue.withOpacity(0.15)
                                      : Colors.transparent,
                                ),
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      item.imagen, // imagen a la izquierda
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(item.titulo),
                                  onTap: () {
                                    categoriasController.seleccionado.value = index; // selección visual
                                    item.accion(); // acción directa
                                  },
                                )
                              ));
                        },
                      )),
                    ),

                    
                    Text("Jugadores".tr,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          ),),
                    const SizedBox(height: 5),
                    SelectorOpciones(
                      opciones: [( 2,'2 '+'jugadores'.tr),
                                  ( 3,'3 '+'jugadores'.tr),
                                  ( 4,'4 '+'jugadores'.tr),],
                      onSeleccion: (valor) {
                        categoriasController.numJugadores.value = valor;
                      },
                      opcionInicial: 2,
                    ),
                    const SizedBox(height: 5),
                                ElevatedButton(
                                      onPressed: () {
                                        //categoriasController.irboardscreen_action();
                                      },
                                      child: Text('jugar'.tr),
                                ),
                  ],
                ),
              ),      
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: (){                
                        Get.toNamed('/', arguments: {//a la pantalla inicial      
                        });                
                      }, // o Navigator.pop(context)
                    ),
                ),
                
                
                
              ]
              )
              //],)

            )
              ]
              ),
      )
            
    );
  }
}