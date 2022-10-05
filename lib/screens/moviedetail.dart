
import 'package:flutter/material.dart';
import 'package:pankajtest/model/moviemodel.dart';
import 'package:pankajtest/views/moviedetailsheader.dart';
import 'package:pankajtest/views/description.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails(this.movie);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child:Column(
            children: [
              MovieDetailHeader(movie),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 0, right: 0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Director:",
                        style: textTheme.subtitle1?.copyWith(fontSize: 15.0)),
                    SizedBox(width: 10.0),
                    Text(
                        movie.director!,
                        style: textTheme.bodyText1?.copyWith(
                          color: Colors.black45,
                          fontSize: 16.0,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 0, right: 0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Main Star:",
                        style: textTheme.subtitle1?.copyWith(fontSize: 15.0)),
                    SizedBox(width: 10.0),
                    Text(
                        movie.main_star!,
                        style: textTheme.bodyText1?.copyWith(
                          color: Colors.black45,
                          fontSize: 16.0,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Storyline(movie.description!),
              ),
            ],
          ) ,
        )

        ,
      ),
    );
  }
}
