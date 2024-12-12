part of 'all_list_coins_bloc.dart';

sealed class AllListCoinsState extends Equatable {
  const AllListCoinsState();
  
  @override
  List<Object> get props => [];
}

final class AllListCoinsInitial extends AllListCoinsState {}
