class ProfileInfo {
  ProfileInfoData? data;
  bool? success;
  String? message;

  ProfileInfo({this.data, this.success, this.message});

  ProfileInfo.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ProfileInfoData.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class ProfileInfoData {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? bio;
  String? photo;
  String? date;

  ProfileInfoData(
      {this.id,
        this.name,
        this.phone,
        this.address,
        this.bio,
        this.photo,
        this.date});

  ProfileInfoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']??"";
    phone = json['phone']??"";
    address = json['address']??"";
    bio = json['bio']??"";
    photo = json['photo']??"";
    date = json['date']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['bio'] = this.bio;
    data['photo'] = this.photo;
    data['date'] = this.date;
    return data;
  }
}