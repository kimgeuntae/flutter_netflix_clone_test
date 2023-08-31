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

  void likeButtonPressed() {
    setState(() {
      likes[_currentPage] = !likes[_currentPage];
    });
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
          // 포스터 슬라이더
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
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 내가 찜한 콘텐츠
                _LikesContents(
                  like: likes[_currentPage],
                  onPressed: likeButtonPressed,
                ),
                // 재생 버튼
                _PlayButton(),
                // 정보
                _Info(),
              ],
            ),
          ),
          _PostIndexIndicator(likes: likes, currentPageindex: _currentPage),
        ],
      ),
    );
  }
}

class _LikesContents extends StatelessWidget {
  bool like;
  final VoidCallback onPressed;

  _LikesContents({required this.like, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        like
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.check),
              )
            : IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.add),
              ),
        Text(
          '내가 찜한 콘텐츠',
          style: TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              Icons.play_arrow,
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.all(3),
            ),
            Text(
              '재생',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info),
          ),
          Text(
            '정보',
            style: TextStyle(
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _PostIndexIndicator extends StatelessWidget {
  final List<bool> likes;
  final int currentPageindex;

  const _PostIndexIndicator({
    required this.likes,
    required this.currentPageindex,
    super.key,
  });

  List<Widget> getPosterIndicator(List list, int pageIndex) {
    List<Widget> results = [];

    for (int i = 0; i < list.length; i++) {
      results.add(
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: pageIndex == i ? Colors.white : Colors.grey,
          ),
        ),
      );
    }

    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: getPosterIndicator(likes, currentPageindex),
    );
  }
}
