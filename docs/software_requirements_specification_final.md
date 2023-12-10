# Overview

This SRS document specifically describes software features for the final version of journal app project. We have added more functional and non-functional requirements in terms of safety, security and deployment that represents the current final version of our app.
We have two main sections, functional and non-functional requirments. Functional requirements
describe features of the system, and non-functional requirements describes attributes of those features.

# Fuctional Requirements

1. Home Page
    1. The home page shall display a scrollable view of user's journals.
    2. The home page shall display a create journal button.
    3. The create journal button shall navigate the user to the journal page.
    4. The home page shall display a logout button which navigates the user to the login page.
    5. The home page shall display a profile button which navigates a user to thier profile page.

2. Journal
    1. The journal shall allow the user to write text.
    2. Journals shall have a user-customizable tag attribute so journals can be categorized.
    3. Journals shall have an optional location tag.
    4. The user shall be able to edit previous journals.
    5. The user shall be able to upload pictures to the journal.
    6. The user shall have the option to make their journal public or private.

3. Profiles
    1. The user shall be able to view their profile.
    2. The user shall be able to update their bio.
    3. The user shall be able to set their profile picture.
    4. The user shall be able to change their password.
    5. The user shall be able to change their username.
    6. The user shall be able to change their email.

4. Authentication Page
    1. The authentication page shall be displayed when the user initially opens the app.
    2. The authentication page shall give the user the choice to login or to create an account.
    3. The user shall be navigated from the authentication page to the home page when the login button is tapped.
    4. The authentication page shall allow the user to access the create account page by clicking the create account page.
    5. The authentication page shall notify the user when they have entered an incorrect email.
    6. The authentication page shall notify the user when they have entered an incorrect password.

5. Create Accunt Page
    1. The create account page shall allow the user to create an account, using an email and password.
    2. The create account page shall navigate to the home page by tapping the create account button.
    3. The authentication page shall notify the user when they have entered an invalid email.
    4. The authentication page shall notify the user when they have entered an invalid password.
    5. The authentication page shall notify the user when they have entered an invalid username.

# Non-functional Requirements

1. Performance
    1. Images in a journal shall load in less than 1 second when uploaded.
    2. Public posts shall load on the home page in less than 2 seconds.
    3. The Login page to Homepage shall load in less than 1 second after the user clicks the login button
    4. The Create account page shall load in less than 1 second after the user clicks the create account button from the login page
    5. The login page shall load in less than 1 second after the user clicks the word "here" link in the create account page.

2. Data Safety/Security
    1. The app shall have high security by requiring a username and password to enter.
    2. The app shall store hashed passwords in the database.
    3. The app shall implement secure user sessions for authentication.
    4. The firebase credentials shall not be available publicly on github repository.
    5. Firebase shall be regularly backed up to ensure the safety of the user's data.

3. Usability
    1. User authenticaion and authorization shall be handled efficiently to allow authorized users to access or modify their journal entries.
    2. The system shall provide user-friendly error messages in case of failures while authenticating and making a journal entry.
    3. The profile page shall allow the user the abliity to type the bio, email, and username.
    4. The edit profile page shall give a visual to the user that their changes are being uploaded via a loading spinner.
    5. The app shall use familiar feeling navigation by using SwiftUI's built-in navigation.


4. Theme
    1. The app shall have a unified theme across all pages.
    2. All text fields shall be light gray.
    3. All action buttons shall be a dark blue color.
    4. All action buttons shall have rounded corners.
    5. The user's profile pictures shall be circular avatar
    6. User shall be able to horizontally scroll through each journal's images.

5. Deployment
    1. The minimum supported version of iOS shall be 17.
    2. The testing version of the app shall be deployed on TestFlight.
    3. The app shall be tested by adding internal testers on TestFlight.
    4. We shall accept user feedback through TestFlight.
    5. After feedback as been recieved from testers, the app shall be deployed to the App Store.
