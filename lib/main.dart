import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/bloc/search_bloc.dart';
import 'package:movie_search/repository/search_api.dart';
import 'package:movie_search/repository/search_repository.dart';
import 'package:movie_search/shared/dio_client.dart';
import 'package:movie_search/widgets/appbar.dart';

import 'shared/bloc_observer.dart';
import 'widgets/movie_card.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            SearchBloc(SearchRepository(SearchApi(DioClient()))),
        child: Scaffold(
          backgroundColor: Colors.green,
          appBar: const SearchAppbar(),
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) => state.when(
              init: () => const SizedBox.shrink(),
              inProgress: () => const Center(
                  child: CircularProgressIndicator(color: Colors.black)),
              loaded: (movies) => NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent) {
                    print('sorry I could not find time for pagination');
                  }

                  return false;
                },
                child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) =>
                      MovieCard(movie: movies[index]),
                ),
              ),
              failed: (error) => Center(child: Text(error)),
            ),
          ),
        ),
      );
}
