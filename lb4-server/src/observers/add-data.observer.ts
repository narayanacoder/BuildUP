import {
  /* inject, Application, CoreBindings, */
  lifeCycleObserver, // The decorator
  LifeCycleObserver, // The interface
} from '@loopback/core';
//import the repository decorator
import {repository} from '@loopback/repository';

//import from LB app
import {SubmissionRepository} from '../repositories';
import {Submission} from '../models';

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
) {}

  /**
   * This method will be invoked when the application starts
   */
  async start(): Promise<void> {
    // Add your logic for start
    //seed the repository
    let count: number = (await this.submissionRepo.count()).count;
    if (count !== 0) return;

    let submissionsArr = [];
    submissionsArr.push(new Submission({
      name: "Cafe Space Organizer",
      description: "New age Covid solution to modernize cafe space organization to enforce social distancing.",
      numLikes: 18221,
      country: "Canada",
      author: "Lisa Simmons",
      uploads: [{type:"ImageUrl", imageUrl: "images/cafe.jpg"}],
      keywords: ["COVID", "Corona", "Canada", "US", "America", "North America", "Cafe", "Restaurant", "local business", "Space", "Social Distancing"]
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

  }

  /**
   * This method will be invoked when the application stops
   */
  async stop(): Promise<void> {
    // Add your logic for stop
  }
}
