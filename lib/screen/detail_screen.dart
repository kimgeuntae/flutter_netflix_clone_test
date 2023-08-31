import 'package:flutter/material.dart';
import 'dart:ui';

import '../model/movie.dart';

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

  Stack makeTopPanel() {
    return Stack(
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
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          '99% 일치 2019 15+ 시즌 1개',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          widget.movie.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow),
                              Text('재생'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text('영화 설명'),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '출연: 현빈, 손예진, 서지혜\n제작자: 이정효, 박지은',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // 포지션으로 앱바 생성
        Positioned(
          child: AppBar(
            backgroundColor: Colors.transparent, // 투명
            elevation: 0,
          ),
        ),
      ],
    );
  }

  void onTapLike() {
    setState(() {
      like = !like;
    });
  }

  void onTapThumbUp() {
    // 평가 페이지로 이동
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            makeTopPanel(),
            _MiddlePanel(
              likeButton: _LikeButton(
                like: like,
                onTapLike: onTapLike,
              ),
              thumbUpButton: _ThumbUpButton(onTapThumbUp: onTapThumbUp),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiddlePanel extends StatelessWidget {
  final Widget likeButton;
  final Widget thumbUpButton;

  const _MiddlePanel({
    required this.likeButton,
    required this.thumbUpButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          likeButton,
          thumbUpButton,
        ],
      ),
    );
  }
}

class _LikeButton extends StatelessWidget {
  final bool like;
  final VoidCallback onTapLike;

  const _LikeButton({
    required this.like,
    required this.onTapLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: InkWell(
        onTap: onTapLike,
        child: Column(
          children: [
            like ? Icon(Icons.check) : Icon(Icons.add),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThumbUpButton extends StatelessWidget {
  final VoidCallback onTapThumbUp;

  const _ThumbUpButton({
    required this.onTapThumbUp,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: InkWell(
        onTap: onTapThumbUp,
        child: Column(
          children: [
            Icon(Icons.thumb_up),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Text(
              '평가',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
