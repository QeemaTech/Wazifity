class JobApplication {
  late int id;
  int? itemId;
  int? userId;
  String? fullName;
  String? email;
  String? mobile;
  String? resume;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? recruiterId;
  Item? item;
  Recruiter? recruiter;

  JobApplication({
    required this.id,
    this.itemId,
    this.userId,
    this.fullName,
    this.email,
    this.mobile,
    this.resume,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.recruiterId,
    this.item,
    this.recruiter,
  });

  JobApplication.fromJson(Map<String, dynamic> json) {
    id = _parseToInt(json['id']) ?? 0;
    itemId = _parseToInt(json['item_id']);
    userId = _parseToInt(json['user_id']);
    recruiterId = _parseToInt(json['recruiter_id']);
    fullName = json['full_name'];
    email = json['email'];
    mobile = json['mobile'];
    resume = json['resume'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
    recruiter = json['recruiter'] != null ? Recruiter.fromJson(json['recruiter']) : null;
  }

  static int? _parseToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}

class Item {
  int? id;
  String? name;
  int? userId;

  Item({this.id, this.name, this.userId});

  Item.fromJson(Map<String, dynamic> json) {
    id = _parseToInt(json['id']);
    name = json['name'];
    userId = _parseToInt(json['user_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['user_id'] = userId;
    return data;
  }

  static int? _parseToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}

class Recruiter {
  int? id;
  String? name;
  String? email;

  Recruiter({this.id, this.name, this.email});

  Recruiter.fromJson(Map<String, dynamic> json) {
    id = _parseToInt(json['id']);
    name = json['name'];
    email = json['email'];
  }

  static int? _parseToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
