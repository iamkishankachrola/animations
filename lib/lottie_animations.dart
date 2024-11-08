import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

}
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  AnimationController? mController;
  @override
  void initState() {
    super.initState();
    mController = AnimationController(vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/travel_animations.json",width: 300,height: 300,
            controller: mController,
            onLoaded: (lottie) {
                mController!.duration = lottie.duration;
            },),
            ElevatedButton(onPressed: () => mController!.repeat(reverse: true), child: const Text("Start")),
          ],
        ),
      ),
    );
  }
}