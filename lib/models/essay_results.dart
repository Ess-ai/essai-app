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
        id: json['id'],
        userId: json['user_id'],
        essayId: EssayModel.fromJson(json['essay_id']),
        score: json['essay_score'],
        reasons: json['reasons'],
        grade: json['essay_grade'],
        improvements: json['improvements'],
        createdAt: json['created_at'],
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
