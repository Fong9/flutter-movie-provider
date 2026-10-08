class MovieModel {
  final String title;
  final String genre;
  final String duration;
  final String rate;
  final String language;
  final String censorship;
  final String description;
  final String image;
  final String timestamp;

  MovieModel({
    required this.title,
    required this.genre,
    required this.duration,
    required this.rate,
    required this.language,
    required this.censorship,
    required this.description,
    required this.image,
    required this.timestamp,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      genre: json['genre'],
      duration: json['duration'],
      rate: json['rate'],
      language: json['language'],
      censorship: json['censorship'],
      description: json['description'],
      image: json['image'],
      timestamp: json['timestamp'],
    );
  }
}