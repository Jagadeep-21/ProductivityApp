import 'package:draggable_home/draggable_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:mlproject/constants/Container_card.dart';
import 'package:mlproject/constants/colors.dart';

import 'Screens/ImageLabelling.dart';
import 'Screens/SearchEngine.dart';
import 'Screens/TextRecognition.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Culers.black),
    home: Homepage(),
  ));
}
class Homepage extends StatelessWidget {
   Homepage({Key? key}) : super(key: key);

  List actions=['Text recognition','Image Labelling','Search'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: DraggableHome(
        title: Text(
          'ML Prject',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        headerWidget: AppBar(
          title: Text("ML Prooject"),
        ),
        body: [
          Container(
            decoration: BoxDecoration(color: Culers.yellow),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, i) => cont(
                    colour: Culers.light_black,
                    height: 200.0,
                    width: 100.0,
                    border_radius: 10.0,
                    padding_whole: 15.0,
                    margin_value: 10.0,
                    text: " card -$i",
                  ))
        ],
        drawer: Drawer(
            child: Column(
          children: [
            Container(
                color: Colors.amber,
                height: 270,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80.0),
                      height: 100,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                    ),
                    SizedBox(height: 20,),
                    Text("Username",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                    SizedBox(height: 15,),
                    Text("Email@gmail.com",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18))
                  ],
                )),
            ListView.builder(
              shrinkWrap: true,
                itemCount: actions.length,
                itemBuilder: (context, i) => Card(child: ListTile(
                  title: Text("${actions[i]}"),onTap: (){
                    switch(actions[i]){
                      case "Text recognition":
                        Get.to(Textrecognition( text: actions[i]));
                        break;
                      case "Image Labelling":
                        Get.to(Imagelabelling());
                        break;
                      case "Search":
                        Get.to(SearchEngine());
                        break;

                    }
                },),
                    )),
          ],
        )),
        fullyStretchable: true,
        stretchMaxHeight: 0.90,
        expandedBody: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Culers.black,
            ),
            Container(
              height: 100,
              width: 100,
              color: Culers.green,
            )
          ],
        ),
      ),
    );
  }
}
