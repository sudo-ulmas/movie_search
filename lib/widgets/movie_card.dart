import 'package:flutter/material.dart';

import '../model/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.network(movie.poster),
      Positioned(
        right: 10,
        top: 10,
        child: Text(
          '${movie.rating.toStringAsFixed(1)}/9',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Positioned(
        bottom: 10,
        left: 10,
        right: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...movie.genres.take(4).map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      e,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      )
    ]);
  }
}
