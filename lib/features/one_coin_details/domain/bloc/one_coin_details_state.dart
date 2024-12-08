part of 'one_coin_details_bloc.dart';

// ignore: must_be_immutable
final class OneCoinDetailsState extends Equatable {
  CryptoCoin? coin;
  bool isLoading;
  double price;
  double maxPrice;
  double lowerPrice;
  double changePrcDay;

  OneCoinDetailsState(
      {this.coin,
      this.isLoading = false,
      this.price = 0,
      this.maxPrice = 0,
      this.lowerPrice = 0,
      this.changePrcDay = 0});

  @override
  List<Object?> get props =>
      [coin, isLoading, price, maxPrice, lowerPrice, changePrcDay];
  OneCoinDetailsState copyWith(
      {CryptoCoin? coin,
      bool? isLoading,
      double? price,
      double? maxPrice,
      double? lowerPrice,
      double? changePrcDay}) {
    return OneCoinDetailsState(
        coin: coin ?? this.coin,
        isLoading: isLoading ?? this.isLoading,
        price: price ?? this.price,
        maxPrice: maxPrice ?? this.maxPrice,
        lowerPrice: lowerPrice ?? this.lowerPrice,
        changePrcDay: changePrcDay ?? this.changePrcDay);
  }
}
