import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:http/http.dart';
import 'package:pariwisata/networks/createData.dart';
import 'package:pariwisata/networks/getdata.dart';
import 'package:pariwisata/screens/addData/layoutAdd.dart';
import 'package:pariwisata/styles/palete.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddData extends StatefulWidget {
  AddData({Key key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

GlobalKey<FormBuilderState> _keyAddItem = GlobalKey<FormBuilderState>();

class _AddDataState extends State<AddData> {
  String token;

  postData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('LastToken');
    });
  }

  @override
  void initState() {
    super.initState();
    postData();
  }

  void onSave(BuildContext context) {
    _keyAddItem.currentState.save();
    if (_keyAddItem.currentState.validate()) {
      postItem(
        context,
        token: token,
        title: _keyAddItem.currentState.value["title"],
        desc: _keyAddItem.currentState.value["description"],
        city: _keyAddItem.currentState.value["city"],
        prov: _keyAddItem.currentState.value["province"],
        photo: _keyAddItem.currentState.value["photo"],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Add Item",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ProgressHUD(
          child: Builder(
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                top: 3,
                bottom: 3,
                right: 10,
                left: 10,
              ),
              child: FormBuilder(
                key: _keyAddItem,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    LayoutAddData(
                      title: "Title",
                      attribute: "title",
                    ),
                    LayoutAddData(
                      maxLines: 5,
                      title: "Description",
                      attribute: "description",
                    ),
                    LayoutAddData(
                      title: "City",
                      attribute: "city",
                    ),
                    LayoutAddData(
                      title: "Province",
                      attribute: "province",
                    ),
                    LayoutAddData(
                      title: "Photo Url",
                      attribute: "photo",
                      maxLines: 2,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 80, right: 80),
                      child: RaisedButton(
                        color: Colors.teal,
                        child: Text(
                          "Add Item",
                          style: TextStyle(
                            color: P.white,
                          ),
                        ),
                        onPressed: () {
                          _keyAddItem.currentState.save();
                          onSave(context);
                          print(_keyAddItem.currentState.value["title"]);
                          print(_keyAddItem.currentState.value["description"]);
                          print(_keyAddItem.currentState.value["province"]);
                          print(_keyAddItem.currentState.value["photo"]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

