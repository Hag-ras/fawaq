class Trip {
  final String id;
  final Destination destination;
  final TripMode mode;
  final TripStatus status;
  final DateTime startTime;
  final int? stationsBeforeAlert;
  final double? distanceBeforeAlertMeters;

  const Trip({
    required this.id,
    required this.destination,
    required this.mode,
    required this.status,
    required this.startTime,
    this.stationsBeforeAlert,
    this.distanceBeforeAlertMeters,
  });

  bool get isMetroMode => mode == TripMode.metro;
  bool get isVehicleMode => mode == TripMode.vehicle;
  bool get isActive => status == TripStatus.active;

  Trip copyWith({
    String? id,
    Destination? destination,
    TripMode? mode,
    TripStatus? status,
    DateTime? startTime,
    int? stationsBeforeAlert,
    double? distanceBeforeAlertMeters,
  }) {
    return Trip(
      id: id ?? this.id,
      destination: destination ?? this.destination,
      mode: mode ?? this.mode,
      status: status ?? this.status,
      startTime: startTime ?? this.startTime,
      stationsBeforeAlert: stationsBeforeAlert ?? this.stationsBeforeAlert,
      distanceBeforeAlertMeters: distanceBeforeAlertMeters ?? this.distanceBeforeAlertMeters,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'destination': destination.toJson(),
      'mode': mode.name,
      'status': status.name,
      'startTime': startTime.toIso8601String(),
      'stationsBeforeAlert': stationsBeforeAlert,
      'distanceBeforeAlertMeters': distanceBeforeAlertMeters,
    };
  }

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'] as String,
      destination: Destination.fromJson(json['destination'] as Map<String, dynamic>),
      mode: TripMode.values.firstWhere((e) => e.name == json['mode']),
      status: TripStatus.values.firstWhere((e) => e.name == json['status']),
      startTime: DateTime.parse(json['startTime'] as String),
      stationsBeforeAlert: json['stationsBeforeAlert'] as int?,
      distanceBeforeAlertMeters: json['distanceBeforeAlertMeters'] as double?,
    );
  }
}

enum TripMode {
  metro,
  vehicle,
}

enum TripStatus {
  active,
  completed,
  cancelled,
}