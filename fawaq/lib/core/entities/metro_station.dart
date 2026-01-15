 class MetroStation {
  final String id;
  final String name;
  final String nameArabic;
  final double latitude;
  final double longitude;
  final String lineId;
  final int order;

  const MetroStation({
    required this.id,
    required this.name,
    required this.nameArabic,
    required this.latitude,
    required this.longitude,
    required this.lineId,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nameArabic': nameArabic,
      'latitude': latitude,
      'longitude': longitude,
      'lineId': lineId,
      'order': order,
    };
  }

  factory MetroStation.fromJson(Map<String, dynamic> json) {
    return MetroStation(
      id: json['id'] as String,
      name: json['name'] as String,
      nameArabic: json['nameArabic'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      lineId: json['lineId'] as String,
      order: json['order'] as int,
    );
  }

  double distanceTo(double lat, double lon) {
    const double earthRadius = 6371000;
    
    final double lat1Rad = latitude * (3.141592653589793 / 180);
    final double lat2Rad = lat * (3.141592653589793 / 180);
    final double deltaLat = (lat - latitude) * (3.141592653589793 / 180);
    final double deltaLon = (lon - longitude) * (3.141592653589793 / 180);

    final double a = (deltaLat / 2) * (deltaLat / 2) +
        (lat1Rad).cos() * (lat2Rad).cos() *
        (deltaLon / 2) * (deltaLon / 2);
    
    final double c = 2 * a.sqrt().asin();
    
    return earthRadius * c;
  }
}

class MetroLine {
  final String id;
  final String name;
  final List<MetroStation> stations;

  const MetroLine({
    required this.id,
    required this.name,
    required this.stations,
  });

  MetroStation? findStationById(String stationId) {
    try {
      return stations.firstWhere((s) => s.id == stationId);
    } catch (_) {
      return null;
    }
  }

  MetroStation? findNearestStation(double latitude, double longitude, {double maxDistanceMeters = 500}) {
    if (stations.isEmpty) return null;

    MetroStation? nearest;
    double minDistance = double.infinity;

    for (final station in stations) {
      final distance = station.distanceTo(latitude, longitude);
      if (distance < minDistance && distance <= maxDistanceMeters) {
        minDistance = distance;
        nearest = station;
      }
    }

    return nearest;
  }

  int? calculateStationsRemaining(String currentStationId, String destinationStationId) {
    final current = findStationById(currentStationId);
    final destination = findStationById(destinationStationId);

    if (current == null || destination == null) return null;

    return (destination.order - current.order).abs();
  }
}