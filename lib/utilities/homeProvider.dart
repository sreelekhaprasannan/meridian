import 'package:flutter/material.dart';
import 'package:meridian/models/homelistModel.dart';
import 'package:meridian/services/apiServices.dart';

class ProviderHomePage extends ChangeNotifier {
  List<HomeListModel> homeTiledata = [];
  List<HomeListModel> detailsData = [];
  getData({required BuildContext context}) async {
    await ApiServices().getHomedata(context: context).then((value) {
      if (value != null) {
        homeTiledata.clear();
        value.forEach((element) {
          homeTiledata.add(HomeListModel(
              body: element['body'],
              id: element['id'],
              title: element['title'],
              userId: element['userId']));
        });
      }
    });
    notifyListeners();
  }

  Future getDetails({required BuildContext context}) async {
    await ApiServices().getDetailsdata(context: context).then((value) {
      if (value != null) {
        detailsData.clear();
        // value.forEach((element) {
        detailsData.add(HomeListModel(
            body: value['body'],
            id: value['id'],
            title: value['title'],
            userId: value['userId']));
        // });
      }
    });
    notifyListeners();
  }
}
