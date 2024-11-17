import 'package:dio/dio.dart';

import '../models/radio.dart';

class ApiManager{
  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://mp3quran.net"
  ));
  Future<RadioModel> getRadio()async{
    var response = await dio.get("/api/v3/radios", queryParameters: {"language" : "ar"});
    print("Response :${response.data}");
    return RadioModel.fromJson(response.data);
  }
}