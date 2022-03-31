import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/addresses_page.dart';
import 'package:qr_scanner/pages/maps_history_page.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/custom_navigation_bar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);
                scanListProvider.deleteAll();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const Center(
        child: _HomePageBody(),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final selectedPage = uiProvider.selectedMenuOption;
    // Usar el Scan List Provider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    DBProvider.db.database;

    switch (selectedPage) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapsHistoryPage();
      case 1:
        scanListProvider.loadScansByType('http');
        return const AdressesPage();

      default:
        return const MapsHistoryPage();
    }
  }
}
