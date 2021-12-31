import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({ Key? key }) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
 
 var myTextStyle = TextStyle(color: Colors.white,fontSize: 30);
 var newTextStyle = TextStyle(color: Colors.black,fontSize: 30);
  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 130),
                  child: Container(
                    child: Text(
                      "TIC TAC TOE",
                      style: myTextStyle,
                    ),
                  ),
                ),
              ),
              
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                         MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  child: Padding(
                    padding: EdgeInsets.only(left: 40,right: 40,bottom: 60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(30),
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'PLAY GAME',
                            style: newTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                  
              
            ],
          ),
        ),
      ),
    );
  }
}