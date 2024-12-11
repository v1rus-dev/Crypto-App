part of 'one_coin_details_bloc.dart';

// ignore: must_be_immutable
final class OneCoinDetailsState extends Equatable {
  CryptoCoin coin;
  bool isLoading;
  double price;
  double maxPrice;
  double lowerPrice;
  double changePrcDay;
  History history;

  OneCoinDetailsState(
      {required this.coin,
      this.isLoading = false,
      this.price = 0,
      this.maxPrice = 0,
      this.lowerPrice = 0,
      this.changePrcDay = 0,
      this.history =
          const History(minuteHistory: [], hourHistory: [], dayHistory: [])});

  @override
  List<Object?> get props =>
      [coin, isLoading, price, maxPrice, lowerPrice, changePrcDay, history];
  OneCoinDetailsState copyWith(
      {CryptoCoin? coin,
      bool? isLoading,
      double? price,
      double? maxPrice,
      double? lowerPrice,
      double? changePrcDay,
      History? history}) {
    return OneCoinDetailsState(
        coin: coin ?? this.coin,
        isLoading: isLoading ?? this.isLoading,
        price: price ?? this.price,
        maxPrice: maxPrice ?? this.maxPrice,
        lowerPrice: lowerPrice ?? this.lowerPrice,
        changePrcDay: changePrcDay ?? this.changePrcDay,
        history: history ?? this.history);
  }
}

final class History extends Equatable {
  const History(
      {required this.minuteHistory,
      required this.hourHistory,
      required this.dayHistory});
  final List<Spot> minuteHistory;
  final List<Spot> hourHistory;
  final List<Spot> dayHistory;

  @override
  List<Object?> get props => [minuteHistory, hourHistory, dayHistory];
}

final class Spot extends Equatable {
  final double x;
  final double y;

  const Spot({required this.x, required this.y});

  @override
  List<Object?> get props => [x, y];
}
