import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class LabReportDownloadViewModel with ChangeNotifier {

  Future<void> downloadFile(String url, String fileName) async {
    Dio dio = Dio();

    try {
      // Request permission to access storage
      await requestStoragePermission();

      // Get the download directory for Android and iOS
      Directory? directory;
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download'); // Android Downloads folder
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory(); // iOS documents folder
      }

      if (directory != null) {
        String filePath = '${directory.path}/$fileName';

        // Start the download
        await dio.download(
          url,
          filePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              print('Download progress: ${(received / total * 100).toStringAsFixed(0)}%');
            }
          },
        );

        print('File downloaded to $filePath');
      } else {
        print('Error: Unable to access the directory');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }
}

Future<void> requestStoragePermission() async {
  if (Platform.isAndroid) {
    if (await Permission.storage.request().isGranted) {
      print("Storage permission granted");
    } else {
      print("Storage permission denied");
    }
  } else if (Platform.isIOS) {
    // No specific storage permission is needed for iOS
    print("iOS permission not needed for storage");
  }
}
