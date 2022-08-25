import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDesktop() {
    if (MediaQuery.of(context).size.width >= 640) {
      return true;
    } else {
      return false;
    }
  }

  List<Widget> _screens = [
    Container(
      color: Colors.red,
      child: Center(child: Text('home')),
    ),
    Container(
      color: Colors.blue.shade600,
      child: Center(child: Text('second screen')),
    ),
    Container(
      color: Colors.pink.shade900,
      child: Center(child: Text('3th screen')),
    ),
    Container(
      color: Colors.yellow.shade900,
      child: Center(child: Text('4th screen')),
    ),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: !isDesktop()
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.indigoAccent,
              onTap: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.feed),
                  label: 'feed',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'settings',
                ),
              ],
            )
          : null,
      body: Row(
        children: [
          Visibility(
            visible: isDesktop(),
            child: NavigationRail(
              backgroundColor: Colors.blueGrey.shade900,
              onDestinationSelected: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.feed),
                  label: Text('feed'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('favorite'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('settings'),
                ),
              ],
              selectedIndex: _selectedIndex,
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: TextStyle(
                color: Colors.white,
              ),
            
              
              leading: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: Icon(
                      Icons.person,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
