import 'package:dio/dio.dart';
import 'package:rick_morty_app/data/models/charecter_model.dart';

class GetCharsRepo {
  final Dio dio;
  GetCharsRepo({required this.dio});

  Future<CharacterModel> getData({
    String? name,
    String? status,
    String? gender,
  }) async {
    final Response response = await dio.get(
      'character/',
      queryParameters: {
        "name": name,
        "status": status,
        "gender": gender,
      },
    );

    return CharacterModel.fromJson(response.data);
  }
}
