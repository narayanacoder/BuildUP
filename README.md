<!-- Header -->
<a href="https://github.com/narayanacoder/BuildUP">
    <img src="doc/images/buildUpIconBlueBlackSquareSmallGitHub.png">
</a>

<!-- omit in toc -->
<h1 align="center" style="font-size:42px">
  BuildUP
</h1>

> This package was implemented using [Flutter](https://flutter.dev/) and [LoopBack 4](https://loopback.io/doc/en/lb4/)
> and applies design standards and color themes based on the [Carbon Design System](https://www.carbondesignsystem.com/).
> The database used for all data storage is [IBM Cloudant](https://www.ibm.com/cloud/cloudant).
> Additionally, [Watson Studio](https://www.ibm.com/ca-en/cloud/watson-studio) and [Jupyter Notebook](https://jupyter.org/) on the [IBM Cloud](https://cloud.ibm.com) are utilised for review insights.
> The solution's reward system also makes use of [IBM Blockchain Platform](https://www.ibm.com/cloud/blockchain-platform/).

<!-- Quick Links -->
<div align="center">
<a href="">View Demo</a>
·
<a href="https://github.com/narayanacoder/BuildUP/issues">Report Bug</a>
</div>

----



## Authors

- [Carla Aravena](https://www.linkedin.com/in/carla-aravena/)
- [Narayana Madineni](https://www.linkedin.com/in/narayana-m-696b6230/)
- [Jessica Nahulan](https://www.linkedin.com/in/jessicanahulan/)
- [Harini Srinivasan](https://www.linkedin.com/in/harini-srinivasan-47b63b/)
- [Jessika Welch](https://www.linkedin.com/in/jessika-welch/)


## Contents

1. [Overview](#overview)
2. [The idea](#the-idea)
3. [How it works](#how-it-works)
4. [Diagrams](#diagrams)
5. [Documents](#documents)
6. [Technology](#technology)
7. [Getting started](#getting-started)
8. [Roadmap](#roadmap)
9. [Resources](#resources)
10. [License](#license)

## Overview

### What's the problem?

[4 out of 5 workers are affected by COVID-19 worldwide - United Nations](https://www.npr.org/sections/coronavirus-live-updates/2020/04/07/828778490/4-of-5-workers-are-affected-by-covid-19-worldwide-u-n-agency-says)

[1.6 billion people are at risk of losing livelihoods - International Labor Organization](https://news.un.org/en/story/2020/04/1062792)

[100,000 US small businesses have closed forever - Washington Post](https://www.washingtonpost.com/business/2020/05/12/small-business-used-define-americas-economy-pandemic-could-end-that-forever/)

Covid-19 has created new challenges and has impacted many lives and small businesses.

Due to the covid-19 pandemic, all of us are hearing about the new normal. But what does that mean? 
One person cannot find all the answers, but together we can. 

What is needed is a solution that empowers communities and small businesses to easily connect and solve problems for each other.

### How can technology help?

Mobile, web, and cloud services enable rapid deployment of applications that can empower cooperation in the community. [IBM Cloudant](https://www.ibm.com/cloud/cloudant/) is a fully managed scalable distributed database service for hybrid multicloud applications on [IBM Cloud](https://cloud.ibm.com) that allows you to store data for web and mobile applications.

Creating a cloudant database to store application data can help you address the issues such as responsiveness that users may face when using an application with millions of users. Cloudant database is optimized for handling heavy workloads for large, fast-growing web and mobile apps.

 [IBM Watson Studio](https://www.ibm.com/cloud/watson-studio/) is used to simplify and scale data science across any cloud. It can be used to build and train Artificial Intellgence models. With its open, flexible multicloud architecture, Watson Studio provides capabilities that empower applications to simplify enterprise data science and AI.
 
Creating a Watson Studio instance to perform summarization, topic modelling/theme identification, word cloud generation, top reviews identification and sentiment analysis on review comments can help applications with thousands of comments to quickly get useful insights.


[IBM Blockchain Platform](https://www.ibm.com/cloud/blockchain-platform/) is used to allow build networks that leverage blockchain technology faster using Hyperledger Fabric. Web applications can leverage the platform to use the benefits of a blockchain.

Creating a rewards program network on a local Fabric network, installing and instantiating a smart contract through IBM Blockchain extension for VS Code can help applications reward points for community who help solve business problems through innovative solutions. Small businesses may reward community members who solve their problems. Community members are encouraged to solve more problems and work towards redeeming rewards by partner small businesses.


## The idea

The goal is to provide a mobile application, along with server-side components, that serves as the basis for developers to build out a community cooperation application that addresses real-time problems posed by small and local businesses in their struggle to fight against the challenges posed by COVID-19. 

It would allow both "Small businesses" (such as a store or a business which is facing challenges due to Covid-10) to post their problems in anticipation of innovative solutions;and community members ("Students/Unemployed/Anyone") to think of solutions to the posted problems, sketch solutions and submit the solutions. The innovator can share the solution through social media. Innovators can also submit their solutions as well as comment on the solutions of other innovators. Watson studio performs sentiment analysis, identifies themes, top strong comments and generates word clouds on review comments The best solution is identified and rewarded by the local business. Local businesses can implement the solution and submit the impact created.

The implemented solution went beyond our initial goals and now allows not just businesses to post problems, but anyone, and in addition to this, the problems aren't limited to just COVID-related but any issue. This makes the solution a great starting point for addressing problems, related to Global Warming, as well as any emergency which we may face in the future.

![BuildUP architecture diagram](/doc/images/Architecturev3.jpg)

## How it works

A problem poster (who may be a normal individual, a small business owner or a large business) that is facing challenges due to COVID-19 posts the problem title, description and images/video of the problem using the mobile application or web application. He/she typically fills out a brief form that describes the problem. This information is then stored in a cloudant database in the IBM Cloud.

A problem solver/innovator, who believes in community cooperation and solving problems together, opens the mobile application and can browse/search the problems posted based on the individual's preferences. He/she picks a problem, draws sketches or takes a video and uploads the title, description and images/videos about the solution. Multiple innovators can submit solutions using the user interface as well as comment on other solutions. They can share solutions through social networks to encourage collaboration and attract feedback. The application also displays identified themes, top strong comments and word cloud for the review comments. 

The problem poster(small local business owner) can choose the best solution, implement the solution and post the outcomes. The business owner rewards the innovator who posted the best solution. Using Watson AI, other similar business owners will be notified about the problem, best solution and impact based on the similarities in the profile so that they can implement the same solution for their business.

## Diagrams

![BuildUP architecture diagram](/doc/demos/ScrollThroughPages_gif.gif)


BuildApp combines sentiment analysis (Watson Studio), Cloudant data storage to hold the profiles, problems, solutions and review comments to get users the information they need.

1. The Business Owner launches the mobile app and can access information across multiple services.
2. The Business Owner can post problems and get innovative solutions from innovators to solve those problems.
3. The Business Owner can choose the best solution, implement it and post the impact outcome.
4. Other business owners may get notifications of problems and solutions that are applicable to their businesses based on similarity between profiles of business owners.
5. The Innovator can pick a problem and post solutions to solve the problem, as well as receive feedback from everyone, summarized review comments to improve the solution by implementing the comments.
6. The Innovator can be rewarded by the business owner for posting the best solution.

## Documents

## Technology

### IBM Cloud Services

- [IBM Watson Assistant](https://www.ibm.com/cloud/watson-assistant/)
- [Create a machine learning powered web app to answer questions](https://developer.ibm.com/patterns/create-a-machine-learning-powered-web-app-to-answer-questions-from-a-book/)
- [Learning path: Getting started with Watson Studio](https://developer.ibm.com/series/learning-path-watson-studio/)
- [Deciding between native and cross-platform mobile frontend programming frameworks](https://developer.ibm.com/articles/deciding-between-native-and-cross-platform-mobile-frontend-programming-frameworks/)
- [Building successful mobile apps article series](https://developer.ibm.com/series/building-successful-mobile-apps/)


### Flutter

- [Building beautiful UIs with Flutter](https://codelabs.developers.google.com/codelabs/flutter/#0)

## Getting started

### Prerequisites

- Register for an [IBM Cloud](https://www.ibm.com/account/reg/us-en/signup?formid=urx-42793&eventid=cfc-2020?cm_mmc=OSocial_Blog-_-Audience+Developer_Developer+Conversation-_-WW_WW-_-cfc-2020-ghub-starterkit-cooperation_ov75914&cm_mmca1=000039JL&cm_mmca2=10008917) account.
- Install and configure [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cloud-cli-getting-started#overview).
- Install [Flutter Get Started](https://flutter.dev/docs/get-started/install). 
- Clone the [repository](https://github.com/narayanacoder/BuildUP).

### Steps

1. [Set up an instance of Watson Studio](#1-set-up-an-instance-of-watson-studio).
1. [Provision a CouchDB instance using Cloudant](#2-Provision-a-CouchDB-instance-using-Cloudant).
1. [Generate an API Key from the HERE Developer Portal](#3-generate-an-api-key-from-the-here-developer-portal).
1. [Run the server](#4-run-the-server).
1. [Run the mobile application](#5-run-the-mobile-application).

### 1. Set up an instance of Watson Studio

Log in to IBM Cloud and provision a Watson Studio instance.

1. Select **Watson Studio** from the [IBM Cloud catalog](https://cloud.ibm.com/catalog).
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/WatsonStudioInstance.png)
1. Provision an instance of **Watson Studio**
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/StudioGetStarted.png)
1. Create Project
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/CreateAProject.png)
1. Select Create an Empty Project
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/CreateAnEmptyProject.png)
1. Create WatsonStudio Instance
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/CreateWatsonStudioInstance.png)
1. Add project details
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/GiveProjectDetails.png)
1. Add notebook
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/AssetsAddNotebook.png)
1. Select new notebook from URL. Give a name and select URL as https://github.com/narayanacoder/BuildUP/blob/master/comments-analytics/notebook/CommentAnalytics.ipynb
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/NotebookDetails.png)
1. Add JSON File
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/AddJsonFile.png)
1. JSON file will appear under Data Assets
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/JsonFileInDataAssets.png)
1. Run notebook
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/RunNotebook.png)
![](https://github.com/narayanacoder/BuildUP/blob/master/doc/images/WordCloud.png)

### 2: Provision a CouchDB instance using Cloudant

Log into the IBM Cloud and provision a [CouchDB instance using Cloudant](https://www.ibm.com/cloud/cloudant).

1. From the catalog, select Databases and then the Cloudant panel.
1. Once selected, you can choose your Cloudant plan -- there is a free tier for simple testing that is sufficient to run this CIR example. You should choose an appropriate region, give the service a name, and it is recommended you choose **Use only IAM** under **Available authentication methods**. You can leave the other settings with their defaults. Click the blue **Create** button when ready.
1. Once your Cloudant instance has been created, you need to create a service credential that the CIR API Server can use to communicate with it. By selecting your running Cloudant instance, you can choose **Service credentials** from the left-hand menu. Create a new service credential and give it a name (it doesn't matter what you call it).
1. Once created, you can display the credentials by selecting **view service credentials**, and then copy the credential, so you are ready to paste it into the code of the API server in Step 3.


### 3. Run the server

To set up and launch the server application:

1. Go to the `BuildUP/lb4-server` directory of the cloned repo.
1. Update the fields in BuildUP/lb4-server/src/datasources/cloudant.datasource.config.json with the values created in step 2.
{
  "name": "Cloudant-cfc-2020",
  "connector": "cloudant",
  "url": "xxx",
  "database": "cloudantcfc2020db",
  "username": "xxx",
  "password": "xxx",
  "modelIndex": "loopback__model__cloudantcfc2020",
  "globalLimit": 1000
}
1. Edit the **name** value in the `manifest.yml` file to your application name (for example, _my-app-name_).
1. From a terminal:
    1. Go to the `BuildUP/lb4-server` directory of the cloned repo.
    1. Install the dependencies: `npm install`.
    1. Launch the server application locally or deploy to IBM Cloud:
        - To run locally:
            1. Start the application: `npm start`.
            1. The server can be accessed at <http://localhost:3000>.
        - To deploy to IBM Cloud:
            1. Log in to your IBM Cloud account using the IBM Cloud CLI: `ibmcloud login`.
            1. Target a Cloud Foundry org and space: `ibmcloud target --cf`.
            1. Push the app to IBM Cloud: `ibmcloud app push`.
            1. The server can be accessed at a URL using the **name** given in the `manifest.yml` file (for example,  <https://my-app-name.bluemix.net>).

### 4. Run the mobile application

To run the mobile application (using the Xcode iOS Simulator or Android Studio Emulator):
1. Install [Flutter SDK](https://flutter.io/get-started/install/)
1. Install [editor](https://flutter.io/get-started/editor/editor)
1. Go to the `BuildUP/flutterclient` directory of the cloned repo.
1. Code can be run on 
 1. Physical Android or iOS device connected to your computer and set to developer mode.
 2. The iOS simulator (requires installing Xcode tools)
 3. The Android Emulator (requires setup in Android Studio)
 4. A browser (Chrome is required for debugging. To enable this feature run the following:
    - flutter channel beta
    - flutter upgrade
    - flutter config --enable-web

With the application running in the simulator/emulator, you should be able to navigate through the various screens:

TODO ADD SCREENSHOTS, DEMO VIDEOS
<figure class="video_container">
  <video controls="true" allowfullscreen="true">
    <source src="https://github.com/narayanacoder/BuildUP/blob/master/doc/demos/CollectionsPage.webm" type="video/webm">
  </video>
</figure>

## Roadmap
The roadmap is to use IBM blockchain platform to implement a rewards program for community members who solve problems.

## Resources

- [IBM Cloud](https://www.ibm.com/cloud)
- [Watson Studio](https://dataplatform.cloud.ibm.com/docs/content/wsj/getting-started/welcome-main.html)
- [IBM Cloudant](https://cloud.ibm.com/docs/Cloudant?topic=cloudant-overview)
- [Node.js](https://nodejs.org)
- [Flutter](https://flutter.dev/)
- [IBM Blockchain for Developers](https://developer.ibm.com/technologies/blockchain/)

## License

BuildUP is made available under the [Apache 2 License](LICENSE).
