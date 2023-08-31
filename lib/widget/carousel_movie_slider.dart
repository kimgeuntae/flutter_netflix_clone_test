import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../model/movie.dart';

class CarouselMovieSlider extends StatefulWidget {
  final List<Movie> movies;

  const CarouselMovieSlider({required this.movies, super.key});

  @override
  State<CarouselMovieSlider> createState() => _CarouselMovieSliderState();
}

class _CarouselMovieSliderState extends State<CarouselMovieSlider> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movies = widget.movies;
    images = movies.map((e) => Image.asset('./images/${e.poster}')).toList();
    keywords = movies.map((e) => e.keyword).toList();
    likes = movies.map((e) => e.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
          ),
          /*
          // 이젠 아래 형식으로 써야함
          CarouselSlider(
            items: images,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords[_currentPage];
              });
            },
          ),
          */
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[_currentPage];
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
