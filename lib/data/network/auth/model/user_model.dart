class UserModel {
  String? token;
  User? user;

  UserModel({this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? createdBy;
  String? updatedBy;
  String? username;
  String? password;
  String? email;
  String? userType;
  String? roleId;
  String? profilePic;
  String? firstName;
  String? lastName;
  String? phone;
  String? otp;
  String? otpExpiry;
  String? address;
  String? city;
  String? state;
  String? zipCode;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.createdBy,
      this.updatedBy,
      this.username,
      this.password,
      this.email,
      this.userType,
      this.roleId,
      this.profilePic,
      this.firstName,
      this.lastName,
      this.phone,
      this.otp,
      this.otpExpiry,
      this.address,
      this.city,
      this.state,
      this.zipCode,
      this.isVerified,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    userType = json['userType'];
    roleId = json['role_id'];
    profilePic = json['profilePic'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    otp = json['otp'];
    otpExpiry = json['otpExpiry'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['userType'] = this.userType;
    data['role_id'] = this.roleId;
    data['profilePic'] = this.profilePic;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['otpExpiry'] = this.otpExpiry;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['isVerified'] = this.isVerified;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}