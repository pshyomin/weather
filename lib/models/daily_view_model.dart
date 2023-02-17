class DailyViewModel {
  String? date;
  String? hour;
  int? tmn = 0;
  int? tmx = 0;
  String? sky = '0';
  int? pop = 0;
  DailyViewModel(
      {required this.date,
      required this.hour,
      this.tmn,
      this.tmx,
      this.sky,
      this.pop});
}
