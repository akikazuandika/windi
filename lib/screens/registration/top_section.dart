import 'package:flutter/material.dart';
import 'package:pariwisata/styles/layout.dart';
import 'package:pariwisata/styles/palete.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.vertical * 30,
      width: SizeConfig.horizontal * 100,
      padding: EdgeInsets.only(
        top: SizeConfig.vertical * 5
      ),
      decoration: BoxDecoration(        
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10), 
        bottomRight: Radius.circular(10), 
      ),
     color: Colors.cyan
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
                    
          Container(
            margin: EdgeInsets.only(top: SizeConfig.vertical *4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Buat Akun",
                  style: TextStyle(
                      color: P.white,
                      fontSize: SizeConfig.horizontal * 6),
                ),
                SizedBox(
                  width: SizeConfig.horizontal *1.8,
                ),
                Text(
                  "Windi App",
                  style: TextStyle(
                      color: P.white,
                      fontSize: SizeConfig.horizontal * 6),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
