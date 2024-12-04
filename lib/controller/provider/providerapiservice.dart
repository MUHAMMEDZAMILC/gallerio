import 'dart:developer';
import 'dart:io';

import 'package:gallerio/model/collection_model.dart';
import 'package:gallerio/model/photos_model.dart';
import 'package:gallerio/utils/globalvariable.dart';
import 'package:http/http.dart' as http;
import '../../utils/helper/help_toast.dart';
import '../../utils/theme/colors.dart';
import '../api/urls.dart';

class ProviderApiService {

  

  // get photos api service
  getphotos(context,int page) async {
     var url = "$baseUrl$getphotosUrl?page=$page&client_id=$accesskey";
    log(url);
    List<Photos> emptyemp = [];
    try {
      final Uri uri = Uri.parse(url);
      var response = await http.get(uri,);
      log(response.body);
      if (response.statusCode == 200) {
        return photosFromJson(response.body);
      } else {
        snackBar(context,
            message: "Failed Load Photos",
            type: MessageType.warning,
            kcolor: ColorResources.RED);
        return emptyemp;
      }
    } on SocketException {
      snackBar(context,
          message: "No Network Connection", type: MessageType.error);
      return emptyemp;
    } catch (e) {
      snackBar(context,
          message: "Failed Load Photos",
          type: MessageType.warning,
          kcolor: ColorResources.RED);

      return emptyemp;
    }
  }
  // get collection api service
  getcollection(context) async {
     var url = "$baseUrl$colledctionUrl?client_id=$accesskey";
    log(url);
    List<Collection> emptyemp = [];
    try {
      final Uri uri = Uri.parse(url);
      var response = await http.get(uri,);
      log(response.body);
      if (response.statusCode == 200) {
        return collectionFromJson(response.body);
      } else {
        snackBar(context,
            message: "Failed Load Collection",
            type: MessageType.warning,
            kcolor: ColorResources.RED);
        return emptyemp;
      }
    } on SocketException {
      snackBar(context,
          message: "No Network Connection", type: MessageType.error);
      return emptyemp;
    } catch (e) {
      snackBar(context,
          message: "Failed Load Collection",
          type: MessageType.warning,
          kcolor: ColorResources.RED);

      return emptyemp;
    }
  }

  // get photos api service
  getcollectionphotos(context,collectionid,int page) async {
     var url = "$baseUrl$colledctionUrl/$collectionid/$getphotosUrl?page=$page&client_id=$accesskey";
    log(url);
    List<Photos> emptyemp = [];
    try {
      final Uri uri = Uri.parse(url);
      var response = await http.get(uri,);
      log(response.body);
      if (response.statusCode == 200) {
        return photosFromJson(response.body);
      } else {
        snackBar(context,
            message: "Failed Load Photos",
            type: MessageType.warning,
            kcolor: ColorResources.RED);
        return emptyemp;
      }
    } on SocketException {
      snackBar(context,
          message: "No Network Connection", type: MessageType.error);
      return emptyemp;
    } catch (e) {
      snackBar(context,
          message: "Failed Load Photos",
          type: MessageType.warning,
          kcolor: ColorResources.RED);

      return emptyemp;
    }
  }
  
}