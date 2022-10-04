
import 'package:flutter/material.dart';
import 'package:pankajtest/api/movieapi.dart';
import 'package:pankajtest/screens/moviedetail.dart';
import 'package:http/http.dart';
import '../model/moviemodel.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);
  @override
  State<MovieList> createState() => _MovieListState();
}
class _MovieListState extends State<MovieList> {
  late final List<Movies> movies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Call API here//
    movies = getMovies() as List<Movies>;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: 8,
        itemBuilder: (ctx, i) {
          return InkWell(
            onTap: () => _ontap(i),
            child: Card(
              child: Container(
                height: 290,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            'http://165.22.75.82/system/movies/thumbnails/000/000/015/medium/Holiwood.jpg?1579708021',
                            fit: BoxFit.fill,
                          ),
                        ),
                        )
                      ],
                  const Text(
                    "Hollywood",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Year: 2002 ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ],
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
      ),
    );
  }
  void _ontap(int index)  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetails(testMovie)),
    );
  }
  Future<Movies> getMovies() async {
    var url =
    Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    var response =  await http.get(url);
    return response;
  }
}

