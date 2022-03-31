import 'package:flutter/cupertino.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(valor: value);
    final id = await DBProvider.db.newScan(newScan);

    // Asignar el id de la base de datos al modelo
    newScan.id = id;
    if (selectedType == newScan.tipo) {
      scans.add(newScan);

      notifyListeners();
    }
    return newScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = scans != null ? [...scans] : [];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = scans != null ? [...scans] : [];
    selectedType = type;
    notifyListeners();
  }

  deleteAll() async {
    DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScansByType(selectedType);
    notifyListeners();
  }
}
