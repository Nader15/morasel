import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
  Future<String> get _localPath async {
    if (GetPlatform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      return directory!.path;
    } else if (GetPlatform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    } else {
      return 'No';
    }
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<File> writeData(String contents) async {
    final file = await _localFile;
    return file.writeAsString(contents);
  }

  Future<String> readData() async {
    String data = "Data";
    final file = await _localFile;

    if (await file.exists()) {
      try {
        String data = await file.readAsString();
        return data;
      } catch (e) {
        return "Nothing";
      }
    }
    return data;
  }
}
