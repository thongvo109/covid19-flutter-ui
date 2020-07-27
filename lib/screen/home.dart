import 'package:after_layout/after_layout.dart';
import 'package:covid19/api/case_api.dart';
import 'package:covid19/model/case_model.dart';
import 'package:covid19/widgets/case_item.dart';
import 'package:covid19/widgets/information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  CaseModel caseModel;
  RefreshController _refreshController;
  bool _isLoading;
  final Key linkKey = GlobalKey();
  static timestampFormat(int timestamp, {String format = 'HH:mm, dd/MM/yyyy'}) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat(format, 'vi').format(date);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    caseModel = null;
    _isLoading = true;
    _refreshController = RefreshController();
    initializeDateFormatting();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    getDate();
  }

  void getDate() async {
    CaseModel getCaseModel = await CaseApi().getItem();
    if (getCaseModel != null) {
      setState(() {
        _isLoading = false;
        _refreshController.refreshCompleted();
        caseModel = getCaseModel;
      });
    } else {
      _refreshController.refreshFailed();
      setState(() {
        _isLoading = false;
      });
      print('Error Internet');
    }
  }

  Widget showTotalCase() {
    Widget render;
    if (caseModel != null) {
      String lastTime =
          '${timestampFormat(DateTime.parse(caseModel.lastUpdate).millisecondsSinceEpoch)}';
      render = SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CaseItem(
              lastTime: lastTime,
              begin: caseModel.confirmed.value.toDouble(),
              end: caseModel.confirmed.value.toDouble(),
              type: 'Số ca dương tính',
              colorBorder: Color(0xFFedc16a),
            ),
            CaseItem(
              lastTime: lastTime,
              begin: caseModel.recovered.value.toDouble(),
              end: caseModel.recovered.value.toDouble(),
              type: 'Số ca hồi phục',
              colorBorder: Color(0xFFA6FE9B),
            ),
            CaseItem(
              lastTime: lastTime,
              begin: caseModel.deaths.value.toDouble(),
              end: caseModel.deaths.value.toDouble(),
              type: 'Số ca tử vong',
              colorBorder: Color(0xFFFC938D),
            ),
            Information(),
          ],
        ),
      );
    } else {
      render = Column(
        children: <Widget>[
          Text('Có lỗi xảy ra vui lòng thử lại'),
        ],
      );
    }

    return render;
  }

  void _onRefresh() {
    setState(() {
      _isLoading = true;
      _refreshController.resetNoData();
    });
    getDate();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF504e71),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.black38,
        title: Text(
          'Số ca nhiễm Covid-19 trên thế giới',
          style: TextStyle(color: Color(0xFFb1b0c0)),
        ),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: getDate,
        header: WaterDropMaterialHeader(
          backgroundColor: Color(0xFF2b2944),
        ),
        child: _isLoading ? Container() : showTotalCase(),
      ),
    );
  }
}
