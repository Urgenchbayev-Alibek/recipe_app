sealed class TopChefsProfileEvent {}

final class TopChefsProfileLoading extends TopChefsProfileEvent {
  final int userId;
  TopChefsProfileLoading({required this.userId});
}