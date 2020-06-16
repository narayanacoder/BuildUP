class Submission{
  String imageUrl;
  String submissionName;
  String numLikes;
  String country;

  Submission({this.imageUrl, this.submissionName, this.numLikes, this.country});
}

List<Submission> submissions = [
  Submission(
    imageUrl: "images/cafe.jpg",
      submissionName: "Cafe Space Organizer",
      numLikes: "18221",
      country: "Canada",
  ),
  Submission(
      imageUrl: "images/mobile.jpg",
      submissionName: "Online Queue System",
      numLikes: "7832",
      country: "United States",
  ),
  Submission(
      imageUrl: "images/cinema.jpg",
      submissionName: "Movies Distancing",
      numLikes: "2386",
      country: "Italy",
  ),
];