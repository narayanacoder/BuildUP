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
    submissionsArr.push(new Submission({
      name: "Mall Capacity Monitor",
      description: "Idea to allow the malls to function safely at reduced capacity.",
      numLikes: 2312,
      country: "America",
      author: "Dave OReilley",
      uploads: [{type:"ImageUrl", imageUrl: "images/mobileMall.jpg"}, 
        {type: "text", text: "John has come up with an idea of managing the crowds going to the indoor mall where he works - the idea will allow the mall to function safely at reduced capacity. People enter the mall typically via indoor parking lot. His idea is to limit the number of cars (with at least 2 passengers) entering the parking lot - as soon as the parking lot enters 1/4 capacity, mark lot as full.  A small fraction of the lot is probably already taken by mall employees. Parking lot capacity is defined by number of people entering the lot and not just cars. The lot is marked full when number passengers in the parking lot is at full capacity. \nEvery car entering this indoor mall needs to have the app that allows them to tag number of passengers. The 'lot capacity' indicator will show at a particular time, the capacity available. If a car has 6 passengers and lot has 4 available, it can not enter. However, if a car has 4 passengers, it can. Each car (and all its passengers) can only stay in the mall for a fixed duration - at most 2 hrs - for which they pay. Once the car exceeds it time capacity, security will be notified and the car can be 'towed' out.\nIn addition, image recognition AI techniques in the lot will detect if people entering the mall (at each entrance) have mask and gloves on. If not, the system will beep, bringing security in. Each person has to pay to purchase gloves and masks before they enter."}],
      comments: [{author: "Usman Muhammad", comment: "This is a great idea so we can go back to malls! I can't wait. ", numLikes: 21},
        {author: "Diego Simmons", comment: "Malls are a big source of income for our economy. I am so game with this approach, even if it means I have a chance of not getting into the mall. I just hope we have good security personnel to ensure mall customers follow the rules. As a furloughed employee of a store in a mall, I would love for this to happen, and I get back to work! I like that employees don't have to go through this app and we are guaranteed parking spots for our duration of work.", numLikes: 32},
        {author: "Karen Night", comment: "I am not sure if this idea will pan out for me. I don't to drive all the way to the mall to find out I can't get in!", numLikes: 2},
        {author: "Nick Miller", comment: "I need more than 2 hours in a mall. It's an experience, and 2hrs is too little time! But, I do like the idea of having a way of getting to the mall and bringing normal life back. Just extent the 2hrs to longer please!", numLikes: 6}],
      keywords: ["COVID", "Corona", "America", "US", "North America", "Mall", "crowded", "Social Distancing"],
      problemId: 222,
    }));

    for(var submissionItem of submissionsArr){
      this.submissionRepo.create(submissionItem);
    };



    setTimeout(() => {
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
        numLikes: 231,
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
      problemsArr.push(new Problem({
        name: "Malls are at high-risk for Covid-19 Spread",
        problemId: 222,
        description: "Malls are closed because of crowds and high propensity for spread of Covid-19.",
        numLikes: 7883,
        country: "America",
        author: "John Baggins",
        uploads: [{type:"ImageUrl", imageUrl: "images/crowdedMallProblem.jpg"}, {type: "text", text: "Many people who work in the mall lost their jobs, or were furloughed. There is no indication of when they'll go back to work."}],
        keywords: ["COVID", "Mall", "Crowd", "Social distancing", "America"]
      }));

      for(var problemItem of problemsArr){
        this.problemRepo.create(problemItem);
      };
  }, 10000);

  }

  /**
   * This method will be invoked when the application stops
   */
  async stop(): Promise<void> {
    // Add your logic for stop
  }
}
