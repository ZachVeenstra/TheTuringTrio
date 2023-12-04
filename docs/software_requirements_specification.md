# Overview

This SRS document specifically describes software features for our journal app project.
We have two main sections, functional and non-functional requirments. Functional requirements
describe features of the system, and non-functional requirements describes attributes of those features.

# Fuctional Requirements

1. Home Page
    1. The home page shall display a scrollable view of user's journals.
    2. The home page shall display a create journal button.
    3. The create journal button shall navigate the user to the journal page.
    4. The home page shall display a logout button which navigates the user to the login page.

2. Public Journal Interactions
    1. The ability to type in the comments shall be displayed when the user clicks the comment button.
    2. A public journal shall display a profile picture of the poster.
    3. When the profile picture is clicked, the user shall be navigated to the poster's profile page.

3. Journal
    1. The journal shall allow the user to write text.
    3. Journals shall have a user-customizable tag attribute so journals can be categorized.
    4. Journals shall have an optional location tag.
    5. The user shall be able to edit previous journals.
    6. The user shall be able to upload pictures to the journal.
    7. The user shall have the option to make their journal public or private.

4. Profiles
    1. Users shall be able to view other’s public profiles.
    2. The user shall be able to view all entries for their journals on a separate screen.
    3. The user shall be allowed to edit the profile by clicking the edit profile button.

5. Smart Prompt
    1. The smart prompt shall suggest a journal prompt when a new journal is created.
    2. The smart prompt shall allow the user the option whether or not to use the prompt for the journal.

6. Authentication Pages
    1. The authentication page shall be displayed when the user initially opens the app.
    2. The authentication page shall give the user the choice to login or to create an account.
    3. The user shall be navigated from the authentication page to the home page when the login button is tapped.
    4. The authentication page shall allow the user to access the create account page by clicking the create account page.
    5. The create account page shall allow the user to create an account, using an email and password.
    7. The create account page shall allow the user to return to the login page by tapping the create account button.

# Non-functional Requirements

1. Accessibility
    1. The minimum supported version of iOS shall be 17.

2. Performance
    2. Images in a journal shall load in less than 1 second when uploaded.
    3. Public posts shall load on the home page in less than 2 seconds.
    4. The Login page to Homepage shall load in less than 1 second after the user clicks the login button
    5. The Create account page shall load in less than 1 second after the user clicks the create account button from the login page
    6. The smartprompt shall take less than 1 second when the user clicks the smartprompt button to help generate the prompt for the journal.
    7. The login page shall load in less than 1 second after the user clicks the word "here" link in the create account page.

3. Security
    1. The app shall have high security by requiring a username and password to enter.

4. Usability
    2. User authenticaion and authorization shall be handled efficiently to allow authorized users to access or modify their journal entries.
    3. The system shall provide user-friendly error messages in case of failures while authenticating and making a journal entry.
    6. The Profile page shall allow the user the abliity to type the bio, email, and username.
    7. The smartprompt shall allow the user to get a generated prompt that can be used to help write in the journal.

5. Theme
    1. The app shall have a unified theme across all pages.
    2. All text fields shall be light gray.
    3. All action buttons shall be a dark blue color.
    4. All action buttons shall have rounded corners.


6. Data Safety
    1. Firebase shall handle the safety of the user's data.
