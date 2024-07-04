
import 'package:flutter/cupertino.dart';
import 'package:random_quote_gen/repositry/quote_repository.dart';

import '../model/quote_model.dart';

class QuoteViewModel extends ChangeNotifier{
  List<QuoteModel> _quotes = [];
  bool _isloading = false;
  String? _errorMessage;

  List<QuoteModel> get quotes => _quotes;
  bool get isloading => _isloading;
  String? get errorMessage => _errorMessage;

  final QuoteRepository _quoteRepository = QuoteRepository();

  Future<void> fetchQuotes() async{
    _isloading = true;
    notifyListeners();

    try{
        _quotes = await _quoteRepository.fetchQuotes();
        _errorMessage = null;
    }catch(e){
      _errorMessage = e.toString();

    }finally{
    _isloading= false;
    notifyListeners();
  }
  }

  }


