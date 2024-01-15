import 'package:bloc/bloc.dart';
import 'package:tugas_flutter/data/datasources/banner_remote_datasource.dart';
import 'package:tugas_flutter/data/models/banners_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banners_event.dart';
part 'banners_state.dart';
part 'banners_bloc.freezed.dart';

class BannersBloc extends Bloc<BannersEvent, BannersState> {
  BannersBloc() : super(const _Initial()) {
    on<_GetAll>((event, emit) async {
      emit(const _Loading());
      final response = await BannerRemoteDatasource().getBanners();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}