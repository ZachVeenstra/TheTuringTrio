# Overview

This SRS document specifically describes software features for the final version of journal app project. We have added more functional and non-functional requirements in terms of safety, security and deployment that represents the current final version of our app.

# Software Requirements
We have two main sections, functional and non-functional requirments. Functional requirements
describe features of the system, and non-functional requirements describes attributes of those features.

## Fuctional Requirements

### Home Page
| ID | Requirement |
| :-------------: | :----------: | 
| FR1 | The home page shall display a scrollable view of user's journals.  |
| FR2 | The home page shall display a create journal button.|
| FR3 |  The create journal button shall navigate the user to the journal page. |
| FR4 |  The home page shall display a logout button which navigates the user to the login page. |
| FR5 |  The home page shall display a profile button which navigates a user to thier profile page. |

### Journal
| ID | Requirement |
| :-------------: | :----------: | 
| FR6 | The journal shall allow the user to write text.  |
| FR7 | Journals shall have a user-customizable tag attribute so journals can be categorized.|
| FR8 |  Journals shall have an optional location tag. |
| FR9 |  The user shall be able to edit previous journals. |
| FR10 |  The user shall be able to upload pictures to the journal. |
| FR11 |  The user shall have the option to make their journal public or private. |

### Profiles
| ID | Requirement |
| :-------------: | :----------: | 
| FR12 | The user shall be able to view their profile.  |
| FR13 | The user shall be able to update their bio.|
| FR14 |  The user shall be able to set their profile picture. |
| FR15 |  The user shall be able to edit previous journals. |
| FR16 |  The user shall be able to change their username. |
| FR17 |  The user shall be able to change their email. |

### Authentication Page
| ID | Requirement |
| :-------------: | :----------: | 
| FR18 | The authentication page shall be displayed when the user initially opens the app.  |
| FR19 | The authentication page shall give the user the choice to login or to create an account.|
| FR20 |  The user shall be navigated from the authentication page to the home page when the login button is tapped. |
| FR21 |  The authentication page shall allow the user to access the create account page by clicking the create account button. |
| FR22 |  The authentication page shall notify the user when they have entered an incorrect email. |
| FR23 |  The authentication page shall notify the user when they have entered an incorrect password. |

### Create Accunt Page
| ID | Requirement |
| :-------------: | :----------: | 
| FR24 | The create account page shall allow the user to create an account, using an email and password. |
| FR25 | The create account page shall navigate to the home page by tapping the create account button.|
| FR26 |  The create account page shall notify the user when they have entered an invalid email. |
| FR27 |  The create account page shall notify the user when they have entered an invalid password. |
| FR28 |  The create account page shall notify the user when they have entered an invalid username. |

### Database
| ID | Requirement |
| :-------------: | :----------: | 
| FR29 | The database shall store journals. |
| FR30 | The database shall store images. |
| FR31 | The database shall store users. |
| FR32 | The database shall be Firebase. |
| FR33 | The database shall use authentication. |

## Non-functional Requirements

### Performance
| ID | Requirement |
| :-------------: | :----------: | 
| NFR1 | Images in a journal shall load in less than 1 second when uploaded.  |
| NFR2 | Public posts shall load on the home page in less than 2 seconds. |
| NFR3 |  The Login page to Homepage shall load in less than 1 second after the user clicks the login button |
| NFR4 |  The Create account page shall load in less than 1 second after the user clicks the create account button from the login page |
| NFR5 |  The login page shall load in less than 1 second after the user clicks the word "here" link in the create account page. |

### Data Safety/Security
| ID | Requirement |
| :-------------: | :----------: | 
| NFR6 | The app shall have high security by requiring a username and password to enter.  |
| NFR7 | The app shall store hashed passwords in the database. |
| NFR8 |  The app shall implement secure user sessions for authentication. |
| NFR9 |  The firebase credentials shall not be available publicly on github repository. |
| NFR10 |  Firebase shall be regularly backed up to ensure the safety of the user's data. |

### Usability
| ID | Requirement |
| :-------------: | :----------: | 
| NFR11 | User authenticaion and authorization shall be handled efficiently to allow authorized users to access or modify their journal entries.  |
| NFR12 | The system shall provide user-friendly error messages in case of failures while authenticating and making a journal entry. |
| NFR13 |  The profile page shall allow the user the abliity to type the bio, email, and username. |
| NFR14 |  The edit profile page shall give a visual to the user that their changes are being uploaded via a loading spinner. |
| NFR15 | The app shall use familiar feeling navigation by using SwiftUI's built-in navigation. |

