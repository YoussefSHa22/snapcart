import 'dart:math';

import 'package:e_commerce/blocs/banners/banners_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/banner_service.dart';

class BannerCubit extends Cubit<BannerStates> {
  final BannerService _bannerService;

  BannerCubit(this._bannerService) : super(BannerInt());

  Future<void> fetchBanners() async {
    try {
      emit(BannerLoading());

      final banners = await _bannerService.fetchbanners();
      banners.shuffle(Random());

      emit(BannerLoaded(banners));
    } catch (e) {
      throw Exception('failed to load banners');
    }
  }
}
