import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseItem extends StatelessWidget {
  final String lastTime;
  final String type;
  final double begin;
  final double end;
  final Color colorBorder;

//  0xFFe19806
  CaseItem({this.lastTime, this.type, this.begin, this.end, this.colorBorder});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        color: Color(0xFF312e4e),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        type,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFc5c4d0)),
                      ),
                      Text(
                        "Cập nhật lúc $lastTime",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF504e71),
                        border: Border.all(
                          width: 10,
                          color: colorBorder,
                        ),
                      ),
                      width: 120,
                      height: 120,
                      child: Center(
                        child: Countup(
                          textAlign: TextAlign.center,
                          begin: begin / 9,
                          end: end,
                          duration: Duration(seconds: 2),
                          separator: ',',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFc5c4d0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: colorBorder,
                borderRadius: BorderRadius.circular(15),
              ),
              width: MediaQuery.of(context).size.width,
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
