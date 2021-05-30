import 'package:desktop_tutorial_2/screens/cart_screen.dart';
import 'package:desktop_tutorial_2/screens/favourite_screen.dart';
import 'package:desktop_tutorial_2/screens/main_screen.dart';
import 'package:desktop_tutorial_2/screens/notifications.dart';
import 'package:desktop_tutorial_2/screens/user_account_screen.dart';
import 'package:desktop_tutorial_2/widgets/badge.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  var _selectedIndex = 0;

  List<Widget> _screens = [
    MainScreen(),
    FavouriteScreen(),
    CartScreen(),
    UserAccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return Notifications();
                  },
                ),
              );
            },
            tooltip: "Notifications",
          ),
        ],

    ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor:Theme.of(context).backgroundColor,
            selectedIndex: _selectedIndex,
            selectedIconTheme: Theme.of(context).iconTheme,
            selectedLabelTextStyle: TextStyle(color: Theme.of(context).accentColor),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            leading: FloatingActionButton(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("You clicked on search button!")));
              },
            ),
            labelType: NavigationRailLabelType.selected,
            groupAlignment: -1,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border_outlined),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favourite'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(Icons.shopping_cart_rounded),
                label: Text('Cart'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.account_circle_outlined),
                selectedIcon: Icon(Icons.account_circle_rounded),
                label: Text('Account'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: IndexedStack(index: _selectedIndex, children: _screens),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
