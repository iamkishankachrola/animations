import 'package:flutter/material.dart';
import 'second_page.dart';
void main(){
  runApp(const HeroFirstApp());
}
class HeroFirstApp extends StatelessWidget{
  const HeroFirstApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeroFirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HeroFirstPage extends StatelessWidget{
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
     appBar: AppBar(title: const Text("First Page"),backgroundColor: Colors.blue,centerTitle: true,),
     body: Padding(
       padding: const EdgeInsets.all(20),
       child: GridView.builder(itemCount: imgList.length,
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
         mainAxisSpacing: 20,
         crossAxisSpacing: 20,
         childAspectRatio: 9/16,
       ),
           itemBuilder:(context, index) {
             return InkWell(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => HeroSecondPage(mIndex: index,),));
                 },
                 child: Hero(
                   tag: "$index",
                     child: Image.asset(imgList[index],fit: BoxFit.cover,)));
           },),
     )
   );
  }

}