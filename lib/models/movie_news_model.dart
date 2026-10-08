class MovieNewsModel {
  String image;
  String about;

  MovieNewsModel({required this.image, required this.about});

  factory MovieNewsModel.fromJson(Map<String, dynamic> json) {
    return MovieNewsModel(
      image: json['image'], 
      about: json['about']
    );
  }
}