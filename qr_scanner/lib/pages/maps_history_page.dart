import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class MapsHistoryPage extends StatelessWidget {
  const MapsHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Acá sí listen, porque hay que redibujar el listview cuando halla un nuevo scan
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, int i) => Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        onDismissed: (DismissDirection direction) {
          scanListProvider.deleteScanById(scans[i].id!);
        },
        child: ListTile(
          leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
          title: Text(scans[i].valor),
          subtitle: Text('${scans[i].id}'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            launchURL(context, scans[i]);
          },
        ),
      ),
    );
  }
}
