import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String imageDescription;
  const CustomCardType2(
      {Key? key, required this.imageUrl, required this.imageDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      shadowColor: AppTheme.primary.withOpacity(0.5),
      elevation: 30.0,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                //'https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
                imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(
              right: 20,
              top: 10,
              bottom: 10,
            ),
            child: Text(imageDescription),
          ),
        ],
      ),
    );
  }
}
