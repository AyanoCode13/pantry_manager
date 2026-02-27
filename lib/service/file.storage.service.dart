import 'dart:io';

import 'package:path_provider/path_provider.dart';

final class FileStorageService {
  const FileStorageService();
  Future<Directory> _getBaseDir() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir;
  }

  Future<String> saveFile(File file, String fileName, String folder) async {
    final baseDir = await _getBaseDir();
    final targetDir = Directory('${baseDir.path}/$folder');

    if (!await targetDir.exists()) {
      await targetDir.create(recursive: true);
    }

    final newPath = '${targetDir.path}/${file.path.split('/').last}';
    await file.copy(newPath);

    return newPath;
  }

  Future<File?> getFile(String folder, String fileName) async {
    final baseDir = await _getBaseDir();
    final path = '${baseDir.path}/$folder/$fileName';
    final file = File(path);
    return await file.exists() ? file : null;
  }

  Future<void> deleteFiles(String folder) async {
    final baseDir = await _getBaseDir();
    final targetDir = Directory('${baseDir.path}/$folder');
    await targetDir.delete(recursive: true);
  }
}
