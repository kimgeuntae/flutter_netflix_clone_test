import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: TabBar(
        labelColor: Colors.white60,
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(
            icon: Icon(
              Icons.home,
              size: 18,
            ),
            child: Text(
              '홈',
              style: TextStyle(
                fontSize: 9,
              ),
            ),
          )
        ],
      ),
    );
  }
}
