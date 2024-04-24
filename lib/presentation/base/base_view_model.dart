abstract class BaseViewModel
    implements BaseViewModelInputs, BaseViewModelOutputs {
  // Contains variables and functions that will be used through any view model.
}

abstract class BaseViewModelInputs {
  void init(); // Start View Model Job
  void dispose(); // Called when view model dies.
}

abstract class BaseViewModelOutputs {}
