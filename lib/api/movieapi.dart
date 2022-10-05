
import 'app_config.dart';
import 'package:pankajtest/model/moviemodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIManager {
  static final APIManager _apiManager = APIManager._internal();
  factory APIManager() {
    return _apiManager;
  }
  APIManager._internal();
  var endpoint = "v1/movies";
  Future<List<Movie>> getMovies() async {
    var baseUrl =  setEnvironment(Environment.staging);
    var url = baseUrl + endpoint ;
    var response = await http
        .get(Uri.parse(url));
    if(response.statusCode==200){
      print(response.body);
      MovieData movieData = MovieData.fromJson(jsonDecode(response.body));
      return movieData.data?.movies ?? [];
    }
    return [];
  }
}