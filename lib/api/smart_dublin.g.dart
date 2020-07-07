// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_dublin.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SmartDublinClient implements SmartDublinClient {
  _SmartDublinClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://data.smartdublin.ie/cgi-bin/rtpi/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getStopInformation(stopId) async {
    ArgumentError.checkNotNull(stopId, 'stopId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'stopid': stopId};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/realtimebusinformation?format=xml',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl,
            responseType: ResponseType.plain),
        data: _data);
    final value = Stop.fromJson(_result.data);
    return value;
  }
}
