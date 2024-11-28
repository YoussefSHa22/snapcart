import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/products_service.dart';
import 'search_states.dart';

class SearchCubit extends Cubit<SearchState> {
  final ProductService productService;

  SearchCubit(this.productService) : super(SearchInitial());

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    try {
      final results = await productService.searchProducts(query);
      emit(SearchLoaded(results));
    } catch (e) {
      emit(SearchError("Failed to load search results"));
    }
  }
}
