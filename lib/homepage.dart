
import 'package:color_theme/theme_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_button.dart';
import 'data/colorsmodel.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,

  });

  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;

  @override
  State<Homepage> createState()=>_HomeState();


}
class _HomeState extends State<Homepage>{

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
   //     title: Text('Meal App'),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          ThemeButton(changeThemeMode: widget.changeTheme,),
          ColorButton(changeColor: widget.changeColor, colorSelected: widget.colorSelected),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('The app is demostrating how to change color and themes of an app'),
      ),
    );
  }
}