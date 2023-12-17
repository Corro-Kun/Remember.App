class cardModel {
  int idcard;
  String name;
  String description;
  String link;
  String imagePath;
  int isFavorite;
  int session_idsession;

  cardModel({
    required this.idcard,
    required this.name,
    required this.description,
    required this.link,
    required this.isFavorite,
    required this.imagePath,
    required this.session_idsession,
  });
}
