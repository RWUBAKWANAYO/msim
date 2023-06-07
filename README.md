# Learning Management System API
> This project aims to build the first API endpoints for a Learning Management System (LMS) that complies with the JSON:API specification and uses JWT (JSON Web Tokens) for authentication. The API will allow users to sign in, sign up, list courses, enroll in courses, and view the courses in which they are enrolled. Additionally, the application will periodically fetch courses from a remote API and store them locally.
## Database Architecture:
![drawSQL-learning-system-export-2023-06-07](https://github.com/RWUBAKWANAYO/first-contributions/assets/68381641/8907a427-3ef2-4471-8cb8-cd5068f688c7)

## Technical Requirements
- Ruby on Rails framework
- PostgreSQL database
- RSpec for testing
- JSONAPI-compliant API
- JWT for authentication

## Functional Requirements
The API should provide the following endpoints:

- User Management
   - Create a new user account with an email and password.
   - Authenticate a user with an email and password and return a JWT token.
- Course Management

   - Retrieve a list of all courses, including their names and descriptions.
   - Enroll the current user in a course using the course ID.
   - Retrieve a list of all courses in which the current user is enrolled, including the course names and enrollment dates.


- Periodic Data Fetching
   - Implement a Sidekiq worker that periodically fetches data from a remote API and updates the local database with new courses.
Schedule the worker to run periodically, such as once a day.

## Getting Started

### Prerequisites
You need Ruby v3+, Rails v7+ and Postgresql installed on your machine.

### Setup

- To get local copy:
  - Download the complete zip file and extract the folder in your directory

- Run `bundle install` command, to install all gems for the project.
- To run the migration copy and paste this command in your terminal:
- Install dependencies:
  ```ruby
  bundle install
  ```
- Set up the database:
  ```ruby
  rails db:create
  rails db:migrate
  ```
- Start the Rails server:
  ```ruby
  rails server
  ```
- Access the API at http://localhost:3000.

## API Endpoints
### User Registration
  ```ruby
Endpoint: /api/v1/register
Method: `POST`
Parameters:
 - email (string): User's email address
 - password (string): User's password

 ```
### User Authentication
  ```ruby
Endpoint: /api/v1/login
Method: POST
Parameters:
 - email (string): User's email address
 - password (string): User's password
Response: Authorization header containing a JWT token
  ```

### List Courses
  ```ruby
Endpoint: /api/v1/courses
Method: GET
Response: List of courses, including course name and description
  ```
### Enroll in a Course
  ```ruby
Endpoint: /api/v1/enrollments
Method: POST
Parameters: course_id (integer): ID of the course to enroll in
  ```
### List Enrolled Courses
  ```ruby
Endpoint: /api/v1/courses/enrolled
Method: GET
Response: List of courses that the current user is enrolled in, including the course names and enrollment dates
  ```
### Periodic Course Fetching

*The application includes a Sidekiq worker that is responsible for fetching data from a remote API and updating the local database with new courses. The original intention was for this worker to run automatically on a periodic schedule, ensuring that the local database stays up to date. However, I encountered an issue with Sidekiq that prevented the automatic execution of the worker as expected.*

To fetch courses from the external API and update the local database, follow these steps:

1. Open the Rails console by running the following command:
  ```ruby
  rails c
  ```
2. Once inside the Rails console, execute the following command to trigger the CourseFetcherWorker manually:

  ```ruby
  CourseFetcherWorker.perform_async
  ```
*This command will initiate the process of fetching courses from the remote API and updating the local database with the retrieved data.*

*Please note that due to the issue with Sidekiq, it is necessary to manually run the command in the Rails console to fetch the courses. The worker is designed to fetch courses once a day, according to the specified schedule.*

## Testing
The application includes comprehensive tests written using RSpec. To run the tests, execute the following command:

  ```ruby
  bundle exec rspec
  ```
## Deliverables
**Demo Video:** *The video demonstration of the project can be accessed via the following link: [loom video](https://www.loom.com/share/470536ac582d49a1b9626602981eb0b4);*

**Postman Endpoint:** *The API endpoints can also be tested within the provided Postman workspace: [postman workspace](https://www.postman.com/grey-water-530663/workspace/learning-management/request/13976125-452dcc00-1ea7-4905-99b3-67f1ab4bf417);*

## Authors
:bust_in_silhouette: **RWUBAKWANAYO**
- GitHub: [@githubrwubakwanayo](https://github.com/RWUBAKWANAYO)
- LinkedIn: [Rwubakwanayo](https://www.linkedin.com/in/rwubakwanayo-olivier)

## Acknowledgments

Acknowledgements
- I would like to express my sincere gratitude to Microverse for providing me with the opportunity to work on this project as part of the internship program. It has been an enriching experience, allowing me to enhance my skills and gain practical knowledge in developing a learning management system API.

- I would also like to extend my appreciation to the staff members at Microverse who will be reviewing this project. Your time and expertise are invaluable in evaluating my work and providing constructive feedback. I am grateful for your dedication and commitment to nurturing talent and helping aspiring developers like myself grow in their careers.