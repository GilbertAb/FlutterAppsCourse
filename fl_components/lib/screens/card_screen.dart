import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';
//import 'package:fl_components/themes/app_theme.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: const [
          CustomCardType1(),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://cdn02.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_ResidentEvil4_image1600w.jpg',
            imageDescription: "Residen Evil 4",
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://image.api.playstation.com/vulcan/img/rnd/202010/2823/CYH8Z7RFpP45L5U2XpTI7JeW.png',
            imageDescription: "Shadow of the Colossus",
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl: 'https://i.blogs.es/2c85ec/megaman/1366_2000.jpg',
            imageDescription: "Mega Man",
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://cdn.mos.cms.futurecdn.net/i5yixFEW5YCPrY3xmegQNa.jpg',
            imageDescription: "Silent Hill 2",
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://www.somosxbox.com/wp-content/uploads/2020/01/silent-hill-3-790x509.jpg?width=1200&enable=upscale',
            imageDescription: "Silent Hill 3",
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://as01.epimg.net/meristation/imagenes/2020/12/29/noticias/1609233200_409547_1609233351_noticia_normal.jpg',
            imageDescription: "Project Zero / Fatal Frame",
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://vidabytes.com/wp-content/uploads/2021/12/God-of-War-2-como-usar-el-viaje-rapido.jpg',
            imageDescription: "God of War",
          ),
          SizedBox(height: 20),
          CustomCardType2(
            imageUrl:
                'https://as01.epimg.net/meristation/imagenes/2018/09/03/reportajes/1535993147_565241_1535993325_sumario_normal.jpg',
            imageDescription: "Metal Gear Solid",
          ),
        ],
      ),
    );
  }
}
