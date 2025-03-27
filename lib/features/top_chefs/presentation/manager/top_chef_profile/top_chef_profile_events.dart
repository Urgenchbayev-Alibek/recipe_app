sealed class TopChefProfileEvent{}

class TopChefsProfileLoading extends TopChefProfileEvent{
  final int profileId;
  TopChefsProfileLoading({required this.profileId});
}