import 'package:dio/dio.dart';
import 'package:rick_morty_app/data/models/episode_model.dart';

class GetEpisodeDataRepo {
  final Dio dio;
  GetEpisodeDataRepo({required this.dio});

  Future<EpisodeModel> getEpisodeData({required String url}) async {
    final Response response = await dio.get(url);
    return EpisodeModel.fromJson(response.data);
  }
}
