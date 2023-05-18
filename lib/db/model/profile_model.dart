class ProfileModel {
  String? id;
  String? title;
  String? picture;

  ProfileModel({required this.title, required this.picture, required this.id});

  factory ProfileModel.fromMap(Map<dynamic, dynamic> map) {
    return ProfileModel(
        id: map['_id'], title: map['title'], picture: map['picture']);
  }

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "picture": picture,
      };
}
