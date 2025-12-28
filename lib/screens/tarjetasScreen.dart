import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:swipe_card_app/controllers/tarjetasController.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TarjetasScreen extends StatelessWidget {
  final CardGameController cController = Get.put(CardGameController());

  @override
  Widget build(BuildContext context) {
    final screenAnc = MediaQuery.of(context).size.width;
    final screenAlt = MediaQuery.of(context).size.height;

    try {
      final args = Get.arguments as Map<String, dynamic>;
    
    cController.idioma.value = args['idioma']; //entrega de variables enviadas el widget y guardar al controlador
    cController.cargarPreguntas(cController.idioma.value);
    cController.actJugador = 0;//se actualiza con obx de getx
    
    } catch (e) {//puede llegar nulo al screen
      e.printError();
      cController.idioma.value='en';
      cController.cargarPreguntas(cController.idioma.value);
    }

    try {
      cController.jugadoresList=[];
      final args = Get.arguments as Map<String, dynamic>;
      cController.jugadoresList = args['jugadoresList']; //entrega de variables enviadas el widget y guardar al controlador    
    } catch (e) {//puede llegar nulo al screen
      e.printError();
    }

    cController.loadBanner();

    

    return Scaffold(
      
      body: 

       Container(
        width: double.infinity,
        height: double.infinity,
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
        child: 
      Stack(
          children: [
            
            
            Align(
              alignment: Alignment.bottomCenter, // Aligns the child to the top center
              child: SizedBox(
                height: screenAlt*0.9,
                width: screenAnc*0.98,
                child: Obx(() => 
                AppinioSwiper(
                      controller: cController.swiperController,
                      cards:  cController.cards.map((question) {
                        return Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: 
                            Column(
                               mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
                              children: [
                            
                            Image.asset(
                              Get.isDarkMode?
                                'assets/images/challenge_white.png':
                                'assets/images/challenge_dark.png',
                              fit: BoxFit.cover, // Ensures the image covers the area
                              height: screenAlt*0.2,
                            ),

                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Text(
                                question,
                                style: TextStyle(fontSize: 24),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            cController.jugadoresList.length>0?
                            Text(cController.jugadoresList[cController.actJugador],
                            style: TextStyle(fontSize: 15)):
                            Text('')
                              ],
                            )
                            
                          
                        );
                        }).toList(),
                      onSwipe: cController.onSwipe,                
                    )),
              ),


            ),
            Positioned(
            right: 15,
            top: screenAlt*0.120,
            child:
            Opacity(opacity: 0.5,
            child: 
            IconButton(icon: Icon(Icons.pause_circle_outline),
            iconSize: screenAlt*0.05,
            onPressed: (){
              cController.mostrarOpciones_action();
            })
            )
          ),

          Positioned(
            top: 0,
            child: 
             Obx(() =>
             
              !cController.isLoaded.value || cController.bannerAd.value == null
                ? SizedBox(height: screenAlt*0.14)
                :Container(
                alignment: Alignment.center,
                width: screenAnc , //boardController.bannerAd.value!.size.width.toDouble()
                height: cController.bannerAd.value!.size.height.toDouble(),
                child: AdWidget(ad: cController.bannerAd.value!),
                )

          ),
          )

          ]
      )
      )      
      
      
    );
  }
}