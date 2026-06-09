abstract class Baseviewmodel implements BaseViewModelInputs,BaseViewModelOutputs{
  // vars & functions shared between all the view models 
  }

abstract class BaseViewModelInputs{// receives data from view (view => viewModel)
  void start(); //

  void dispose();// called when the view model ends

}

abstract class BaseViewModelOutputs{// sends data to view (viewModel => view)

}