import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
   int _inDex = 0;
  // static const List<Widget> _myBottombar = [
  //   Text(""),
  //   Text(""),
  //   Text(""),
  //   Text(""),
  // ];

  void _onTappe(int index) {
    setState(() {
      _inDex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey[600],
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.access_time_outlined,
                color: Colors.grey[600],
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline_rounded,
                color: Colors.grey[600],
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.grey[600],
              ),
              label: ""),
        ],
        selectedIconTheme: const IconThemeData(color: Colors.deepOrangeAccent),
        // type: BottomNavigationBarType.shifting,
        currentIndex: _inDex,
        onTap: _onTappe,
      );
  }
}