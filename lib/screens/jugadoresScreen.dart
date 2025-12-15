import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_card_app/controllers/jugadoresController.dart';


class JugadoresScreen extends StatelessWidget {
  final jController = Get.put(JugadoresController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    //jController.cargarJugadores();
    

    return Scaffold(
      body:  Stack(
        children: [
          Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: 
      Stack(
        children: [

      Container(
        constraints: const BoxConstraints(maxHeight: 400), // limite para el scroll
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            

            const SizedBox(height: 12),
            Expanded(
              child:Obx(() =>
                ListView.builder(
                  itemCount: jController.inputsList.length,
                  itemBuilder: (context, index) {
                    //jController.inputsList[index].text = jController.inputsList[index].text.replaceAll('jugador', 'jugador'.tr); //traduccion
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child:
                      Row(
                  children: [
                    Expanded(
                      
                      child:
                       TextField(//inputtext
                        controller: jController.inputsList[index],
                        decoration: InputDecoration(
                          labelText: "jugador".tr + " ${index + 1}",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => jController.eliminarJugador(index), // borrar
                    ),
                    ]
                    ));
                  },
                )
              )
            ),
            ElevatedButton(
                  onPressed: () {
                    jController.agregarJugador();
                  },
                  child: Text("+".tr),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                  onPressed: () {
                    //jController.guardarNombres_action();
                    jController.irmenu_action();
                  },
                  child: Text("aceptar".tr),
            ),
          ],
        ),
      ),    
           Positioned(
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: (){
                jController.irmenu_action();
                                
              }, // o Navigator.pop(context)
            ),
        )
      ]
      )
    )
          ]
          )      
    );
  }

  
}