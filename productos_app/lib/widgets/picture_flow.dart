import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

class PictureFlow extends StatefulWidget {
  const PictureFlow({Key? key}) : super(key: key);

  @override
  State<PictureFlow> createState() => _PictureFlowState();
}

class _PictureFlowState extends State<PictureFlow>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  final List<IconData> menuItems = <IconData>[
    Icons.image,
    Icons.camera_alt,
    Icons.photo_album,
  ];

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  Widget pictureFlowItem(IconData icon) {
    final productsService = Provider.of<ProductsService>(context);
    final double buttonDiameter =
        MediaQuery.of(context).size.width / menuItems.length;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: RawMaterialButton(
        fillColor: Colors.indigo,
        splashColor: Colors.white,
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(Size(50, 50)),
        onPressed: () async {
          if (icon == Icons.camera_alt) {
            final picker = ImagePicker();
            final XFile? pickedFile =
                await picker.pickImage(source: ImageSource.camera);
            if (pickedFile == null) {
            } else {
              productsService.updateSelectedProductImage(pickedFile.path);
            }
          } else {
            if (icon == Icons.image) {
              final picker = ImagePicker();
              final XFile? pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
              if (pickedFile == null) {
              } else {
                productsService.updateSelectedProductImage(pickedFile.path);
              }
            }
          }

          menuAnimation.status == AnimationStatus.completed
              ? menuAnimation.reverse()
              : menuAnimation.forward();
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final productsService = Provider.of<ProductsService>(context);
    return Container(
      width: 60,
      height: 160,
      alignment: Alignment.topCenter,
      child: Flow(
        delegate: _PictureFlowDelegate(menuAnimation: menuAnimation),
        children: menuItems
            .map<Widget>((IconData icon) => pictureFlowItem(icon))
            .toList(),
      ),
    );
  }
}

class _PictureFlowDelegate extends FlowDelegate {
  _PictureFlowDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(_PictureFlowDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dy = 0.0;
    for (int i = 0, inv = 2; i < context.childCount; ++i, inv--) {
      dy = context.getChildSize(i)!.width * inv;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          0,
          dy * menuAnimation.value,
          0,
        ),
      );
    }
  }
}
