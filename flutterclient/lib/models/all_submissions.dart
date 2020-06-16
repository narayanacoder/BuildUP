class Submission{
  String imageUrl;
  String submissionName;
  String numLikes;
  String country;
  String description;
  String author;
  List keywords;

  Submission({this.imageUrl, this.submissionName, this.numLikes, this.country, this.description, this.author, this.keywords});
}

List<Submission> submissions = [
  Submission(
      imageUrl: "images/cafe.jpg",
      submissionName: "Cafe Space Organizer",
      numLikes: "18221",
      country: "Canada",
      description: "New age Covid solution to modernize cafe space organization to enforce social distancing.",
      author: "Lisa Simmons",
      keywords: ["COVID", "Corona", "Canada", "US", "United States", "United States", "Cafe", "Restaurant", "local business", "Space", "Social Distancing"]
  ),
  Submission(
      imageUrl: "images/mobile.jpg",
      submissionName: "Online Queue System",
      numLikes: "7832",
      country: "United States",
      description: "Queue up for any business in your local community, and attend at your allotted timeslot, minimize wait times and exposure.",
      author: "John White",
      keywords: ["COVID", "Corona", "Canada", "US", "United States", "United States", "Global", "Community", "businesses", "Queue"]
  ),
  Submission(
      imageUrl: "images/cinema.jpg",
      submissionName: "Movies Distancing",
      numLikes: "2386",
      country: "Italy",
      description: "Miss going to the Cinema? Our solution is just what your community needs to make visiting the cinema once again a safe worry free experience.",
      author: "Ayeesha Mahummad",
      keywords: ["COVID", "Corona", "Italy", "Community", "cinema", "entertainment", "theatre", "movies", "social distancing"]
  ),
  Submission(
      imageUrl: "images/groceryCategory.jpg",
      submissionName: "Grocery line up organization roster",
      numLikes: "466",
      country: "Germany",
      description: "Innovative strategy to organize grocery store visits",
      author: "Jane Li",
      keywords: ["COVID", "Corona", "Germany", "Community", "grocery", "line up", "queue"]
  ),
];