import 'package:flutter/material.dart';
import 'package:gallerio/controller/provider/providerapiservice.dart';
import 'package:gallerio/model/collection_model.dart';
import 'package:gallerio/model/photos_model.dart';

class ProviderController extends ChangeNotifier {
  ProviderApiService ntop = ProviderApiService();
  bool ispageloading = true;
  bool isbottomloading = false;


  // get photos
  List<Photos> photolist = [];
  getphotos(context,int page) async {
    if (photolist.isNotEmpty) {
      isbottomloading = true;
      notifyListeners();
      List<Photos> scrollphotos = await ntop.getphotos(context,page);
      photolist.addAll(scrollphotos);
    }else{
    photolist = await ntop.getphotos(context,page);
    }
    isbottomloading = false;
    notifyListeners();
  }
  getcollphotos(context,int page ) async {
    if (selectedcollection!=null) {
      isbottomloading = true;
      notifyListeners();
      List<Photos> scrollphotos = await ntop.getcollectionphotos(context,selectedcollection?.id,page);
      photolist.addAll(scrollphotos);
    }else{
     List<Photos> scrollphotos = await ntop.getphotos(context,page);
      photolist.addAll(scrollphotos);
    }
    isbottomloading = false;
    notifyListeners();
  }
  // get collection
  Collection? selectedcollection;
  List<Collection> collectionlist = [];
  getcollection(context) async {
   
    collectionlist = await ntop.getcollection(context);

    notifyListeners();
  }

  gethomepagedata(context,int page) async {
    ispageloading = true;
    await getcollection(context);
    if (collectionlist.isNotEmpty) {
      selectedcollection = collectionlist[0];
       await getcollphotos(context,page);
    }
   
    ispageloading = false;
  }


  
}