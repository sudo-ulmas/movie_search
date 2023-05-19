import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/bloc/search_bloc.dart';

class SearchField extends StatefulWidget {
  SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: CupertinoTextField(
        autofocus: true,
        controller: _controller,
        textInputAction: TextInputAction.search,
        onSubmitted: _controller.text == '' ? null : (query) {},
        keyboardType: TextInputType.visiblePassword,
        cursorWidth: 2,
        cursorHeight: 20,
        placeholder: 'Search a Movie',
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        suffix: TextButton(
          onPressed: () {
            BlocProvider.of<SearchBloc>(context)
                .add(SearchEvent.search(_controller.text));
          },
          child: Container(
            width: 50,
            height: 30,
            alignment: Alignment.center,
            child: const Text('Search'),
          ),
        ),
      ),
    );
  }
}
