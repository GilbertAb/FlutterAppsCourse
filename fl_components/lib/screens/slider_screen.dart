import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Slider and Checks')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Slider.adaptive(
                min: 50,
                max: 400,
                activeColor: AppTheme.primary,
                value: _sliderValue,
                onChanged: _sliderEnabled
                    ? (value) {
                        _sliderValue = value;
                        setState(() {});
                      }
                    : null,
              ),
              Checkbox(
                value: _sliderEnabled,
                onChanged: (value) {
                  _sliderEnabled = value ?? true;
                  setState(() {});
                },
              ),
              /*CheckboxListTile(
                value: _sliderEnabled,
                activeColor: AppTheme.primary,
                title: const Text('Habilitar Slider'),
                onChanged: (value) {
                  _sliderEnabled = value ?? true;
                  setState(() {});
                },
              ),*/
              /*Switch(
                value: _sliderEnabled,
                onChanged: (value) {
                  _sliderEnabled = value;
                  setState(() {});
                },
              ),*/
              SwitchListTile(
                value: _sliderEnabled,
                activeColor: AppTheme.primary,
                title: const Text('Habilitar Slider'),
                onChanged: (value) {
                  _sliderEnabled = true;
                  setState(() {});
                },
              ),
              Image(
                image: const NetworkImage(
                    'https://logodownload.org/wp-content/uploads/2015/02/burger-king-logo-1-1.png'),
                width: _sliderValue,
              ),
            ],
          ),
        ));
  }
}
