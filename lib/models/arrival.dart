import 'dart:convert';

class Arrival {
  final String route;

  Arrival({
    this.route,
  });

  factory Arrival.fromJson(Map<String, dynamic> jsonMap) {
    final route = jsonMap['route'];

    return Arrival(
      route: route,
    );
  }

  @override
  String toString() {
    return 'Arrival { route: ${route} }';
  }
}
