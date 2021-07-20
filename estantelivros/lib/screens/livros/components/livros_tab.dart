import 'package:estantelivros/screens/livros/components/header_livros.dart';
import 'package:estantelivros/screens/livros/components/header_search.dart';
import 'package:estantelivros/screens/livros/components/livros_list.dart';
import 'package:flutter/material.dart';


class LivrosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HeaderLivros(),
          ),
          SliverToBoxAdapter(
            child: Container(
                child: SearchField()),
          ),
          SliverToBoxAdapter(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: LivrosList())
          )
        ],
      ),
    );
  }
}
