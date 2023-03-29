class EssayCategoryModel {
  String? id;
  String? essayCategory;

  EssayCategoryModel({this.id, this.essayCategory});

  static EssayCategoryModel fromJson(Map<String, dynamic> json) =>
      EssayCategoryModel(
        id: json['id'] as String?,
        essayCategory: json['essay_category_name'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'essay_category': essayCategory,
      };
}
