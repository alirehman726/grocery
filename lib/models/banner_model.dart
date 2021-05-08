class BannerModel {
  final String bannerId;
  final String bannerLink;
  final String bannerImageLink;

  BannerModel(this.bannerId, this.bannerLink, this.bannerImageLink);

  static List<BannerModel> fetchAll() {
    return [
      BannerModel(
        "0001",
        "https://www.demo2.com",
        "https://dev.qalbit.com/grocery/banner2.png",
      ),
      BannerModel(
        "0002",
        "https://www.demo1.com",
        "https://dev.qalbit.com/grocery/banner1.png",
      ),
      BannerModel(
        "0003",
        "https://www.demo4.com",
        "https://dev.qalbit.com/grocery/banner4.png",
      ),
      BannerModel(
        "0004",
        "https://www.demo3.com",
        "https://dev.qalbit.com/grocery/banner3.png",
      )
    ];
  }
}
