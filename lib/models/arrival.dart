import 'dart:convert';

class Arrival {
  final String route;
  final String origin;
  final String destination;
  final String dueTime;

  Arrival({
    this.route,
    this.origin,
    this.destination,
    this.dueTime,
  });

  factory Arrival.fromJson(Map<String, dynamic> jsonMap) {
    final route = jsonMap['route']['\$t'];
    final origin = jsonMap['origin']['\$t'];
    final destination = jsonMap['destination']['\$t'];
    final dueTime = jsonMap['duetime']['\$t'];

    return Arrival(
      route: route,
      origin: origin,
      destination: destination,
      dueTime: dueTime,
    );
  }

  @override
  String toString() {
    return 'Arrival { route: ${route} }';
  }
}
