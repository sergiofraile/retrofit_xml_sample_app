import 'package:retrofit_xml_sample_app/models/arrival.dart';

class Stop {
  final List<Arrival> arrivals;
  final String stopId;

  Stop({
    this.arrivals = const [],
    this.stopId,
  });

  factory Stop.fromJson(Map<String, dynamic> jsonMap) {
    final stopId = jsonMap['realtimeinformation']['stopid']['\$t'];
    final List<Arrival> arrivalsList = [];
    final results = jsonMap['realtimeinformation']['results']['result'];

    if (results != null) {
      for (var result in results) {
        arrivalsList.add(Arrival.fromJson(result));
      }
    }

    return Stop(
      arrivals: arrivalsList,
      stopId: stopId,
    );
  }

  @override
  String toString() {
    return 'Stop { stopId: $stopId, arrivals: ${arrivals.length} }';
  }
}
