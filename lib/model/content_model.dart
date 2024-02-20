class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: "Pick Your Food From Our Menu\n More than 35 times",
      image: "Assets/screen1.png",
      title: "Select from Our\n Best menu"),
  UnboardingContent(
      description: "You can pay on Delivery\n and card payment ",
      image: "Assets/screen2.png",
      title: "Easy and Online Payments"),
  UnboardingContent(
      description: "Deliver Your foods at \n your door step!",
      image: "Assets/screen3.png",
      title: "Quick Delivery at your door step"),
];
