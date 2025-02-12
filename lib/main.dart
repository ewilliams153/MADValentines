import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 121, 238, 156)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MAD Valentines'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _heartbeatController;
  late Animation<double> _animation;
  String _display = 'happyValentines';
  double size = 50;

  @override
  void initState() {
    super.initState();

    _heartbeatController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.5,
    );

    _animation = CurvedAnimation(
      parent: _heartbeatController,
      curve: Curves.ease,
    );

    _heartbeatController.forward();
    _heartbeatController.addStatusListener((status){
      setState ((){
        if (status == AnimationStatus.completed) {
          _heartbeatController.reverse();
        }else if (status == AnimationStatus.dismissed){
          _heartbeatController.forward();
        }
      });
    });

    _heartbeatController.addListener((){
      setState((){
        size = _heartbeatController.value * 250;
      });
    });
    //_heartbeatController.repeat();
   

  @override
  void dispose() {
    _heartbeatController.dispose();
    super.dispose();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Stack(children: <Widget>[
                Center(
                  child: Image.asset('assets/images/happyValentines.png', height: size),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}


