class PublicPostsModel {
  List<Data>? data;

  PublicPostsModel({this.data});

  PublicPostsModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? title;
  String? slug;
  String? description;
  String? type;
  String? status;
  String? ago;
  String? createdAt;
  List<Tags>? tags;

  Data(
      {this.id,
        this.title,
        this.slug,
        this.description,
        this.type,
        this.status,
        this.ago,
        this.createdAt,
        this.tags});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    type = json['type'];
    status = json['status'];
    ago = json['ago'];
    createdAt = json['created_at'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['type'] = this.type;
    data['status'] = this.status;
    data['ago'] = this.ago;
    data['created_at'] = this.createdAt;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  int? id;
  String? tagName;
  String? tagDescription;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Tags(
      {this.id,
        this.tagName,
        this.tagDescription,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagName = json['tag_name'];
    tagDescription = json['tag_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag_name'] = this.tagName;
    data['tag_description'] = this.tagDescription;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? postId;
  int? tagId;

  Pivot({this.postId, this.tagId});

  Pivot.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    tagId = json['tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['tag_id'] = this.tagId;
    return data;
  }
}