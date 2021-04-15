import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_flutter/hot/HotMovieData.dart';
import 'package:movie_flutter/hot/HotMovieItemWidget.dart';
import 'package:http/http.dart' as http;

class HotMoviesWidget extends StatefulWidget {
  String curCity;

  HotMoviesWidget(String city) {
    curCity = city;
  }
  @override
  _HotMoviesWidgetState createState() => _HotMoviesWidgetState();
}

class _HotMoviesWidgetState extends State<HotMoviesWidget>
    with AutomaticKeepAliveClientMixin {
  List<HotMovieData> hotMovies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData();
  }

  void _getData() async {
    List<HotMovieData> serverDataList = [];
    var response = await http.get(Uri.parse(
        'http://localhost:4500/https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=' +
            widget.curCity +
            '&start=0&count=10'));
    print(response);
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      if (responseJson['subhects'] != null) {
        for (var data in responseJson['subhects']) {
          HotMovieData hotMovieData = HotMovieData.fromJson(data);
          serverDataList.add(hotMovieData);
        }
      }
      setState(() {
        hotMovies = serverDataList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hotMovies == null || hotMovies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
          itemCount: hotMovies.length,
          itemBuilder: (context, index) {
            return HotMovieItemWidget(hotMovies[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              color: Colors.black26,
            );
          },
        ),
      );
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; //返回 true，表示不会被回收
}
