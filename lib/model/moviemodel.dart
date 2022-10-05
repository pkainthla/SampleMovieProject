
class MovieData {
  int? statusCode;
  String? message;
  Data? data;
  MovieData({this.statusCode, this.message, this.data});
  MovieData.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class Data {
  List<Movie>? movies;
  Data({this.movies});
  Data.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movie>[];
      json['movies'].forEach((v) {
        movies!.add(new Movie.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['movies'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  int? id;
  String? name;
  String? year;
  String? director;
  String? main_star;
  String? description;
  int? favorited_by_users;
  List<String>? genres;
  String? thumbnail;
  Movie(
      {this.id,
        this.name,
        this.year,
        this.director,
        this.main_star,
        this.description,
        this.favorited_by_users,
        this.genres,
        this.thumbnail});
  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    director = json['director'];
    main_star = json['main_star'];
    description = json['description'];
    favorited_by_users = json['favorited_by_users'];
    genres = json['genres'].cast<String>();
    thumbnail = json['thumbnail']?.replaceAll("/thumb/", "/medium/");
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['year'] = this.year;
    data['director'] = this.director;
    data['main_star'] = this.main_star;
    data['description'] = this.description;
    data['favorited_by_users'] = this.favorited_by_users;
    data['genres'] = this.genres;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

