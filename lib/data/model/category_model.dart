import 'package:wazifati/utils/api.dart';

class Type {
  String? id;
  String? type;

  Type({this.id, this.type});

  Type.fromJson(Map<String, dynamic> json) {
    id = json[Api.id]?.toString();
    type = json[Api.type];
  }
}

class CategoryModel {
  final int? id;
  final String? name;
  final String? url;
  final List<CategoryModel>? children;
  final String? description;
  final int? subcategoriesCount;
  final int? isJobCategory;
  final int? priceOptional;

  CategoryModel({
    this.id,
    this.name,
    this.url,
    this.description,
    this.children,
    this.subcategoriesCount,
    this.isJobCategory,
    this.priceOptional,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    try {
      List<dynamic> childData = json['subcategories'] ?? [];
      List<CategoryModel> children =
          childData.map((child) => CategoryModel.fromJson(child)).toList();

      return CategoryModel(
        id: _parseInt(json['id']),
        name: json['translated_name']?.toString(),
        url: json['image']?.toString(),
        description: json['description']?.toString() ?? "",
        subcategoriesCount: _parseInt(json['subcategories_count']) ?? 0,
        isJobCategory: _parseInt(json['is_job_category']) ?? 0,
        priceOptional: _parseInt(json['price_optional']),
        children: children,
      );
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'translated_name': name,
      'image': url,
      'description': description,
      'subcategories_count': subcategoriesCount,
      'is_job_category': isJobCategory,
      'price_optional': priceOptional,
      'subcategories': children?.map((child) => child.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'CategoryModel(id: $id, translated_name: $name, url: $url, description: $description, children: $children, subcategories_count: $subcategoriesCount, is_job_category: $isJobCategory, price_optional: $priceOptional)';
  }

  /// 🔧 Safe int parser
  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
