import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(image: AssetImage('assets/lands.jpg')),
          const Title(),
          const ButtonSection(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: const Text(
              'Officia laboris incididunt eiusmod anim cupidatat aute ad Lorem velit enim. Minim proident cillum nulla nisi veniam quis consequat sunt exercitation nulla. Eu enim eu tempor id. Fugiat sit voluptate aliqua minim quis in irure ex sint reprehenderit irure pariatur. Aliquip nulla elit ad minim proident officia nostrud id in reprehenderit. Excepteur exercitation aliqua deserunt reprehenderit ex aliquip reprehenderit reprehenderit.Adipisicing sit voluptate veniam incididunt incididunt amet fugiat eu. Aliquip laboris cillum quis sint qui ea aute exercitation ad nulla enim deserunt. Laboris ex exercitation excepteur do irure excepteur ad enim. Qui consectetur occaecat commodo veniam.',
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.red),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BlueButton(
            icon: Icons.phone,
            text: 'PHONE',
          ),
          Expanded(child: Container()),
          const BlueButton(
            icon: Icons.directions,
            text: 'ROUTE',
          ),
          Expanded(child: Container()),
          const BlueButton(
            icon: Icons.share,
            text: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class BlueButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const BlueButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
        ),
        Text(text, style: const TextStyle(color: Colors.blue))
      ],
    );
  }
}
