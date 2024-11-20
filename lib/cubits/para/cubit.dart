import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/para/para.dart';
part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class ParaCubit extends Cubit<JuzState> {
  static ParaCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<ParaCubit>(context, listen: listen);

  ParaCubit() : super(JuzDefault());

  final repo = ParaRepository();

  Future<void> fetch(num juzNumber) async {
    emit(const ParaFetchLoading());

    try {
      Para? cached = await repo.paraFetchHive(juzNumber);
      if (cached == null) {
        Para? data = await repo.juzFetchApi(juzNumber);
        emit(ParaFetchSuccess(data: data));
      } else {
        emit(ParaFetchSuccess(data: cached));
      }
    } catch (e) {
      emit(JuzFetchFailed(message: e.toString()));
    }
  }
}
