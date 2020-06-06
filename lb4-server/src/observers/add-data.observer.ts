import {
  /* inject, Application, CoreBindings, */
  lifeCycleObserver, // The decorator
  LifeCycleObserver, // The interface
} from '@loopback/core';
//import the repository decorator
import {repository} from '@loopback/repository';

//import from LB app
import {SubmissionRepository, ProblemRepository} from '../repositories';
import {Submission, Problem} from '../models';

/**
 * This class will be bound to the application as a `LifeCycleObserver` during
 * `boot`
 */
@lifeCycleObserver('AddDataGroup')
export class AddDataObserver implements LifeCycleObserver {
  /*
  constructor(
    @inject(CoreBindings.APPLICATION_INSTANCE) private app: Application,
  ) {}
  */
 constructor(
  @repository('SubmissionRepository') private submissionRepo: SubmissionRepository,
  @repository('ProblemRepository') private problemRepo: ProblemRepository,
) {}

  /**
   * This method will be invoked when the application starts
   */
  async start(): Promise<void> {
    // Add your logic for start
    //seed the repository
    let count: number = (await this.submissionRepo.count()).count;
    if (count !== 0) return;

    //submissions --------------------
    let submissionsArr = [];
    submissionsArr.push(new Submission({
      name: "Cafe Space Organizer",
      description: "New age Covid solution to modernize cafe space organization to enforce social distancing.",
      numLikes: 18221,
      country: "Canada",
      author: "Lisa Simmons",
      uploads: [{type:"ImageUrl", imageUrl: "images/cafe.jpg"}],
      keywords: ["COVID", "Corona", "Canada", "US", "America", "North America", "Cafe", "Restaurant", "local business", "Space", "Social Distancing"],
      comments: [{author:"Ben Grady", comment: "Love this idea!"}, {author:"Jill Lane", comment: "Every cafe should implement this."}],
      problemId: 111,
    }));
    submissionsArr.push(new Submission({
      name: "Online Queue System",
      description: "Queue up for any business in your local community, and attend at your allotted timeslot, minimize wait times and exposure.",
      numLikes: 15277,
      country: "America",
      author: "John White",
      uploads: [{type:"ImageUrl", imageUrl: "images/mobile.jpg"}],
      keywords: ["COVID", "Corona", "Canada", "US", "America", "North America", "Global", "Community", "businesses", "Queue"]
    }));
    submissionsArr.push(new Submission({
      name: "Movies Distancing",
      description: "Miss going to the Cinema? Our solution is just what your community needs to make visiting the cinema once again a safe worry free experience.",
      numLikes: 14386,
      country: "Italy",
      author: "Ayeesha Mahummad",
      uploads: [{type:"ImageUrl", imageUrl: "images/cinema.jpg"}],
      keywords: ["COVID", "Corona", "Italy", "Community", "cinema", "entertainment", "theatre", "movies", "social distancing"]
    }));
    submissionsArr.push(new Submission({
      name: "Grocery line up organization roster",
      description: "Innovative strategy to organize grocery store visits",
      numLikes: 466,
      country: "Germany",
      author: "Jane Li",
      uploads: [{type:"ImageUrl", imageUrl: "images/groceryCategory.jpg"}],
      keywords: ["COVID", "Corona", "Germany", "Community", "grocery", "line up", "queue"]
    }));
    submissionsArr.push(new Submission({
      name: "Park Distancing Strategy",
      description: "Solution to keeping kids safe during your park visits.",
      numLikes: 771,
      country: "Canada",
      author: "Jake Collins",
      uploads: [{type:"ImageUrl", imageUrl: "images/parksCategory.jpg"}],
      keywords: ["COVID", "Corona", "Canada", "US", "America", "North America", "Park", "Space", "Social Distancing"]
    }));

    for(var submissionItem of submissionsArr){
      this.submissionRepo.create(submissionItem);
    };


    //problems ------------------
    let problemsArr = [];
    problemsArr.push(new Problem({
      problemId: 111,
      name: "Small Restaurant Engagement",
      description: "Restaurant in need of support and ideas to make customers feel safe to visit a tight-spaced resturant environment.",
      numLikes: 3871,
      country: "Canada",
      author: "Jake Evans",
      uploads: [{type:"ImageUrl", imageUrl: "images/restaurantProblem.jpg"}],
      keywords: ["COVID", "Restaurant", "Canada"]
    }));
    problemsArr.push(new Problem({
      name: "Social Distancing at Local Day Care Center",
      description: "Local day care center looking for ideas to keep young ones safe and help them understand the need to social distance.",
      numLikes: 7883,
      country: "Australia",
      author: "Megg Myers",
      uploads: [{type:"ImageUrl", imageUrl: "images/dayCareProblem.jpg"}],
      keywords: ["COVID", "DayCare", "Australia"]
    }));
    problemsArr.push(new Problem({
      name: "Indoor playgrounds for children need help",
      description: "Recently re-opened children's play area but have no customers, how can we make this area safe for our children.",
      numLikes: 3631,
      country: "Germany",
      author: "Ben Simon",
      uploads: [{type:"ImageUrl", imageUrl: "images/playgroundProblem.jpg"}],
      keywords: ["COVID", "Kids", "Germany"]
    }));
    problemsArr.push(new Problem({
      name: "Curb side pick-up for busy resturant with line-ups",
      description: "Our restaurant can tend to get very busy, but with only curb-side pickup being allowed. The lineups outside are getting really long.",
      numLikes: 2644,
      country: "Germany",
      author: "Lily Day",
      uploads: [{type:"ImageUrl", imageUrl: "images/curbSideProblem.jpg"}],
      keywords: ["COVID", "Restaurant", "Germany"]
    }));

    for(var problemItem of problemsArr){
      this.problemRepo.create(problemItem);
    };

  }

  /**
   * This method will be invoked when the application stops
   */
  async stop(): Promise<void> {
    // Add your logic for stop
  }
}
