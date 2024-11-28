abstract class BannerStates {}

class BannerInt extends BannerStates {}

class BannerLoading extends BannerStates {}

class BannerLoaded extends BannerStates {
  final List<String> banners;

  BannerLoaded(this.banners);
}

class BannerError extends BannerStates {
  final String message;

  BannerError(this.message);
}
