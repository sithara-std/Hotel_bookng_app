class Hotel {
  String? title;
  num? rating;
  Map<String,dynamic>? prices;
  String? mainImages;
  List<dynamic>? otherImages;
  List<dynamic>? amanities;

  Hotel({
    this.title,
    this.rating,
    this.prices,
    this.mainImages,
    this.otherImages,
    this.amanities
  });
}