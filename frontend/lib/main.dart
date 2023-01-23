
import 'package:flutter_svg/parser.dart';

import 'app.dart';
import 'camera_screen_display.dart';
import 'model/app_state_model.dart';
import 'ingredients.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

CameraDescription camera;
List<String> _ingredients = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  camera = cameras.first;
  final SvgParser parser = SvgParser();
  try {
    parser.parse('assets/icons/chefIcon.svg', warningsAsErrors: true);
    print('SVG is supported');
  } catch (e) {
    print('SVG contains unsupported features');
  }
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (context) => AppStateModel()..loadRecipes(),
      child: CupertinoStoreApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Recipize',
      theme: ThemeData.dark(),
      color: Colors.amber,
      // home: CameraScreenDisplay(camera: camera)
      home: FirstRoute()
    );
  }
}

class FirstRoute extends StatelessWidget {
  // const FirstRoute({super.key});
  const FirstRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 50, 20, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F7F7),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          // child: SvgPicture.asset(
                          //   "assets/icons/menu1.svg",
                          //   height: 26,
                          //   width: 26,
                          // ),
                          child: Icon(Icons.menu, color: Colors.black),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Recipize",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower',
                    fontSize: 30,
                    color: Color(0xFF333333)),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "Make your own ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'Abel',
                              color: Color(0xFF333333))
                      ),
                      TextSpan(
                          text: "meal,\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFf9c920),
                              fontFamily: 'Abel',
                              fontSize: 25)
                      ),
                      TextSpan(
                          text: "with ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'Abel',
                              color: Color(0xFF333333))
                      ),
                      TextSpan(
                          text: "ingredients ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFf9c920),
                              fontFamily: 'Abel',
                              fontSize: 25)
                      ),
                      TextSpan(
                          text: "you have!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'Abel',
                              color: Color(0xFF333333))
                      )
                    ])
                ),
                const SizedBox(
                  height: 130,
                ),
                const Text(
                  "Take a photo of your ingredients or add them manually below:",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      fontFamily: 'Abel',
                      color: Color(0xFF333333)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(height: 70, width: 150),
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.camera, color: Colors.black),
                        // Within the `FirstRoute` widget
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CameraScreenDisplay(camera: camera)),
                          );
                        },
                        label: Text('Camera', style: TextStyle(color: Colors.black, fontFamily: 'Abel'),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          textStyle: TextStyle(fontSize: 18),
                          elevation: 15,
                        ),
                      ),
                    ),
                  //Spacer(), // use Spacer
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(height: 70, width: 150),
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.food_bank, color: Colors.black,),
                        // Within the `FirstRoute` widget
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IngredientsList(ingredients: _ingredients)),
                          );
                        },
                        label: Text('Ingredients',  style: TextStyle(color: Colors.black, fontFamily: 'Abel')),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          textStyle: TextStyle(fontSize: 18),
                          elevation: 15,
                        ),
                      ),
                    )
                  ]
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 154.0,
                      width: 185.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/chefIcon2.png'),
                          fit: BoxFit.fill
                        ),
                      ),
                    )
                  ]
                )
              ]
            )
        )
      ),
    );
  }
}
