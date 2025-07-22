class UserModel {
  final bool encrypted;
  final UserData data;

  UserModel({required this.encrypted, required this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      encrypted: json['encrypted'] ?? false,
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'encrypted': encrypted,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final String? token;
  final User? user;

  UserData({required this.token, required this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['token'] ?? '',
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user?.toJson(),
    };
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String gender;
  final String phone;
  final String addressLane1;
  final String addressLane2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final bool isOnline;
  final List<dynamic> blockedUsers;
  final String role;
  final bool isVerified;
  final bool isDeleted;
  final String deletedMessage;
  final bool isDisabled;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String lastSeen;
  final String profile;
  final String deletedTime;
  final String plan;
  final String previousPlan;
  final String createdForTTL;
  final List<PaymentHistory> paymentHistory;
  final String referralCode;
  final String planEndDate;
  final List<String> fcmTokens;
  final Location location;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.phone,
    required this.addressLane1,
    required this.addressLane2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.isOnline,
    required this.blockedUsers,
    required this.role,
    required this.isVerified,
    required this.isDeleted,
    required this.deletedMessage,
    required this.isDisabled,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.lastSeen,
    required this.profile,
    required this.deletedTime,
    required this.plan,
    required this.previousPlan,
    required this.createdForTTL,
    required this.paymentHistory,
    required this.referralCode,
    required this.planEndDate,
    required this.fcmTokens,
    required this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      addressLane1: json['addressLane1'] ?? '',
      addressLane2: json['addressLane2'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      postalCode: json['postalCode'] ?? '',
      country: json['country'] ?? '',
      isOnline: json['isOnline'] ?? false,
      blockedUsers: json['blockedUsers'] ?? [],
      role: json['role'] ?? '',
      isVerified: json['isVerified'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      deletedMessage: json['deletedMessage'] ?? '',
      isDisabled: json['isDisabled'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      lastSeen: json['lastSeen'] ?? '',
      profile: json['profile'] ?? '',
      deletedTime: json['deletedTime'] ?? '',
      plan: json['plan'] ?? '',
      previousPlan: json['previousPlan'] ?? '',
      createdForTTL: json['createdForTTL'] ?? '',
      referralCode: json['referralCode'] ?? '',
      planEndDate: json['planEndDate'] ?? '',
      fcmTokens: List<String>.from(json['fcmTokens'] ?? []),
      paymentHistory: (json['paymentHistory'] as List<dynamic>)
          .map((e) => PaymentHistory.fromJson(e))
          .toList(),
      location: Location.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'phone': phone,
      'addressLane1': addressLane1,
      'addressLane2': addressLane2,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'isOnline': isOnline,
      'blockedUsers': blockedUsers,
      'role': role,
      'isVerified': isVerified,
      'isDeleted': isDeleted,
      'deletedMessage': deletedMessage,
      'isDisabled': isDisabled,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'lastSeen': lastSeen,
      'profile': profile,
      'deletedTime': deletedTime,
      'plan': plan,
      'previousPlan': previousPlan,
      'createdForTTL': createdForTTL,
      'paymentHistory': paymentHistory.map((e) => e.toJson()).toList(),
      'referralCode': referralCode,
      'planEndDate': planEndDate,
      'fcmTokens': fcmTokens,
      'location': location.toJson(),
    };
  }
}

class PaymentHistory {
  final String id;
  final String plan;
  final String planEndDate;
  final String createdAt;

  PaymentHistory({
    required this.id,
    required this.plan,
    required this.planEndDate,
    required this.createdAt,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) {
    return PaymentHistory(
      id: json['_id'] ?? '',
      plan: json['plan'] ?? '',
      planEndDate: json['planEndDate'] ?? '',
      createdAt: json['createdAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'plan': plan,
      'planEndDate': planEndDate,
      'createdAt': createdAt,
    };
  }
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
