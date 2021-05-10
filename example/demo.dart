import 'package:flutter/material.dart';
import 'package:tellme_color_picker/tellme_color_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () => TellMeColorPicker(
                  context: context,
                  colors: [
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.pink,
                    Colors.purple,
                  ],
                  titleAlign: TextAlign.center,
                  colorSize: 15,
                  colorPadding: 5,
                  onSelected: (Color color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                ),
                child: Row(
                  children: [
                    Icon(Icons.label, color: selectedColor),
                    SizedBox(width: 10),
                    Text('Select a color'),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: 200,
                color: selectedColor ?? Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
