# BookDonation Development Report
## Table of Contents
1.[Business Modelling](#business-modelling)
   * [Product Vision](#product-vision)
   * [Features](#features)
   * [Dependencies](#dependencies)
   * [Elevator Pitch](#elevator-pitch)
     
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

5.[Authors](#authors)
   
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
### Elevator Pitch
   
   
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
![Screenshot from 2025-03-28 02-58-02](https://github.com/user-attachments/assets/ae15d559-e45d-428b-b125-7072f8e38482)

---

## Architecture and Design

### Logical architecture
![Copy of BookDonation-Package Diagram drawio(1)](https://github.com/user-attachments/assets/4b04801f-7615-4bec-98dc-3235372ec77b)
---
### Physical architecture
* Deployment Diagram
![Copy of BookDonation-Deployment Diagram drawio](https://github.com/user-attachments/assets/fe50f7a8-2f4a-4a51-a8d2-fdb8c5bded0d)

* Components Diagram
  ![Copy of BookDonation-Components Diagram drawio](https://github.com/user-attachments/assets/b29a57b8-12c0-48f1-83a6-618572725966)

---
### Vertical prototype
---
## Project management

### Sprint 0
---
 ## Authors
 Project developed by Belém Bilhoto, Guilherme Linhares, João Marques, José Reis and Sofia Cruz
  
