class AiResposeModel {
  int? score;
  String? reasons;
  String? improvements;

  AiResposeModel({this.score, this.reasons, this.improvements});

  static AiResposeModel fromJson(Map<String, dynamic> json) => AiResposeModel(
        score: json['score'],
        reasons: json['reasons'],
        improvements: json['improvements'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'score': score,
        'reasons': reasons,
        'improvements': improvements,
      };
}
