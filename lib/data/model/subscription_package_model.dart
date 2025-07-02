class SubscriptionPackageModel {
  int? id;
  String? iosProductId;
  String? name;
  double? price;
  double? finalPrice;
  double? discount;
  String? duration; // keep as string due to 'unlimited'
  String? limit;    // same here
  String? type;
  String? icon;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  bool? isActive;
  List<UserPurchasedPackages>? userPurchasedPackages;

  SubscriptionPackageModel({
    this.id,
    this.iosProductId,
    this.name,
    this.price,
    this.finalPrice,
    this.discount,
    this.duration,
    this.limit,
    this.type,
    this.icon,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.userPurchasedPackages,
  });

  SubscriptionPackageModel.fromJson(Map<String, dynamic> json) {
    id = _parseToInt(json['id']);
    iosProductId = json['ios_product_id'];
    name = json['name'];
    price = _parseToDouble(json['price']);
    discount = _parseToDouble(json['discount_in_percentage']);
    finalPrice = _parseToDouble(json['final_price']);
    duration = json['duration'];
    limit = json['item_limit'];
    type = json['type'];
    icon = json['icon'];
    description = json['description'];
    status = _parseToInt(json['status']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'] == true;

    if (json['user_purchased_packages'] != null) {
      userPurchasedPackages = (json['user_purchased_packages'] as List)
          .map((v) => UserPurchasedPackages.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['ios_product_id'] = iosProductId;
    data['name'] = name;
    data['price'] = price;
    data['discount_in_percentage'] = discount;
    data['final_price'] = finalPrice;
    data['duration'] = duration;
    data['item_limit'] = limit;
    data['type'] = type;
    data['icon'] = icon;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_active'] = isActive;
    if (userPurchasedPackages != null) {
      data['user_purchased_packages'] =
          userPurchasedPackages!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'SubscriptionPackageModel(id: $id, name: $name, duration: $duration, price: $price, final_price: $finalPrice, discount: $discount, status: $status, item_limit: $limit, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, icon: $icon, description: $description, is_active: $isActive)';
  }

  static double? _parseToDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  static int? _parseToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}

class UserPurchasedPackages {
  int? id;
  int? userId;
  int? packageId;
  String? startDate;
  String? endDate;
  int? totalLimit;
  int? usedLimit;
  String? createdAt;
  String? updatedAt;
  String? remainingDays;
  String? remainingItemLimit;

  UserPurchasedPackages({
    this.id,
    this.userId,
    this.packageId,
    this.startDate,
    this.endDate,
    this.totalLimit,
    this.usedLimit,
    this.createdAt,
    this.updatedAt,
    this.remainingDays,
    this.remainingItemLimit,
  });

  UserPurchasedPackages.fromJson(Map<String, dynamic> json) {
    id = _parseToInt(json['id']);
    userId = _parseToInt(json['user_id']);
    packageId = _parseToInt(json['package_id']);
    startDate = json['start_date'];
    endDate = json['end_date'];
    totalLimit = _parseToInt(json['total_limit']);
    usedLimit = _parseToInt(json['used_limit']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    remainingDays = json['remaining_days']?.toString();
    remainingItemLimit = json['remaining_item_limit']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = userId;
    data['package_id'] = packageId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['total_limit'] = totalLimit;
    data['used_limit'] = usedLimit;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['remaining_days'] = remainingDays;
    data['remaining_item_limit'] = remainingItemLimit;
    return data;
  }

  static int? _parseToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
