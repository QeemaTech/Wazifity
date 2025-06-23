class HomeSlider {
  int? id;
  int? sequence;
  String? thirdPartyLink;
  String? modelType;
  String? image;
  int? modelId;
  CategorySlider? model;

  HomeSlider({
    this.id,
    this.sequence,
    this.thirdPartyLink,
    this.modelId,
    this.image,
    this.modelType,
    this.model,
  });

  factory HomeSlider.fromJson(Map<String, dynamic> json) {
    return HomeSlider(
      id: _toInt(json['id']),
      sequence: _toInt(json['sequence']),
      thirdPartyLink: json['third_party_link'],
      modelId: _toInt(json['model_id']),
      image: json['image'],
      modelType: json['model_type'],
      model: (json['model'] != null &&
              json['model_type'] != null &&
              json['model_type'].toString().contains("Category"))
          ? CategorySlider.fromJson(json['model'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'sequence': sequence,
      'third_party_link': thirdPartyLink,
      'model_id': modelId,
      'image': image,
      'model_type': modelType,
    };

    if (model != null) {
      data['model'] = model!.toJson();
    }

    return data;
  }
}

class CategorySlider {
  int? id;
  String? name;
  int? subCategoriesCount;
  int? parentCategoryId;

  CategorySlider({
    this.id,
    this.name,
    this.subCategoriesCount,
    this.parentCategoryId,
  });

  factory CategorySlider.fromJson(Map<String, dynamic> json) {
    return CategorySlider(
      id: _toInt(json['id']),
      name: json['name'] ?? json['translated_name'],
      subCategoriesCount: _toInt(json['subcategories_count']) ?? 0,
      parentCategoryId: _toInt(json['parent_category_id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subcategories_count': subCategoriesCount,
      'parent_category_id': parentCategoryId,
    };
  }
}

/// Helper function to parse int from dynamic safely
int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}
