class EssaResultyModel {
  String? id;
  String? userId;
  String? essayId;
  int? essayMarks;
  String? essayGrade;
  String? essayImprovement;
  String? aiRemarks;
  String? createdAt;

  EssaResultyModel(
      {this.id,
      this.userId,
      this.essayMarks,
      this.essayGrade,
      this.essayImprovement,
      this.aiRemarks,
      this.createdAt});
}
