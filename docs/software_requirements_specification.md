# Overview

This SRS document specifically describes software features for our journal app project.
We have two main sections, functional and non-functional requirments. Functional requirements
describe features of the system, and non-functional requirements describes attributes of those features.

# Fuctional Requirements

1. Home Page
    1. The home page shall be displayed when the user logs into the journal.
		2. The homepage shall be displayed after the user clicks the login button from after creating an account.

2. Public Journal Interactions
    1. The ability to type in the comments shall be displayed when the user clicks the comment button.

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

# Non-functional Requirements

1. Accessibility
    1. The app must be available on the latest version of iOS (17).
		2. The app shall be avalible to any iOS user who downloaded the app.

2. Performance
    1. The journal shall have the ability to peform very fast when it is being used.
    2. Images in a journal shall load in less than 1 second when uploaded.
    3. Public posts shall load on the home page in less than 2 seconds.
		4. The Login page to Homepage shall load in less than 1 second after the user clicks the login button
		5. The Create account page shall load in less than 1 second after the user clicks the create account button.

3. Security
    1. The journal when it is being used shall have high security to prevent it from leaking data or being hacked into.
		2. The journal shall decline a user who does not have the correct username and passord to prevent fraud, which gives security to the journal.

4. Usability
    1. The journal shall have the ability to be reused as much times as the user makes journal entries.
    2. User authenticaion and authorization shall be handled efficiently to allow authorized users to access or modify their journal entries.
    2. The system shall provide user-friendly error messages in case of failes while authenticating and making a journal entry.
		3. The Login page shall allow the user the ability to type the username and password before logging onto an account.
		4. The Create account page shall allow the user the ability to type the email, username, password, and confirm password before logging in.
		5. The Profile page shall allow the user the abliity to type the bio, email, username and occupation.

5. Theme
    1. The app shall have a unified theme across all pages.
    2. The user interface of the application shall be according to the established design principles.

6. Data Safety
    1. The system shall regularly backup user data to prevent data loss in case of any crashes.
