import 'package:retrofit_xml_sample_app/utils/main.dart';
import 'package:retrofit_xml_sample_app/models/stop.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'smart_dublin.g.dart';

@RestApi(baseUrl: "https://data.smartdublin.ie/cgi-bin/rtpi/")
abstract class SmartDublinClient {
  factory SmartDublinClient(Dio dio, {String baseUrl}) {
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (Response response) async {
        response.data = Utils.decodeXmlResponseIntoJson(response.data);
        return response; // continue
      },
    ));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return _SmartDublinClient(dio, baseUrl: baseUrl);
  }

  @GET("/realtimebusinformation?format=xml")
  @DioResponseType(ResponseType.plain)
  Future<Stop> getStopInformation(@Query("stopid") String stopId);
}
