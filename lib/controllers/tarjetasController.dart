import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:swipe_card_app/model/preguntas.dart';
import 'package:swipe_card_app/service/Servicios.dart';
import 'package:swipe_card_app/widgets/opcionesDialog.dart';


class CardGameController extends GetxController {
  final swiperController = AppinioSwiperController();

  final cards = <String>[
    "Cuenta una experiencia graciosa que te sucedio en la escuela",
  ].obs;
  late List<Preguntas>? preguntasList;
  int iPregunta=0;
  Rx<String> idioma = "es".obs;
  
  @override
  void onInit() async {
      super.onInit();
      
  }



  RxList<Widget> cardsList=<Widget>[].obs;

  //var currentIndex = 0.obs;

  void onSwipe(int index, AppinioSwiperDirection direction) {
    //print("Swipe....");

    if(iPregunta<preguntasList!.length){
      iPregunta++;
      cards.add(preguntasList![iPregunta].pregunta!);
      print(preguntasList![iPregunta].pregunta);
    }
    
    

    //currentIndex.value = index + 1;

    // lógica según dirección
    /*if (direction == AppinioSwiperDirection.right) {
      print("Swipe derecha");
    } else if (direction == AppinioSwiperDirection.left) {
      print("Swipe izquierda");
    }*/

  }

  void mostrarOpciones_action(){
      Get.dialog(
        OpcionesDialog(
        onMenu: (){
          //numFicha.value = 0;//resetear el numero de ficha
          //mensajeComicList.clear();//borrar los mensajes
          iPregunta = 0;
          Get.toNamed('/', arguments: {//a la pantalla inicial          
          });
        }, 
        onReintentar:(){
          //posicionar en 0 los jugadores
          iPregunta = 0;
          Get.back();

        },
        onRetornar: (){
          Get.back();
        }

        )
      );
    }
  Future <void> cargarPreguntas(String idioma) async{
    preguntasList = await Servicios.cargarPreguntas("assets/data/preguntas_$idioma.json");
    preguntasList!.shuffle();//desordena la lista    
  }

  void undoSwipe() {
    swiperController.unswipe();
  }
}