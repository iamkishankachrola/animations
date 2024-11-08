import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  runApp(const AnimationApp());
}
class AnimationApp extends StatelessWidget{
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}
class HomePageState extends State<HomePage>{
  double width = 100;
  double height = 100;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              width = width==300?100:300;
              height = height==300?100:300;
              color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
            });
          },
          child: AnimatedContainer(
            width: width,
            height: height,
            color: color,
            duration: const Duration(seconds: 1),
          ),
        ),
      ),
    );
  }

}