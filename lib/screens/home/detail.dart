import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:pariwisata/models/datamodel.dart';
import 'package:pariwisata/networks/deleteData.dart';
import 'package:pariwisata/screens/editData/screen.dart';
import 'package:pariwisata/styles/palete.dart';

class DetailPage extends StatefulWidget {
  final Datum data;
  final String token;
  DetailPage({
    Key key,
    this.data,
    this.token,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Detail Windi App",
            style: TextStyle(
              color: P.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: P.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Edit"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditData(
                            data: widget.data,
                          )),
                );
              },
              color: Colors.white,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.teal,
              child: Text(
                "Delete",
                style: TextStyle(
                  color: P.white,
                ),
              ),
              onPressed: () {
                deleteData(
                    context, widget.token, widget.data.idProduct.toString());
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    offset: new Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(widget.data.photo),
                              fit: BoxFit.fitWidth)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.data.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      widget.data.city + ", " + widget.data.province,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.data.createdAt.toString(),
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      widget.data.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
