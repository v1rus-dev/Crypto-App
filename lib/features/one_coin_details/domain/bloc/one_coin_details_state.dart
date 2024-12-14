part of 'one_coin_details_bloc.dart';

final class OneCoinDetailsState extends Equatable {
  final String coinName;
  final String fullCoinName;
  final bool isLoading;
  final CoinBaseInfo coinBaseInfo;
  final List<CoinHistoryInfo> historyInfoMinute;
  final List<CoinHistoryInfo> historyInfoHour;
  final List<CoinHistoryInfo> historyInfoDay;

  const OneCoinDetailsState(
      {required this.coinName,
      required this.fullCoinName,
      required this.isLoading,
      required this.coinBaseInfo,
      required this.historyInfoMinute,
      required this.historyInfoHour,
      required this.historyInfoDay});

  @override
  List<Object?> get props => [
        coinName,
        fullCoinName,
        isLoading,
        coinBaseInfo,
        historyInfoMinute,
        historyInfoHour,
        historyInfoDay,
      ];
  OneCoinDetailsState copyWith({
    String? coinName,
    String? fullCoinName,
    bool? isLoading,
    CoinBaseInfo? coinBaseInfo,
    List<CoinHistoryInfo>? historyInfoMinute,
    List<CoinHistoryInfo>? historyInfoHour,
    List<CoinHistoryInfo>? historyInfoDay,
  }) {
    return OneCoinDetailsState(
      coinName: coinName ?? this.coinName,
      fullCoinName: fullCoinName ?? this.fullCoinName,
      isLoading: isLoading ?? this.isLoading,
      coinBaseInfo: coinBaseInfo ?? this.coinBaseInfo,
      historyInfoMinute: historyInfoMinute ?? this.historyInfoMinute,
      historyInfoHour: historyInfoHour ?? this.historyInfoHour,
      historyInfoDay: historyInfoDay ?? this.historyInfoDay,
    );
  }
}
