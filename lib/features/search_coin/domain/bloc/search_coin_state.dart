part of 'search_coin_bloc.dart';

sealed class SearchCoinState extends Equatable {
  const SearchCoinState();
  
  @override
  List<Object> get props => [];
}

final class SearchCoinInitial extends SearchCoinState {}
