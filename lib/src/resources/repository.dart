import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';


abstract class Repository {
   NewsDbProvider dbProvider = NewsDbProvider();
   NewsApiProvider apiProvider = NewsApiProvider();

    Future<ItemModel> fetchItem(int id) async {
      var item = await dbProvider.fetchItem(id);
      if (item != null) {
        return item;
      }
      item = await apiProvider.fetchItem(id);
      dbProvider.addItem(item);
      return item;
    }

    Future<List<int>> fetchTopIds() {
      return apiProvider.fetchTopIds();
    }
}