### Theme
| ID | Requirement |
| :-------------: | :----------: | 
| NFR16 | The app shall have a unified theme across all pages. |
| NFR17 | All text fields shall be light gray. |
| NFR18 | All action buttons shall be a dark blue color. |
| NFR19 | All action buttons shall have rounded corners. |
| NFR20 | The user's profile pictures shall be circular avatar.|
| NFR21 | User shall be able to horizontally scroll through each journal's images. |

### Deployment
| ID | Requirement |
| :-------------: | :----------: | 
| NFR16 | The minimum supported version of iOS shall be 17. |
| NFR17 | The testing version of the app shall be deployed on TestFlight. |
| NFR18 | The app shall be tested by adding internal testers on TestFlight. |
| NFR19 | All action buttons shall have rounded corners. |
| NFR20 | We shall accept user feedback through TestFlight. |
| NFR21 | After feedback as been recieved from testers, the app shall be deployed to the App Store. |

# Change Management Plan
This change management plan will help enable our users to run, use, 
test, and submit feedback about our app.  

## How will we train people to use the app?
We will send an email invitation to our TestFlight project. The content 
of the email will contain a link to download the app via TestFlight, and 
instructions of how to test the app. Included in the instructions will 
be the following description:  
Congratulations! You have been selected as a beta-tester for the Smart 
Journal app. This email contains a link to download our app via TestFlight, 
which will allow you to run it on your own device. Once the app is downloaded, 
please create an account using your email. From there, test out any 
features that interest you! You can fill out your profile info, an create 
journal entries for anyone else to see. If you have any feedback, take 
a screenshot and let us know what went wrong, or if you have any suggestions! 
Thank you for being a valued tester.

## How will we ensure it integrates within their ecosystem/software?
Our app will be available on TestFlight. TestFlight is a platform that 
allows developers to host their app before it is formally released to the app 
store. It also automatically ensures that the user is able to run/use the app 
on their device. 

## How will we ensure that any discovered issues are resolved?
TestFlight has a feature that allows users to submit feedback directly 
from our beta app. This can be done by taking a screenshot in the app, 
which will invite them to submit detailed feedback about any potential 
bugs they encountered. TestFlight also automatically sends crash reports. 
With the combination of bug and crash reports, our team will be able to
closely monitor any issues, and address them as they come up.

# Traceability Links
This diagram shows how requirements are connected to each artifact.

## Use Case Diagram Traceability

| Artifact ID | Artifact Name | Requirement ID |
| :-------------: | :----------: | :-------------: |
| Journals | Create Journal | FR2, FR6-11, FR3 |
| Journals | Edit Journal | FR6-11  |
| Journals | Upload Media | FR10 |
| Journals | Delete Journal | TBD |
| Journals | View Journal | FR1, FR3 |
| Journals | Save Journal | FR6-11 |
| Interactions | View Home | FR1-5 |
| Interactions | View Journal | FR1, FR3 |
| Interactions | Comment Journal | TBD |
| Interactions | View Profile | FR5, FR12 |

## Class Diagram Traceability
| Artifact Name | Requirement ID | 
| :-------------: |:----------: | 
| User | FR12-17 |
| Journal | FR6-11 |
| Database | FR29-33 |
| HashableImage | No longer implemented |
| ImageCarousel | FR1, FR10 |
| SmartPrompt | TBD |

## Activity Diagram Traceability
| Artifact ID | Artifact Name | Requirement ID | 
| :-------------: | :----------: | :----------: | 
| [Journal Activity Diagram](https://github.com/ZachVeenstra/TheTuringTrio/blob/main/artifacts/JournalActivityDiagram.pdf)| Handle Journal Data | FR6, FR10, NFR1 |
| [Home Activity Diagram](https://github.com/ZachVeenstra/TheTuringTrio/blob/main/artifacts/HomeActivityDiagram.pdf)| Home Page Actions | FR1, FR5, NFR1 |

# Software Artifacts
These are all the software artifacts created throughout the project.  

[Class Diagrams](https://github.com/ZachVeenstra/TheTuringTrio/blob/main/artifacts/ClassDiagrams.pdf)
[Home Activity Diagram](https://github.com/ZachVeenstra/TheTuringTrio/blob/main/artifacts/HomeActivityDiagram.pdf)
[Journal Activity Diagram](https://github.com/ZachVeenstra/TheTuringTrio/blob/main/artifacts/JournalActivityDiagram.pdf)
[Journal Use Case Diagram](https://github.com/ZachVeenstra/TheTuringTrio/blob/main/artifacts/JournalsUseCaseDiagram.pdf)