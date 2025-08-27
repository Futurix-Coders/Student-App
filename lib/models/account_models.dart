class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String semester;
  final String department;
  final DateTime dateOfBirth;
  final String classRoll;
  final String makautRoll;
  final String? profilePictureUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.semester,
    required this.department,
    required this.dateOfBirth,
    required this.classRoll,
    required this.makautRoll,
    this.profilePictureUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      semester: json['semester'],
      department: json['department'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      classRoll: json['classRoll'],
      makautRoll: json['makautRoll'],
      profilePictureUrl: json['profilePictureUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'semester': semester,
      'department': department,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'classRoll': classRoll,
      'makautRoll': makautRoll,
      'profilePictureUrl': profilePictureUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? semester,
    String? department,
    DateTime? dateOfBirth,
    String? classRoll,
    String? makautRoll,
    String? profilePictureUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      semester: semester ?? this.semester,
      department: department ?? this.department,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      classRoll: classRoll ?? this.classRoll,
      makautRoll: makautRoll ?? this.makautRoll,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get formattedDateOfBirth {
    return '${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}';
  }

  int get age {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month || 
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }
}
