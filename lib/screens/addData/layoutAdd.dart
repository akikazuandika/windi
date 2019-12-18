import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LayoutAddData extends StatefulWidget {
  final String attribute, title;
  final int maxLines;

  LayoutAddData({Key key, this.attribute, this.title, this.maxLines}) : super(key: key);

  @override
  _LayoutAddDataState createState() => _LayoutAddDataState();
}

class _LayoutAddDataState extends State<LayoutAddData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title, style: TextStyle(fontWeight: FontWeight.normal),),
          SizedBox(
            height: 5,
          ),
          FormBuilderTextField(
            maxLines: widget.maxLines ?? 1,
            keyboardType: TextInputType.text,
            cursorColor: Colors.blue,
            attribute: widget.attribute,
            decoration: InputDecoration(
              contentPadding: new EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              // labelText: "Anda Harus Mengisi Form Ini"
            ),
            validators: [
              FormBuilderValidators.required(
                  errorText: "Anda Harus Mengisi Form Ini"),
            ],
          ),
          SizedBox(height: 17,)
        ],
      ),
    );
  }
}
