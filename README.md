# README

Front End Repo: https://github.com/wickedvic/MediTracker-front
Demo Video: https://youtu.be/Y-jdcgcwnBk

Summary: A healthcare app designed for doctors and patients. 
- Modeled custom database schema and REST API with Active Record, Postgres and Ruby on Rails 
- Included 3rd party API data from RX-IMAGE to seed medication data in the back-end
- Used Javascript/React for the front end as well as Redux and middleware for asynchronous data retrieval 
- Authenticated users at login by encrypting identifying account information via JWT. Also used B-CRYPT to hash user passwords and created a sign up function for new patients. 

The application’s main goal should be to hit CRUD (CREATE, READ, UPDATE, DESTROY).

Doctor Functionality:
1. A doctor is able to prescribe medications to a patient. Medication data comes from RX-Image API 
2. Sign up a new patient 
3. Use a fully functional calendar tailored for them
4. Make any notes and organize them by one of four colors


Patient Functionality:
1. A patient is able to see any medications prescribed along with some warnings, number of pills and color of the pill and a picture of what the pill looks like
2. Can toggle what meds have already been taken
3. Click on the learn more feature for each medication. Links to an encyclopedia with all the medication information
4. Lastly they are able to edit any attributes of their profile including their name, email, image and password. 
