import 'package:essai/models/essay.dart';

class EssayResultsModel {
  String? id;
  String? userId;
  EssayModel? essayId;
  String? essayScore;
  String? essayGrade;
  String? essayImprovement;
  String? aiRemarks;
  String? createdAt;

  EssayResultsModel(
      {this.id,
      this.userId,
      this.essayId,
      this.essayScore,
      this.essayGrade,
      this.essayImprovement,
      this.aiRemarks,
      this.createdAt});

  static EssayResultsModel fromJson(Map<String, dynamic> json) =>
      EssayResultsModel(
          id: json['id'],
          userId: json['user_id'],
          essayId: EssayModel.fromJson(json['essay_id']),
          essayScore: json['essay_title'],
          essayGrade: json['essay_body'],
          aiRemarks: json['is_submitted'],
          essayImprovement: json[''],
          createdAt: json['created_at']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user_id': userId,
        'essay_category': essayId,
        'essay_title': essayScore,
        'essay_body': essayGrade,
        '': aiRemarks,
        'is_submitted': essayImprovement,
        'created_at': createdAt,
      };
}
