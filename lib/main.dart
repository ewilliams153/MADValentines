import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Valentine\'s Day'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
<<<<<<<<< Temporary merge branch 1
=========

>>>>>>>>> Temporary merge branch 2
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _heartbeatController;
  late Animation<double> _animation;
  int _time = 10;
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

  // Use this to start the timer
  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_time > 0) {
        setState(() {
          _time--;
        });
      } else {
        timer.cancel();
      }
>>>>>>>>> Temporary merge branch 2
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/flower_petals.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Happy Valentine\'s Day!',
                style: TextStyle(fontSize: 30),
              ),
                Center(
              child: Stack(children: <Widget>[
                Center(
                  child: Image.asset('assets/images/happyValentines.png', height: size),
                ),
              ]),
              const SizedBox(height: 20),
              AnimationTimer(time: _time),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Temporary way to trigger timer
        onPressed: _startTimer,
        tooltip: 'Start Timer',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AnimationTimer extends StatelessWidget {
  final int time;

  const AnimationTimer({super.key, required this.time});

 @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 155, 155),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueGrey, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Countdown Timer',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '$time',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
>>>>>>>>> Temporary merge branch 2
