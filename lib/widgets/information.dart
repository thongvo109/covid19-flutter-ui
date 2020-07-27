import 'package:covid19/widgets/constant.dart';
import 'package:covid19/widgets/prevent.dart';
import 'package:covid19/widgets/symptom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
            ),
            SvgPicture.asset(
              'assets/icons/coronadr.svg',
            ),
            Positioned(
              left: 150,
              top: 30,
              right: 10,
              bottom: 0,
              child: Text(
                'Những điều cần biết về Covid-19',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "Triệu chứng",
            style: kTitleTextStyle,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SymptomCard(
                  image: "assets/images/headache.png",
                  title: "Đau đầu",
                  isActive: true,
                ),
                SizedBox(width: 20),
                SymptomCard(
                  image: "assets/images/caugh.png",
                  title: "Ho",
                ),
                SizedBox(width: 20),
                SymptomCard(
                  image: "assets/images/fever.png",
                  title: "Sốt",
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text("Phòng ngừa", style: kTitleTextStyle),
        ),
        PreventCard(
          text: "Thường xuyên rửa tay. Sử dụng xà phòng và nước.",
          image: "assets/images/01.png",
          title: "Rửa tay",
        ),
        PreventCard(
          text: "Luôn mang khẩu trang khi đi bất kì đâu.",
          image: "assets/images/02.png",
          title: "Mang khẩu trang",
        ),
        PreventCard(
          text:
              "Sát khuẩn tay bằng cồn hoặc nước rửa tay khô khi đến các nơi công cộng đông người.",
          image: "assets/images/03.png",
          title: "Rửa tay bằng cồn",
        ),
        PreventCard(
          text:
              "Khi khu vực quanh nhà bạn có người nhiễm bệnh hãy tự cách ly 14 ngày. Hạn chế ra ngoài khi không cần thiết.",
          image: "assets/images/04.png",
          title: "Tự cách 14 ngày",
        ),
        PreventCard(
          text: "Hạn chế các hoạt động giao tiếp xã hội.",
          image: "assets/images/05.png",
          title: "Hạn chế tiếp xúc",
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
