import 'package:chapter3/restaurant_landscape_card.dart';
import 'package:flutter/material.dart';
import 'models/restaurant.dart';
import 'theme_button.dart';
import 'color_button.dart';
import 'constants.dart';
import 'category_card.dart';
import 'models/food_category.dart';
import 'post_card.dart';
import 'models/post.dart';

class Home extends StatefulWidget{
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,

});
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;



  @override
 State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{



int tab = 0;


List<NavigationDestination> appBarDestinations = const [
  NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Category',
    selectedIcon: Icon(Icons.credit_card),

  ),
  NavigationDestination(
    icon: Icon(Icons.credit_card),
    label: 'Post',
    selectedIcon: Icon(Icons.credit_card),

  ),
  NavigationDestination(
    icon: Icon(Icons.credit_card),
    label: 'Restaurant',
    selectedIcon: Icon(Icons.credit_card),

  ),

];




  @override
  Widget build(BuildContext context){

final pages = [
  Center(
// 2
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
// 3
      child: CategoryCard(category: categories[0]),),),


 Center(
   child: Padding(
     padding: const EdgeInsets.all(16.0),
     child: PostCard(post: posts[2],),
   ),
 ),
  Center(
//2
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
// 3
      child: RestaurantLandscapeCard(
        restaurant: restaurants[2],),),),
];


    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text('Meal App'),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          ThemeButton(changeThemeMode: widget.changeTheme,),
          ColorButton(changeColor: widget.changeColor, colorSelected: widget.colorSelected),
        ],
      ),


      body:IndexedStack(
        index: tab,
        children: pages,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,

        onDestinationSelected: (index){
          setState(() {
            tab =index;
          });
        },
        destinations: appBarDestinations,
      ),

    );
  }



}