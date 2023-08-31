import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone_test/widget/box_slider.dart';

import 'model/movie.dart';
import 'widget/carousel_movie_slider.dart';
import 'widget/circle_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '꽃다발 같은 사랑을 했다',
      'keyword': '사랑/로맨스',
      'poster': 'test_movie_2.png',
      'like': true,
    }),
    Movie.fromMap({
      'title': '마약왕',
      'keyword': '범죄/스릴러',
      'poster': 'test_movie_3.png',
      'like': true,
    }),
    Movie.fromMap({
      'title': '트루먼쇼',
      'keyword': '가족/로맨스/판타지',
      'poster': 'test_movie_4.png',
      'like': true,
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            // 적용 순서대로 아래로 깔림.
            CarouselMovieSlider(movies: movies),
            _TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          getTobBarContent('TV 프로그램'),
          getTobBarContent('영화'),
          getTobBarContent('내가 찜한 콘텐츠'),
        ],
      ),
    );
  }

  Container getTobBarContent(String title) => Container(
        padding: EdgeInsets.only(right: 1),
        child: Text(title, style: TextStyle(fontSize: 14)),
      );
}
