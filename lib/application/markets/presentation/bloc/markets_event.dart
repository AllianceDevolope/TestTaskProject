abstract class MarketsEvent {}

class GetMarketsEvent extends MarketsEvent {
  final int limit;
  final int offset;

  GetMarketsEvent({required this.limit, required this.offset});
}
