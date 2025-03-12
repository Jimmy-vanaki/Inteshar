import 'package:inteshar/app/features/home/data/models/home_model.dart';
import 'package:inteshar/app/features/home/data/data_source/home_api_provider.dart';

class HomeRepository {
  final HomeApiProvider homeApiProvider;

  HomeRepository(this.homeApiProvider);

  Future<void> fetchHomeData() async {
    try {
      await homeApiProvider.fetchHomeData();
    } catch (e) {
      rethrow;
    }
  }

  List<HomeModel> getHomeData() {
    return homeApiProvider.homeDataList;
  }
}
