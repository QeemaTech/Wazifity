class BlogModel {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? image;
  List<String>? tags;
  int? views;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  BlogModel({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.image,
    this.tags,
    this.views,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      image: json['image'],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      views: int.tryParse(json['views'].toString()),
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'image': image,
      'tags': tags,
      'views': views,
      'category_id': categoryId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
