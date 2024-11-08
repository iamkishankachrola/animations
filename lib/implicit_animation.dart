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
  double mOpacity = 1;
  double mPadding=0;
  bool sawFirstChild = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          setState(() {
            mPadding +=10;

          });
        },
        child: Center(
          child: AnimatedPadding(
            padding: EdgeInsets.all(mPadding) ,
            duration: const Duration(milliseconds: 600),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue,
            ),

          ),
        ),
      )


    );

  }

}