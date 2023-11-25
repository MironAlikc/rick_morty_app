import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_app/data/models/charecter_model.dart';
import 'package:rick_morty_app/data/repositories/get_chars_repo.dart';

part 'chars_event.dart';
part 'chars_state.dart';

class CharsBloc extends Bloc<CharsEvent, CharsState> {
  CharsBloc({required this.repo}) : super(CharsInitial()) {
    on<GetCharsList>(
      (event, emit) async {
        try {
          final model = await repo.getData(
            name: event.name,
            gender: event.gender,
            status: event.status,
          );
          emit(
            CharsSuccess(model: model),
          );
        } catch (e) {
          emit(
            CharsError(),
          );
        }
      },
    );
  }
  final GetCharsRepo repo;
}
