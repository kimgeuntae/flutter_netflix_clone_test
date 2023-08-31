import 'package:flutter/material.dart';
import 'dart:ui';

import 'model/movie.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  const DetailScreen({
    required this.movie,
    super.key,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 해당 영화의 찜하기 상태 가져오기
    like = widget.movie.like;
  }

  Widget makeMenuButton() => Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/${widget.movie.poster}'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          makeMenuButton(),
        ],
      )),
    );
  }
}
