import 'package:flutter/material.dart';

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _selectIndex = 0;
  static const List<Widget> _widgetoption = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Message',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  void _onTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        backgroundColor: const Color.fromARGB(255, 234, 232, 232),
      ),
      body: Center(
        child: _widgetoption.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: "Home",
              backgroundColor: Colors.purple[200]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.message),
              label: "Message",
              backgroundColor: Colors.blue[300]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: "Seach",
              backgroundColor: Colors.red[300])
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectIndex,
        selectedItemColor: Colors.white,
        onTap: _onTapped,
      ),
    );
  }
}
