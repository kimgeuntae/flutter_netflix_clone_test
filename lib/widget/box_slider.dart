import 'package:flutter/material.dart';

import '../model/movie.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;

  const BoxSlider({
    required this.movies,
    super.key,
  });

  List<Widget> makeBoxImages(List<Movie> movies) {
    List<Widget> result = [];

    for (int i = 0; i < movies.length; i++) {
      result.add(
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('images/${movies[i].poster}'),
            ),
          ),
        ),
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('지금 뜨는 콘텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(movies),
            ),
          ),
        ],
      ),
    );
  }
}
