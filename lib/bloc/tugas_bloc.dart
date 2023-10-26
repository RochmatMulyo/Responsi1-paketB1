 import 'dart:convert';
 import 'package:responsi1/helpers/api.dart';
 import 'package:responsi1/helpers/api_url.dart';
 import 'package:responsi1/model/tugas.dart';

 class TugasBloc {
  static Future<List<Tugas>> getTugass() async {
    String apiUrl = ApiUrl.ListTugas;
      var response = await Api().get(apiUrl);
      var jsonObj = json.decode(response.body);
      List<dynamic> listTugas = (jsonObj as Map<String, dynamic>)['result'];
      List<Tugas> tugass = [];
        for (int i = 0; i < listTugas.length; i++) {
          tugass.add(Tugas.fromJson(listTugas[i]));
        }
    return tugass;
  }
 
 static Future addTugas({Tugas? tugas}) async {
  String apiUrl = ApiUrl.createTugas;

  var body = {
    "title": tugas!.judul,
    "description": tugas.deskripsi,
    "deadline": tugas.deadline
  };

  var response = await Api().post(apiUrl, body);
  var jsonObj = json.decode(response.body);
  print (jsonObj);
    return (jsonObj['message']=='Assignment updated') ? true : false;
 }



 static Future<bool> deleteTugas({int? id}) async {
  String apiUrl = ApiUrl.deleteTugas(id!);
  var response = await Api().post(apiUrl, '');
  var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['result'];
  }
 }