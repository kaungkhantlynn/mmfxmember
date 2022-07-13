class FollowedAuthorList {
  List<Data>? data;

  FollowedAuthorList({this.data});

  FollowedAuthorList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? bio;
  int? followerCount;
  int? postCount;

  Data({this.id, this.name, this.bio, this.followerCount, this.postCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bio = json['bio'];
    followerCount = json['follower_count'];
    postCount = json['post_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bio'] = this.bio;
    data['follower_count'] = this.followerCount;
    data['post_count'] = this.postCount;
    return data;
  }
}