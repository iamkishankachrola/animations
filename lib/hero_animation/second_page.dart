import 'package:flutter/material.dart';

class HeroSecondPage extends StatelessWidget{
  int mIndex;
  HeroSecondPage({super.key, required this.mIndex});
  List<String> imgList = [
    "assets/images/cars.jpg",
    "assets/images/cities.jpg",
    "assets/images/galaxy.jpg",
    "assets/images/highway.jpg",
    "assets/images/nature3.jpg",
    "assets/images/nature5.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page"),backgroundColor: Colors.blue,centerTitle: true,),
      body:  Hero(
        tag: "$mIndex",
          child: Image.asset(imgList[mIndex],width: double.infinity,height: double.infinity,)));

  }

}