import 'package:flutter/material.dart';
import 'package:pariwisata/models/datamodel.dart';
import 'package:pariwisata/networks/getdata.dart';
import 'package:pariwisata/networks/logout.dart';
import 'package:pariwisata/screens/addData/screen.dart';
import 'package:pariwisata/screens/home/detail.dart';
import 'package:pariwisata/screens/home/listLayout.dart';
import 'package:pariwisata/styles/alert.dart';
import 'package:pariwisata/styles/palete.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<DataModel> post;

  String token;

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('LastToken');
      post = getPost(
        token: token,
      );
    });
  }

  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Windi App",
          style: TextStyle(
            color: P.white,
          ),
        ),
      
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showAlertExit(context, ok: () {
                logoutUser(context);
              });
            },
            icon: Icon(
              Icons.exit_to_app,
              color: P.white,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: (Icon(
            Icons.add,
            color: Colors.white,
          )),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddData()),
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(4),
        child: FutureBuilder<DataModel>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.data.isNotEmpty) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return listLayout(
                          title: snapshot.data.data[index].title,
                          desc: snapshot.data.data[index].description,
                          img: snapshot.data.data[index].photo,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        data: snapshot.data.data[index],
                                        token: token,
                                      )),
                            );
                          },
                        );
                      });
                } else {}
              } else if (snapshot.hasError) {
                showErrorAlert(context, "Gagal memuat Data",
                    "Mohon Jalankan Ulang aplikasi");
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
