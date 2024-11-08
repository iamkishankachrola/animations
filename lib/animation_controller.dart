import 'package:flutter/material.dart';

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
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? mController,m2Controller;
  Animation<double>? shapeAnimation;
  Animation<double>? radiusAnimation;
  Animation<Color?>? colorAnimation;
  Animation<Size?>? sizeAnimation;
  Animation<double>? paddingAnimation;

  @override
  void initState() {
    super.initState();
    mController = AnimationController(vsync: this,duration: const Duration(milliseconds: 1000));
    m2Controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 4000))
      ..addListener(() {

      },)..addStatusListener((status) {
        if(status==AnimationStatus.completed){
          mController!.forward();
        }
      },);
    shapeAnimation = Tween<double>(begin: 100.0,end: 200.0).animate(CurvedAnimation(parent: m2Controller!, curve: Curves.bounceOut));
    radiusAnimation = Tween<double>(begin: 5,end: 30).animate(mController!);
    colorAnimation = ColorTween(begin: Colors.blue,end: Colors.orange).animate(mController!);
    paddingAnimation = Tween<double>(begin: 5.0,end: 50.0).animate(mController!);
    sizeAnimation = SizeTween(begin: const Size(100, 200),end: const Size(200, 100)).animate(mController!);
    mController!.addListener(() {

    },);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: m2Controller!,
              builder: (context,child) {
                return Container(
                  width: shapeAnimation!.value,
                  height: shapeAnimation!.value,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radiusAnimation!.value),
                    color: colorAnimation!.value,
                  ),
                );
              }
            ),
            ElevatedButton(onPressed: (){
              m2Controller!.forward(
              );
            }, child: const Text("Start!")),
            ElevatedButton(onPressed: (){
              mController!.stop();
            }, child: const Text("Stop!!"))
          ],
        ),
      ),
    );
  }
}