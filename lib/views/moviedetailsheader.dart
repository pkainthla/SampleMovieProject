import 'package:flutter/material.dart';
import 'package:pankajtest/views/roundedbottomImage.dart';
import 'package:pankajtest/model/moviemodel.dart';
import 'package:pankajtest/views/poster.dart';

class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader(this.movie);
  final Movie movie;

  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return movie.genres!.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(category),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var movieInformation = Column(
     crossAxisAlignment: CrossAxisAlignment.start,
    //   mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 2.0),
        Text(
          movie.name!,
          style: textTheme.bodyLarge?.copyWith(fontSize: 20.0),
        ),
        SizedBox(height: 2.0),
        Text(movie.year!,style: textTheme.bodySmall),
        SizedBox(height: 8.0),
        SingleChildScrollView(scrollDirection: Axis.horizontal, child:Wrap(children: _buildCategoryChips(textTheme))),
      ],
    );
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: ArcBannerImage(movie.thumbnail!),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(
                movie.thumbnail!,
                height: 180.0,
              ),
              SizedBox(width: 16.0),
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }
}
