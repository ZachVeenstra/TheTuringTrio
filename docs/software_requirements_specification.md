# Overview

This SRS document specifically describes software features for our journal app project.
We have two main sections, functional and non-functional requirments. Functional requirements
describe features of the system, and non-functional requirements describes attributes of those features.

# Fuctional Requirements

1. Home Page
    1. The home page shall be displayed when the user logs into the journal.
    2. The home page shall be displayed after the user clicks the login button afrom the login page.
    3. The home page shall be displayed after the user clicks the login button from after creating an account.
    4. The home page shall display a logout button when the user is done with the journal which returns the user to the login page.

2. Public Journal Interactions
    1. The ability to type in the comments shall be displayed when the user clicks the comment button.
    2. The user shall have the ability to use the smartprompt when the user clicks the smartprompt button.


3. Journal
    1. The Journal shall allow the user to write text when we open a journal and click onto the page.
    2. The ability to make a journal entry public or private shall be displayed when we are done with our journal and are ready to submit it.
    3. Journals shall have a user-customizable tag attribute so journals can be categorized.
    4. Journals shall have a location tag if the user shares their location.
    5. The user shall be able to create a new entry for the journal.
    6. The user shall be able to upload media such as pictures and videos and write text for the journal entry.
    7. The user shall be able to make the journal public for other users to see or keep it private.

4. Profiles
    1. Users shall be able to view other’s public profiles.
    2. The user shall be able to view all entries for his journals on a separate screen.
    3. The user shall be allowed to edit the profile by clicking the edit profile button.

5. Smart Prompt
    1. The smart prompt shall suggest a journal prompt when a new journal is created.
    2. The smart prompt shall allow the user the option whether or not to use the prompt for the journal.

6. Authentication Pages
    1. The login page shall be displayed when the user initially opens the app.
    2. The login page shall allow the user the choice to login or to create an account
    3. The login page shall allow the user to login onto the home page by allowing the user to click the Login button.
    4. The login page shall allow the user to access the create account page by clicking the create account page.
    5. The create account page shall allow the user to create an account then login or return to the login page
    6. The create account page shall allow to user to login by clicking the login button to the home page.
    7. The create account page shall allow the user to return to the login page by clicking the here text.

# Non-functional Requirements

1. Accessibility
    1. The app shall be available on the latest version of iOS (17).
    2. The app shall be avalible to any iOS user who downloaded the app.
    3. The app shall not be avalible to anyone who does not have the iOS.

2. Performance
    1. The journal shall have the ability to peform very fast when it is being used.
    2. Images in a journal shall load in less than 1 second when uploaded.
    3. Public posts shall load on the home page in less than 2 seconds.
    4. The Login page to Homepage shall load in less than 1 second after the user clicks the login button
    5. The Create account page shall load in less than 1 second after the user clicks the create account button from the login page
    6. The smartprompt shall take less than 1 second when the user clicks the smartprompt button to help generate the prompt for the journal.
    7. The login page shall load in less than 1 second after the user clicks the word "here" link in the create account page.

3. Security
    1. The journal when it is being used shall have high security to prevent it from leaking data or being hacked into.
    2. The journal shall decline a user who does not have the correct username and passord to prevent fraud, which gives security to the journal.
    3. The journal shall decline a user who does not set the username, or confirm the password to send the user from create account to the homepage giving security to the journal.

4. Usability
    1. The journal shall have the ability to be reused as much times as the user makes journal entries.
    2. User authenticaion and authorization shall be handled efficiently to allow authorized users to access or modify their journal entries.
    3. The system shall provide user-friendly error messages in case of failes while authenticating and making a journal entry.
    4. The Login page shall allow the user the ability to type the username and password before logging onto an account.
    5. The Create account page shall allow the user the ability to type the email, username, password, and confirm password before logging in.
    6. The Profile page shall allow the user the abliity to type the bio, email, username and occupation.
    7. The smartprompt shall allow the user to get a generated prompt that can be used to help write in the journal.

5. Theme
    1. The app shall have a unified theme across all pages.
    2. The user interface of the application shall be according to the established design principles.
    3. Where the user can type in order to login shall be in light grey so that the user has an indication on where to type before logging in.
    4. The button to login shall be in a dark blue color so that the user knows where to login in order to access the homepage.

6. Data Safety
    1. The system shall regularly backup user data to prevent data loss in case of any crashes.
    2. The system shall alert the user in case an error or a breachin security were to occur.
