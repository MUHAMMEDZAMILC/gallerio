import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'help_toast.dart';

Future<void> downloadImage(context,String imageUrl, String fileName) async {
    try {
      if (await Permission.storage.request().isGranted) {
        Directory? downloadsDir = Directory('/storage/emulated/0/Download');

        if (!downloadsDir.existsSync()) {
          throw Exception('Downloads directory not found!');
        }
        if (!fileName.endsWith('.jpg')) {
          fileName += '.jpg';
        }
        final response = await http.get(Uri.parse(imageUrl));

        if (response.statusCode == 200) {
          String savePath = '${downloadsDir.path}/$fileName';
          File file = File(savePath);

          await file.writeAsBytes(response.bodyBytes);
          snackBar(context, message: 'Image saved to Downloads: $savePath',type: MessageType.success);
         
        } else {
          snackBar(context, message: 'Failed to download image',type: MessageType.success);
        }
      } else {
         snackBar(context, message: 'Permission denied',type: MessageType.success);
      }
    } catch (e) {
       snackBar(context, message: 'Error: $e',type: MessageType.success);


    }
  }