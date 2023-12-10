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