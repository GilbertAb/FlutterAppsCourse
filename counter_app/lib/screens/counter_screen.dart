import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 10;

  void increase() {
    counter++;
    setState(() {});
  }

  void equalZero() {
    counter = 0;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);
    // TextStyle fontSize30 = const TextStyle(fontSize: 30); y quitar const de linea 18

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 5.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Número de clicks',
              style: fontSize30,
            ),
            Text(
              '$counter',
              style: fontSize30,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButtons(
        increaseFn: increase,
        zeroFn: equalZero,
        decreaseFn: decrease,
      ),
    );
  }
}

class CustomFloatingButtons extends StatelessWidget {
  final Function increaseFn;
  final Function zeroFn;
  final Function decreaseFn;
  const CustomFloatingButtons({
    Key? key,
    required this.increaseFn,
    required this.zeroFn,
    required this.decreaseFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1_outlined),
          onPressed: () => increaseFn(),
          //onPressed: () => setState(() => counter++),
          /*onPressed: () {
            counter++;
            setState(() {
              //counter++;
            });
          },*/
        ),
        /*const SizedBox(
          width: 20,
        ),*/
        FloatingActionButton(
          child: const Icon(Icons.exposure_zero_outlined),
          onPressed: () => zeroFn(),
          //onPressed: () => setState(() => counter = 0),
        ),
        /*const SizedBox(
          width: 20,
        ),*/
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_outlined),
          onPressed: () => decreaseFn(),
          //onPressed: () => setState(() => counter--),
        ),
      ],
    );
  }
}
