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
                // 이미지 뒷 배경 불투명
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black.withOpacity(0.1),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                              child: Image.asset(
                                'images/${widget.movie.poster}',
                                height: 300,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          makeMenuButton(),
        ],
      )),
    );
  }
}
