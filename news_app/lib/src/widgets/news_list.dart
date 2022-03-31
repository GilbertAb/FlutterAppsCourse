import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) =>
          _New(newArticle: news[index], index: index),
    );
  }
}

class _New extends StatelessWidget {
  final Article newArticle;
  final int index;
  const _New({Key? key, required this.newArticle, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(newArticle: newArticle, index: index),
        _TitleCard(newArticle: newArticle),
        _ImageCard(newArticle: newArticle),
        _BodyCard(newArticle: newArticle),
        const _ButtonsCard(),
        const Divider()
      ],
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.redAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border),
          ),
          const SizedBox(width: 10),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blueAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          )
        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article newArticle;
  const _BodyCard({
    Key? key,
    required this.newArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          (newArticle.description != null) ? newArticle.description! : '',
        ));
  }
}

class _ImageCard extends StatelessWidget {
  final Article newArticle;
  const _ImageCard({
    Key? key,
    required this.newArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ClipRRect(
        /*borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),*/
        borderRadius: BorderRadius.circular(15),
        child: Container(
            child: (newArticle.urlToImage != null)
                ? FadeInImage(
                    placeholder: const AssetImage('assets/giphy.gif'),
                    image: NetworkImage(newArticle.urlToImage!),
                  )
                : const Image(image: AssetImage('assets/no-image.png'))),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article newArticle;
  const _TitleCard({
    Key? key,
    required this.newArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          newArticle.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ));
  }
}

class _CardTopBar extends StatelessWidget {
  final Article newArticle;
  final int index;

  const _CardTopBar({
    Key? key,
    required this.newArticle,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Text('${index + 1}. ', style: TextStyle(color: Colors.redAccent)),
        Text('${newArticle.source.name}.')
      ]),
    );
  }
}
