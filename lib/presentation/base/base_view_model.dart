abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  //For shared variables and functions
}

abstract class BaseViewModelInputs {
  void start(); //Init funcs will be in
  void dispose(); //Kill the required funcs
}

abstract class BaseViewModelOutputs {}
