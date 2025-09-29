class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: 'assets/images/onboarding/1.png',
    title: 'Welcome to the Arena Book app',
    description: 'Everything you need to book your favorite stadium is at your fingertips… easy, fast, and risk-free.',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding/2.png',
    title: 'Find your playground ',
    description:
        'Browse stadiums around you by location, time, or additional services.',
  ),
  OnboardingModel(
    image: 'assets/images/onboarding/3.png',
    title: 'Book easily and quickly',
    description: 'Choose the right field, according to your time, and complete monitoring in simple steps with secure payment options.',
  ),
];
