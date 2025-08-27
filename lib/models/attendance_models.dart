class AttendanceRecord {
  final String id;
  final String studentId;
  final DateTime date;
  final DateTime? checkInTime;
  final DateTime? checkOutTime;
  final bool attendedAllClasses;
  final String? notes;

  AttendanceRecord({
    required this.id,
    required this.studentId,
    required this.date,
    this.checkInTime,
    this.checkOutTime,
    this.attendedAllClasses = false,
    this.notes,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) {
    return AttendanceRecord(
      id: json['id'],
      studentId: json['studentId'],
      date: DateTime.parse(json['date']),
      checkInTime: json['checkInTime'] != null 
          ? DateTime.parse(json['checkInTime']) 
          : null,
      checkOutTime: json['checkOutTime'] != null 
          ? DateTime.parse(json['checkOutTime']) 
          : null,
      attendedAllClasses: json['attendedAllClasses'] ?? false,
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'date': date.toIso8601String(),
      'checkInTime': checkInTime?.toIso8601String(),
      'checkOutTime': checkOutTime?.toIso8601String(),
      'attendedAllClasses': attendedAllClasses,
      'notes': notes,
    };
  }

  AttendanceRecord copyWith({
    String? id,
    String? studentId,
    DateTime? date,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    bool? attendedAllClasses,
    String? notes,
  }) {
    return AttendanceRecord(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      date: date ?? this.date,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      attendedAllClasses: attendedAllClasses ?? this.attendedAllClasses,
      notes: notes ?? this.notes,
    );
  }
}

class AttendanceStatus {
  final bool isCheckedIn;
  final bool isCheckedOut;
  final bool isDisabled;
  final DateTime? lastCheckInTime;
  final DateTime? lastCheckOutTime;

  AttendanceStatus({
    this.isCheckedIn = false,
    this.isCheckedOut = false,
    this.isDisabled = false,
    this.lastCheckInTime,
    this.lastCheckOutTime,
  });

  factory AttendanceStatus.fromJson(Map<String, dynamic> json) {
    return AttendanceStatus(
      isCheckedIn: json['isCheckedIn'] ?? false,
      isCheckedOut: json['isCheckedOut'] ?? false,
      isDisabled: json['isDisabled'] ?? false,
      lastCheckInTime: json['lastCheckInTime'] != null 
          ? DateTime.parse(json['lastCheckInTime']) 
          : null,
      lastCheckOutTime: json['lastCheckOutTime'] != null 
          ? DateTime.parse(json['lastCheckOutTime']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isCheckedIn': isCheckedIn,
      'isCheckedOut': isCheckedOut,
      'isDisabled': isDisabled,
      'lastCheckInTime': lastCheckInTime?.toIso8601String(),
      'lastCheckOutTime': lastCheckOutTime?.toIso8601String(),
    };
  }

  AttendanceStatus copyWith({
    bool? isCheckedIn,
    bool? isCheckedOut,
    bool? isDisabled,
    DateTime? lastCheckInTime,
    DateTime? lastCheckOutTime,
  }) {
    return AttendanceStatus(
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
      isCheckedOut: isCheckedOut ?? this.isCheckedOut,
      isDisabled: isDisabled ?? this.isDisabled,
      lastCheckInTime: lastCheckInTime ?? this.lastCheckInTime,
      lastCheckOutTime: lastCheckOutTime ?? this.lastCheckOutTime,
    );
  }
}
