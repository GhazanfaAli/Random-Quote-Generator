import 'package:random_quote_gen/model/quote_model.dart';
import 'package:random_quote_gen/services/api_service.dart';

class QuoteRepository{

  final QuoteApi _quoteApi = QuoteApi();

  Future<List<QuoteModel>> fetchQuotes() async{
    return await _quoteApi.get_quote_model();
  }

}