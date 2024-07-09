class CardModel {
  String cardName;
  String cardPlace;
  String cardCountry;
  CardModel(
      {required this.cardName,
      required this.cardPlace,
      required this.cardCountry});

  factory CardModel.fromJson(Map<String, dynamic> map) {
    return CardModel(
        cardName: map["cardName"],
        cardPlace: map["cardPlace"],
        cardCountry: map["cardCountry"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "cardName": cardName,
      "cardPlace": cardPlace,
      "cardCountry": cardCountry
    };
  }
}
