import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:returning_home/map.dart';
import 'package:returning_home/message.dart';

class Top extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TopState();
}

class _TopState extends State<Top> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getPage() {
    switch (_selectedIndex) {
      case 0:
        return Map();
      case 1:
        return Message();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Icon(
                SFSymbols.map,
              ),
            ),
            title: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: const Text(
                '帰り道',
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Icon(
                SFSymbols.ellipses_bubble,
              ),
            ),
            title: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: const Text(
                'メッセージ',
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
