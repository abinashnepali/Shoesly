import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  ApiResponse({this.error, this.data, this.isLoading = false});

  T? data;
  T? error;
  bool isLoading;

  bool get hasData => data != null;
  bool get hasError => error != null;
  bool get isInitial => !hasData && !hasError;

  @override
  List<Object?> get props => [data, error, isLoading];
}
