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
          getBottomTab(Icons.home, '홈'),
          getBottomTab(Icons.search, '검색'),
          getBottomTab(Icons.save_alt, '저장한 컨텐츠 목록'),
          getBottomTab(Icons.list, '더보기'),
        ],
      ),
    );
  }

  Tab getBottomTab(IconData icon, String title) {
    return Tab(
      icon: Icon(
        icon,
        size: 18,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 9,
        ),
      ),
    );
  }
}
