import 'package:dio/dio.dart';

class DioHelper{
  static Dio ?dio;
 static void init(){
   dio=Dio(
     BaseOptions(
       baseUrl: 'https://newsapi.org/',
       receiveDataWhenStatusError: true
     ),
   );
 }
static Future<Response>? getData(String method,Map<String,dynamic> query){
   return dio?.get(method,queryParameters:query );
}
}