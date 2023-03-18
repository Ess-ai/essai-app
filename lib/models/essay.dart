class EssayModel {
  String? id;
  String? userId;
  String? essayCategory;
  String? essayTitle;
  String? essayBody;
  String? createdAt;

  EssayModel(
      {this.id,
      this.userId,
      this.essayCategory,
      this.essayTitle,
      this.essayBody,
      this.createdAt});
}
