class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? known_for_department;
  String? name;
  String? original_name;
  double? popularity;
  String? profile_path;
  int? cast_id;
  String? character;
  String? credit_id;
  int? order;

  Cast(
      {required this.adult,
      required this.gender,
      required this.id,
      required this.known_for_department,
      required this.name,
      required this.original_name,
      required this.popularity,
      required this.profile_path,
      required this.cast_id,
      required this.character,
      required this.credit_id,
      required this.order});

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    known_for_department = json['known_for_department'];
    name = json['name'];
    original_name = json['original_name'];
    popularity = json['popularity'];
    profile_path = json['profile_path'];
    cast_id = json['cast_id'];
    character = json['character'];
    credit_id = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = known_for_department;
    data['name'] = name;
    data['original_name'] = original_name;
    data['popularity'] = popularity;
    data['profile_path'] = profile_path;
    data['cast_id'] = cast_id;
    data['character'] = character;
    data['credit_id'] = credit_id;
    data['order'] = order;
    return data;
  }
}
