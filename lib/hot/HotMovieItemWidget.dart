import 'package:flutter/material.dart';
import 'package:movie_flutter/hot/HotMovieData.dart';

class HotMovieItemWidget extends StatefulWidget {
  final HotMovieData hotMovieData;
  HotMovieItemWidget(this.hotMovieData);

  @override
  _HotMovieItemWidgetState createState() => _HotMovieItemWidgetState();
}

class _HotMovieItemWidgetState extends State<HotMovieItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            widget.hotMovieData.images.small,
            width: 80,
            height: 120,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.hotMovieData.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.hotMovieData.rating.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text(
                    '导演: ' + widget.hotMovieData.getDirectors(),
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text(
                    '主演: ' + widget.hotMovieData.getCasts(),
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.hotMovieData.collectCount.toString() + '人看过',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
                OutlinedButton(
                  child: Text(
                    '购票',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.red,
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
