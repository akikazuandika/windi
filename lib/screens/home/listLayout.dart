import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pariwisata/styles/layout.dart';

class listLayout extends StatefulWidget {
  final String title;
  final String desc;
  final String img;
  final VoidCallback onPress;
  listLayout({Key key, this.title, this.desc, this.img, this.onPress})
      : super(key: key);

  @override
  listLayoutState createState() => listLayoutState();
}

class listLayoutState extends State<listLayout> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 7, bottom: 7),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: CachedNetworkImage(
                    fit : BoxFit.fitWidth,
                    imageUrl: widget.img,
                    placeholder: (context, url) => Image(
                      image: NetworkImage("https://via.placeholder.com/400"),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.desc,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontWeight: FontWeight.w300),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
      onPressed: widget.onPress,
    );
  }
}
