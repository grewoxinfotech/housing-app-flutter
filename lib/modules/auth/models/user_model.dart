class UserModel {
  final String? id;
  final String? clientId;
  final String? name;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? address;
  final String? createdAt;
  final String? updatedAt;
  final String? role; // 'seller' or 'reseller'
  final bool? isVerified;

  UserModel({
    this.id,
    this.clientId,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString(),
      clientId: json['clientId']?.toString(),
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
      avatar: json['avatar']?.toString(),
      address: json['address']?.toString(),
      createdAt: json['createdAt']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
      role: json['role']?.toString(),
      isVerified: json['isVerified'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clientId': clientId,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'address': address,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'role': role,
      'isVerified': isVerified,
    };
  }

  UserModel copyWith({
    String? id,
    String? clientId,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    String? address,
    String? createdAt,
    String? updatedAt,
    String? role,
    bool? isVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      role: role ?? this.role,
      isVerified: isVerified ?? this.isVerified,
    );
  }
} 