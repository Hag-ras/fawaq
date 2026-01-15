import 'metro_station.dart';

class Destination {
  final String id;
  final String name;
  final double? latitude;
  final double? longitude;
  final DestinationType type;
  final MetroStation? metroStation;

  const Destination({
    required this.id,
    required this.name,
    required this.type,
    this.latitude,
    this.longitude,
    this.metroStation,
  });

  bool get isMetroStation => type == DestinationType.metroStation;
  bool get isGpsLocation => type == DestinationType.gpsLocation;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'type': type.name,
      'metroStation': metroStation?.toJson(),
    };
  }

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      type: DestinationType.values.firstWhere(
        (e) => e.name == json['type'],
      ),
      metroStation: json['metroStation'] != null
          ? MetroStation.fromJson(json['metroStation'] as Map<String, dynamic>)
          : null,
    );
  }

  factory Destination.fromMetroStation(MetroStation station) {
    return Destination(
      id: station.id,
      name: station.name,
      type: DestinationType.metroStation,
      latitude: station.latitude,
      longitude: station.longitude,
      metroStation: station,
    );
  }

  factory Destination.gpsLocation({
    required String id,
    required String name,
    required double latitude,
    required double longitude,
  }) {
    return Destination(
      id: id,
      name: name,
      latitude: latitude,
      longitude: longitude,
      type: DestinationType.gpsLocation,
    );
  }
}

enum DestinationType {
  metroStation,
  gpsLocation,
}