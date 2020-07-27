import 'package:covid19/model/case_model.dart';
import 'package:dio/dio.dart';

class CaseApi {
  Dio dio = Dio();

  final String _api = 'https://covid19.mathdro.id/api';

  Future<CaseModel> getItem() async {
    try {
      Response response = await dio.get(_api);
      return CaseModel.fromJson(response.data);
    } catch (error) {
      print(error);
    }
  }
}
