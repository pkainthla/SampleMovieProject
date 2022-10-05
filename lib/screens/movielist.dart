
import 'package:flutter/material.dart';
import 'package:pankajtest/api/movieapi.dart';
import 'package:pankajtest/screens/moviedetail.dart';
import 'package:http/http.dart' as http;
import '../model/moviemodel.dart';
import 'dart:convert';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);
  @override
  State<MovieList> createState() => MovieListState();
}
class MovieListState extends State<MovieList> {
  List<Movie> movies = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Movie>>(
        future: APIManager().getMovies(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            movies = snapshot.data ?? [];
            return GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: movies.length,
              itemBuilder: (ctx, i) {
                return InkWell(
                  onTap: () => _ontap(i),
                  child: Card(
                    elevation: 0,
                    child: Container(
                      height: 290,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)),
                      child: Stack(
                        children: [
                          Column(
                             mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Card(
                                  child: Image.network(
                                        movies[i]?.thumbnail ?? "",
                                    fit: BoxFit.fill,
                                      ),
                                    )
                                ),
                                Text(
                                  movies[i]?.name ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    Text(
                                      'Year: ${movies[i]?.year ?? ""}',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 5,
                mainAxisExtent: 264,
              ),
            );
          }
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
  void _ontap(int index)  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetails(movies[index])),
    );
  }
  /*
  Future<List<Movie>> getMovies() async {
    var response = await http
        .get(Uri.parse('http://165.22.75.82/v1/movies'));
    if(response.statusCode==200){
      print(response.body);
    }
    MovieData movieData = MovieData.fromJson(jsonDecode(response.body));
    return movieData.data?.movies ?? [];
  }
*/
}

