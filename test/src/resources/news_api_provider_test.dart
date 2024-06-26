import 'package:news/src/resources/news_api_provider.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:test/test.dart';


void main() { 
  test('FetchTopIds returns a list of ids', () async {
    final newsApi = NewsApiProvider();
    // setup of test case
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();

    expect(ids, [1, 2, 3, 4]);
  });

  test('FetchItem returns an ItemModel', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final Map<String, dynamic> jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(123);

    expect(item.id, 123);
  });
}