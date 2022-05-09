// inputs mean that "Orders" that our view model will receive from view
abstract class OnboardingViewModelInputs {
  int goToPreviousPage();
  int goToNextPage();
  void onPageChange(int index);
  Sink get inputSliderViewObject; // this is the way to add data to the stream
}
