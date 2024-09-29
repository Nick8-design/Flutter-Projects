import 'package:color_theme/data/colorsmodel.dart';
import 'package:color_theme/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorTheme extends StatefulWidget {
  const ColorTheme({super.key});

@override
  State<ColorTheme> createState()=>_ColorThemeState();
}


class _ColorThemeState extends State<ColorTheme>{
  //dafault theme
  ThemeMode themeMode = ThemeMode.light;

  //default color
ColorSelection colorSelected = ColorSelection.orange;


  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }
  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context){
    const appTittle = 'Color and Theme';
    return MaterialApp(
        title: appTittle,
        debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner
        themeMode: themeMode,
        theme: ThemeData(

            colorSchemeSeed: colorSelected.color,
            useMaterial3: true,
            brightness: Brightness.light
        ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),


     home: Homepage(changeTheme: changeThemeMode,changeColor: changeColor,colorSelected: colorSelected,),




    );
  }
}