class CaseModel {
  ValueModel confirmed;
  ValueModel recovered;
  ValueModel deaths;
  String lastUpdate;
  CaseModel({this.confirmed, this.deaths, this.recovered, this.lastUpdate});

  CaseModel.fromJson(Map<String, dynamic> json)
      : confirmed = ValueModel.fromJson(json['confirmed']),
        recovered = ValueModel.fromJson(json['recovered']),
        deaths = ValueModel.fromJson(json['deaths']),
        lastUpdate = json['lastUpdate'];
}

class ValueModel {
  int value;
  ValueModel({this.value});
  ValueModel.fromJson(Map<String, dynamic> json) : value = json['value'];
}
