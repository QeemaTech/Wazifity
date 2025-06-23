import 'package:wazifati/data/model/category_model.dart';
import 'package:wazifati/data/model/custom_field/custom_field_model.dart';
import 'package:wazifati/data/model/seller_ratings_model.dart';

class ItemModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  dynamic price;
  dynamic minSalary;
  dynamic maxSalary;
  String? image;
  dynamic watermarkimage;
  dynamic _latitude;
  dynamic _longitude;
  String? address;
  String? contact;
  int? totalLikes;
  int? views;
  String? type;
  String? status;
  bool? active;
  String? videoLink;
  User? user;
  List<GalleryImages>? galleryImages;
  List<ItemOffers>? itemOffers;
  CategoryModel? category;
  List<CustomFieldModel>? customFields;
  bool? isLike;
  bool? isFeature;
  String? created;
  String? itemType;
  int? userId;
  int? categoryId;
  bool? isAlreadyOffered;
  bool? isAlreadyJobApplied;
  bool? isAlreadyReported;
  String? allCategoryIds;
  String? rejectedReason;
  int? areaId;
  String? area;
  String? city;
  String? state;
  String? country;
  int? isPurchased;
  List<UserRatings>? review;
  int? isEditedByAdmin;
  String? adminEditReason;

  double? get latitude => _latitude;

  set latitude(dynamic value) {
    _latitude = _parseToDouble(value);
  }

  static bool? _parseToBool(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) return value == '1' || value.toLowerCase() == 'true';
    return null;
  }

  static int? _parseToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  double? get longitude => _longitude;

  set longitude(dynamic value) {
    _longitude = _parseToDouble(value);
  }

  ItemModel({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.description,
    this.price,
    this.minSalary,
    this.maxSalary,
    this.image,
    this.watermarkimage,
    dynamic latitude,
    dynamic longitude,
    this.address,
    this.contact,
    this.type,
    this.status,
    this.active,
    this.totalLikes,
    this.views,
    this.videoLink,
    this.user,
    this.galleryImages,
    this.itemOffers,
    this.customFields,
    this.isLike,
    this.isFeature,
    this.created,
    this.itemType,
    this.userId,
    this.categoryId,
    this.isAlreadyOffered,
    this.isAlreadyJobApplied,
    this.isAlreadyReported,
    this.rejectedReason,
    this.allCategoryIds,
    this.areaId,
    this.area,
    this.city,
    this.state,
    this.country,
    this.isPurchased,
    this.review,
    this.isEditedByAdmin,
    this.adminEditReason,
  }) {
    this.latitude = latitude;
    this.longitude = longitude;
  }

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    watermarkimage = json['watermark_image'];
    price = json['price'];
    minSalary = json['min_salary'];
    maxSalary = json['max_salary'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    contact = json['contact'];
    totalLikes = json['total_likes'];
    views = _parseToInt(json['clicks']);
    type = json['type'];
    status = json['status'];
    videoLink = json['video_link'];
    isLike = json['is_liked'];
    isFeature = json['is_feature'];
    created = json['created_at'];
    itemType = json['item_type'];
    userId = _parseToInt(json['user_id']);
    categoryId = _parseToInt(json['category_id']);
    isAlreadyOffered = _parseToBool(json['is_already_offered']);
    isAlreadyJobApplied = _parseToBool(json['is_already_job_applied']);
    isAlreadyReported = _parseToBool(json['is_already_reported']);
    isPurchased = _parseToInt(json['is_purchased']);
    isEditedByAdmin = _parseToInt(json['is_edited_by_admin']);
    active = _parseToBool(json['active']);
    allCategoryIds = json['all_category_ids'];
    rejectedReason = json['rejected_reason'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    adminEditReason = json['admin_edit_reason'];

    if (json['area'] != null) {
      areaId = json['area']['id'];
      area = json['area']['name'];
    }

    if (json['user'] != null) {
      user = User.fromJson(json['user']);
    }

    if (json['category'] != null) {
      category = CategoryModel.fromJson(json['category']);
    }

    if (json['gallery_images'] != null) {
      galleryImages = (json['gallery_images'] as List)
          .map((e) => GalleryImages.fromJson(e))
          .toList();
    }

    if (json['item_offers'] != null) {
      itemOffers = (json['item_offers'] as List)
          .map((e) => ItemOffers.fromJson(e))
          .toList();
    }

    if (json['custom_fields'] != null) {
      customFields = (json['custom_fields'] as List)
          .map((e) => CustomFieldModel.fromMap(e))
          .toList();
    }

    if (json['review'] != null) {
      review =
          (json['review'] as List).map((e) => UserRatings.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['price'] = price;
    data['min_salary'] = minSalary;
    data['max_salary'] = maxSalary;
    data['image'] = image;
    data['watermark_image'] = watermarkimage;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['contact'] = contact;
    data['total_likes'] = totalLikes;
    data['clicks'] = views;
    data['type'] = type;
    data['status'] = status;
    data['active'] = active == true ? 1 : 0;
    data['video_link'] = videoLink;
    data['is_liked'] = isLike;
    data['is_feature'] = isFeature;
    data['created_at'] = created;
    data['item_type'] = itemType;
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['is_already_offered'] = isAlreadyOffered;
    data['is_already_job_applied'] = isAlreadyJobApplied;
    data['is_already_reported'] = isAlreadyReported;
    data['all_category_ids'] = allCategoryIds;
    data['rejected_reason'] = rejectedReason;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['is_purchased'] = isPurchased;
    data['is_edited_by_admin'] = isEditedByAdmin;
    data['admin_edit_reason'] = adminEditReason;

    if (areaId != null && area != null) {
      data['area'] = {
        'id': areaId,
        'name': area,
      };
    }

    if (user != null) {
      data['user'] = user!.toJson();
    }

    if (category != null) {
      data['category'] = category!.toJson();
    }

    if (galleryImages != null) {
      data['gallery_images'] = galleryImages!.map((v) => v.toJson()).toList();
    }

    if (itemOffers != null) {
      data['item_offers'] = itemOffers!.map((v) => v.toJson()).toList();
    }

    if (customFields != null) {
      data['custom_fields'] = customFields!.map((v) => v.toMap()).toList();
    }

    if (review != null) {
      data['review'] = review!.map((v) => v.toJson()).toList();
    }

    return data;
  }

  static double? _parseToDouble(dynamic value) {
    if (value == null) return null;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value);
    return null;
  }
}

class User {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? type;
  String? profile;
  String? fcmId;
  String? firebaseId;
  int? status;
  String? apiToken;
  dynamic address;
  String? createdAt;
  String? updatedAt;
  int? showPersonalDetails;
  int? isVerified;

  User(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.type,
      this.profile,
      this.fcmId,
      this.firebaseId,
      this.status,
      this.apiToken,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.isVerified,
      this.showPersonalDetails});

  static int? _parseToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    profile = json['profile'];
    fcmId = json['fcm_id'];
    firebaseId = json['firebase_id'];
    status = _parseToInt(json['status']);
    apiToken = json['api_token'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isVerified = _parseToInt(json['is_verified']);
    showPersonalDetails = _parseToInt(json['show_personal_details']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['type'] = type;
    data['profile'] = profile;
    data['fcm_id'] = fcmId;
    data['firebase_id'] = firebaseId;
    data['status'] = status;
    data['api_token'] = apiToken;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_verified'] = isVerified;
    data['show_personal_details'] = showPersonalDetails;
    return data;
  }
}

class GalleryImages {
  int? id;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? itemId;

  GalleryImages(
      {this.id, this.image, this.createdAt, this.updatedAt, this.itemId});

  GalleryImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    itemId = json['item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['item_id'] = itemId;
    return data;
  }
}

class ItemOffers {
  int? id;
  int? sellerId;
  int? buyerId;
  String? createdAt;
  String? updatedAt;
  double? amount;

  ItemOffers(
      {this.id,
      this.sellerId,
      this.createdAt,
      this.updatedAt,
      this.buyerId,
      this.amount});

  ItemOffers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerId = json['buyer_id'];
    sellerId = json['seller_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    // Handle amount being int or double
    if (json['amount'] is int) {
      amount = (json['amount'] as int).toDouble();
    } else if (json['amount'] is double) {
      amount = json['amount'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['buyer_id'] = buyerId;
    data['seller_id'] = sellerId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['amount'] = amount;
    return data;
  }
}
