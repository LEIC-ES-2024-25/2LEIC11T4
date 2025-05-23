# BookDonation Development Report
## Table of Contents
1.[Business Modelling](#business-modelling)
   * [Product Vision](#product-vision)
   * [Features](#features)
   * [Dependencies](#dependencies)
     
2.[Requirements](#requirements)
   * [User Stories and acceptance tests](#user-stories-and-acceptance-tests)
   * [Mockup](#mockup)
   * [Domain model](#domain-model)

3.[Architecture and Design](#architecture-and-design)
   * [Logical architecture](#logical-architecture)
   * [Physical architecture](#physical-architecture)
   * [Vertical prototype](#vertical-prototype)

4.[Project management](#project-management)
  * [Sprint 0](#sprint-0)
    * [Sprint 1 planning](#sprint-1-planning)
  * [Sprint 1](#sprint-1)
    * [Sprint review](#sprint-review)
    * [Sprint retrospective](#sprint-retrospective)
    * [Sprint 2 planning](#sprint-2-planning)
  * [Sprint 2](#sprint-2)
    * [Sprint review](#sprint-review)
    * [Sprint retrospective](#sprint-retrospective)
    * [Sprint 3 planning](#sprint-3-planning)
  * [Sprint 3](#sprint-3)
    * [Sprint review](#sprint-review)
    * [Sprint retrospective](#sprint-retrospective)
      
5.[Happiness meter](#happiness-meter)

6.[Authors](#authors)
   
---



## Business Modelling

### Product Vision
   Many students buy books each Semester for their classes and at the end of said Semester, those books become useless. 
Our vision is to create an application that has a book bank that allows all students to upload contributions of their own used books so that other students can reuse them.
With this we hope to achieve the following two of the [UN Sustainable Development Goals](https://sdgs.un.org/goals): 
- [Goal 4](https://sdgs.un.org/goals/goal4) : By allowing all students to have access to any book available for free, since our app will function via donation;
- [Goal 12](https://sdgs.un.org/goals/goal12) : By reusing books, we hope that the pollution footprint of each Faculty will reduce.

---
### Features 
- Filter feature:
  - Filter the faculty and degree so that the students can easily find the books for their degree;
  - Filter by the type, either real book or a printed version or a syllabus;
  - Filter if the book as annotations or not;
- User profile:
  - Faculty
  - Degree
  - Year
  - Contributions
- Donations:
   - Ability to add donations at any time
   - Chat for arranging donations
--- 
### Dependencies
   -Open Library api
   
---
## Requirements

### User stories and acceptance tests
   |Value|User Story|Effort|Acceptance test|
   | ------------- | ------------- |--------|--------|
   |1|As a contributor, I want to be able to manage a donation of a book with photos and information about the book | 5|Given: A registered contributor wants to donate a book;<br>When: the user clicks the "add new contribution button" and fills the required parameters and submits them;<br> Then: the book donation should be completed successfully |
   |2|As a contributor, I want to be able to have a chat with whoever wants the book I’m donating so that I can exchange information and details|4|Given:A registered contributor wants to arrange the donation;<br>When:the contributor clicks the chat with the potential recipient and arranges the donation;<br>Then:the transaction is completed successfully|
   |3|As a user, I want to be able to view the profile of the person I am receiving the book from, so I can know either or not it will be of my interest|6|Given:A registered user on the donation page;<br>When: the user clicks on either the person's profile picture or username;<br>Then: the user should be able to view the donors profile and determine whether the donation is useful|
   |4|As a user, I want to be able to search for books, so that I can find what I’m looking for|7|Given: A Registered user looking for a specific book;<br>When: the user searches the book by title or ISBN;<br>Then:the desired book should be displayed in the results. In case the book is not being donated, other books of the same topic should be displayed instead|
   |5|As a user, I want to be able to filter the search results books by Area of Studies so that I can find books related to what I want to study|6|Given: A registered user who wants a book of a desired topic;<br>When:the user adds a filter with said topic;<br>Then: only books within that topic will be displayed|
   |6|As a user I want to manage the information at any time in my profile, so I can make accurate donations|3|Given: A registered user who want to change some detail of the profile;<br>When: the user clicks the "edit" button next to the profile picture in the settings page,is redirected to the profile page within which the details can replace or alter, saves the changes;<br>Then:the profile will be updated successfully|
   |7|As an unregistered user I want to be able to sign up, so that I can participate in the community|1|Given: A unregistered user; <br> When: the user clicks the  "sign up", is redirected to the "create account page" where after inputting the required  details the user will be redirected to the profile page to complete setting up the account;<br> Then: an account will be created successfully|
   |8|As a forgetful user, I want to be able to request a password, so that when I forget it I can recover my account|1|Given: A forgetful registered user;<br>When:clicking the "forgot my password" button;<br>Then: an email will be sent to the user's registered email address with instructions to reset the password|
   |9|As a registered user I want to be able to access the app without having to log in every time, so that it makes it easier to open the app|2|Given:A registered user who does not want to input the login information every time;<br>When: the user clicks the "remember me" button;<br>Then:the user will remained logged in|
---
### Mockup
  <sub><a href="https://www.figma.com/design/EUMLSq9YuJ0Qritrlqfrv1/Untitled?node-id=0-1&t=Qm7Pd6iXrawCXlXV-1"> Design</a></sub>
---
### Domain model
![Screenshot from 2025-03-28 14-30-10](https://github.com/user-attachments/assets/576a90f5-9044-4411-b26c-4a7e238af27e)

---

## Architecture and Design

### Logical architecture
![Copy of BookDonation-Package Diagram drawio(4)](https://github.com/user-attachments/assets/7159070e-53cb-4b33-8a1a-bda45e192a4d)


---
### Physical architecture
* Deployment Diagram
![BookDonation-Deployment Diagram drawio](https://github.com/user-attachments/assets/614cf684-c69c-4494-93c8-83accf77994c)

* Components Diagram
![Copy of BookDonation-Components Diagram drawio(1)](https://github.com/user-attachments/assets/c9403abe-5a5e-48eb-8eba-e0c5f8af287f)


---
### Vertical prototype

---
## Project management

### Sprint 0

#### Sprint 1 planning

- We divided the user story New Contribution into multiple tasks,where each on was separated in terms of logic and ui.
![github com_orgs_LEIC-ES-2024-25_projects_75_views_1 (1)](https://github.com/user-attachments/assets/16f2d2ae-25fb-489c-b2cd-f60136b7447b) 

### Sprint 1
![github com_orgs_LEIC-ES-2024-25_projects_75_views_1 (2)](https://github.com/user-attachments/assets/a453afde-187a-4866-bf78-9572a06d50cf)

#### Sprint review
- During this sprint, we successfully developed several of the planned tasks. Notably, we completed the UI for the New Contribution page. However, since the logic was not yet implemented and the feature could not be used meaningfully by the user, we could not consider the user story as fully delivered. As a result, there was no tangible value added to the application during this sprint.
#### Sprint retrospective
- One of the main challenges we encountered was a lack of consideration for dependencies between UI and logic tasks during sprint planning. This oversight led to the development of several tasks that were not immediately useful on their own and could not be tested end-to-end. In hindsight, a better understanding and mapping of these dependencies would have allowed us to prioritize tasks more effectively and deliver user value incrementally.

#### Sprint 2 planning 
- For this sprint, we’ve focused on addressing the gaps from Sprint 1. We assigned tasks aimed at completing the logic for the New Contribution feature and integrating it with the OpenLibrary API to ensure it becomes fully functional. Additionally, we planned work on new user stories such as Sign Up, Log In, Profile Editing and Chat, in order to expand the core functionality of the application. These tasks were prioritized to ensure end-to-end value delivery and to enable meaningful user interaction within the app.
![github com_orgs_LEIC-ES-2024-25_projects_75_views_1](https://github.com/user-attachments/assets/c82eedfd-9123-4758-9ee5-617486f8876d)

### Sprint 2
![github com_orgs_LEIC-ES-2024-25_projects_75_views_1](https://github.com/user-attachments/assets/35c5ae9b-fe58-432a-9a85-095c37ee2587)

#### Sprint review
- For this sprint we proposed ourselves to work on the link between the dart code and the Firebase, in order to make the Contribution and User logic work. We were able to complete these tasks, however as there are no cards available for the user it's assumed as having no additional user value. At the stage that we are at this moment the next tasks related to this part of the project will be eased, remaining the implementation of the chat (related to the users db) and the visual cards in the main pages.

#### Sprint retrospective
- We faced several difficulties, related for instance to dependencies that delayed our tasks. Still, we made efforts to individually solve those problems, according to the tasks assigned, reporting in group our solutions. We acknowledge that we should've made a more integrated test of the features in order to systematically check that they were all working.
  
#### Sprint 3 planning
- As this is the final sprint and it requires delivering all user value proposed, we will have to focus on finishing the logic we worked on and testing all the features. We will have to finish the contribution cards, the user settings and the chat.

### Sprint 3
![github com_orgs_LEIC-ES-2024-25_projects_75_views_1 (4)](https://github.com/user-attachments/assets/8cd99017-417c-44d4-af49-ba156bdef555)

### Sprint review
- We've worked on the implementation of the missing features, and were able to make them functional. Overall, there's no significant feature that we've left behind.
  
### Sprint retrospective

## Happiness meter
[2LEIC11T4.xlsx](https://github.com/user-attachments/files/20041230/2LEIC11T4.xlsx)
---
 ## Authors
 Project developed by Belém Bilhoto, Guilherme Linhares, João Marques and José Reis
