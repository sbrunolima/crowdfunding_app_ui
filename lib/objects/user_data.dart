class UserData {
  final String id;
  final String name;
  final String userImageUrl;
  final String userBannerUrl;
  final String userCategory;
  final String userDescription;
  final double userFollowers;
  final double userRewards;
  final double donationGoal;
  final double donationRecenved;
  final List<String> userSuporters;

  UserData({
    required this.id,
    required this.name,
    required this.userImageUrl,
    required this.userBannerUrl,
    required this.userCategory,
    required this.userDescription,
    required this.userFollowers,
    required this.userRewards,
    required this.donationGoal,
    required this.donationRecenved,
    required this.userSuporters,
  });
}
