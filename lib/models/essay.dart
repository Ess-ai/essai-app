import 'package:essai/models/essay_category.dart';

class EssayModel {
  String? id;
  String? userId;
  EssayCategoryModel? essayCategory;
  String? essayTitle;
  String? essayBody;
  String? createdAt;
  bool? isSubmitted;

  EssayModel(
      {this.id,
      this.userId,
      this.essayCategory,
      this.essayTitle,
      this.essayBody,
      this.createdAt,
      this.isSubmitted});

  static EssayModel fromJson(Map<String, dynamic> json) => EssayModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      essayCategory: EssayCategoryModel.fromJson(json['essay_category']),
      essayTitle: json['essay_title'] as String?,
      essayBody: json['essay_body'] as String?,
      createdAt: json['created_at'] as String?,
      isSubmitted: json['is_submitted'] as bool?);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user_id': userId,
        'essay_category': essayCategory,
        'essay_title': essayTitle,
        'essay_body': essayBody,
        'created_at': createdAt,
        'is_submitted': isSubmitted,
      };
}
