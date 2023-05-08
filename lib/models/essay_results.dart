import 'package:essai/models/essay.dart';

class EssayResultsModel {
  String? id;
  String? userId;
  EssayModel? essayId;
  String? score;
  String? grade;
  String? improvements;
  String? reasons;
  String? createdAt;

  EssayResultsModel(
      {this.id,
      this.userId,
      this.essayId,
      this.score,
      this.grade,
      this.reasons,
      this.improvements,
      this.createdAt});

  static EssayResultsModel fromJson(Map<String, dynamic> json) =>
      EssayResultsModel(
        id: json['id'] as String,
        userId: json['user_id'] as String?,
        essayId: EssayModel.fromJson(json['essay_id']),
        score: json['essay_score'] as String?,
        reasons: json['reasons'] as String?,
        grade: json['essay_grade'] as String?,
        improvements: json['improvements'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user_id': userId,
        'essay_id': essayId,
        'score': score,
        'reasons': reasons,
        'grade': grade,
        'improvements': improvements,
        'created_at': createdAt,
      };
}
