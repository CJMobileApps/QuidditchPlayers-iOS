# Quidditch Players iOS 

This is an app that displays Quidditch players for iOS. Each individual player is displayed in a list. The list is then updated every few seconds with a certain player's status update.

## Branches

**Master:** This branch uses RxSwift for background threading. RxSwift observables are  used for updating data to view.

**Data-Task** This branch uses Data Task for background threading.

## Architecture Pattern

**MVVM**

**RxSwift**

**Service and Repository Pattern**

## User Stories / Feature List

The following functionality is completed:

* [X] Create readme
* [X] User story 1: Display players in a list.
     * [X] Part 1: Make call to following end point: https://cjmobileapps.com/api/v1/quidditch/players

     1) Players from JSON
     ```
     [
         {
             "id": 3,
             "firstName": "Harry",
             "lastName": "Potter",
             "yearsPlayed": [
                 1991,
                 1992,
                 1993,
                 1994,
                 1995,
                 1996,
                 1997
             ],
             "favoriteSubject": "Defense Against The Dark Arts",
             "position": 4,
             "imageurl": "https://cjmobileappsimages.s3.us-east-2.amazonaws.com/Quidditch+Images/harry+potter.jpg"
         },
         {
             "id": 4,
             "firstName": "Katie",
             "lastName": "Bell",
             "yearsPlayed": [
                 1991,
                 1992,
                 1993,
                 1994,
                 1995,
                 1996,
                 1997
             ],
             "favoriteSubject": "Transfiguration",
             "position": 1,
             "imageurl": "https://cjmobileappsimages.s3.us-east-2.amazonaws.com/Quidditch+Images/katie+bell.jpg"
         },
         {
             "id": 5,
             "firstName": "Angelina",
             "lastName": "Johnson",
             "yearsPlayed": [
                 1990,
                 1991,
                 1992,
                 1993,
                 1994,
                 1995,
                 1996
             ],
             "favoriteSubject": "Care of Magical Creatures",
             "position": 1,
             "imageurl": "https://cjmobileappsimages.s3.us-east-2.amazonaws.com/Quidditch+Images/angelina+johnson.jpg"
         },
         {
             "id": 6,
             "firstName": "Fred",
             "lastName": "Weasley",
             "yearsPlayed": [
                 1990,
                 1991,
                 1992,
                 1993,
                 1994,
                 1995,
                 1996
             ],
             "favoriteSubject": "Charms",
             "position": 2,
             "imageurl": "https://cjmobileappsimages.s3.us-east-2.amazonaws.com/Quidditch+Images/fred+weasley.jpg"
         },
         {
             "id": 7,
             "firstName": "George",
             "lastName": "Weasley",
             "yearsPlayed": [
                 1990,
                 1991,
                 1992,
                 1993,
                 1994,
                 1995,
                 1996
             ],
             "favoriteSubject": "Charms",
             "position": 2,
             "imageurl": "https://cjmobileappsimages.s3.us-east-2.amazonaws.com/Quidditch+Images/george+weasley.jpg"
         },
         {
             "id": 8,
             "firstName": "Alicia",
             "lastName": "Spinnet",
             "yearsPlayed": [
                 1990,
                 1991,
                 1992,
                 1993,
                 1994,
                 1995,
                 1996
             ],
             "favoriteSubject": "Charms",
             "position": 1,
             "imageurl": "https://cjmobileappsimages.s3.us-east-2.amazonaws.com/Quidditch+Images/alicia+spinnet.jpg"
         },
         {
             "id": 9,
             "firstName": "Oliver",
             "lastName": "Wood",
             "yearsPlayed": [
                 1989,
                 1990,
                 1991,
                 1992,
                 1993,
                 1994
             ],
             "favoriteSubject": "Potions",
             "position": 3,
             "imageurl": "https://cjmobileappsimages.s3.us-east-2.amazonaws.com/Quidditch+Images/oliver+wood.jpg"
         }
     ]

     ```
     * [X] Part 2: Make call to following end point: https://cjmobileapps.com/api/v1/quidditch/positions

     2) Positions from JSON
     ```
     [
         {
             "id": 1,
             "positionName": "Chaser"
         },
         {
             "id": 2,
             "positionName": "Beater"
         },
         {
             "id": 3,
             "positionName": "Keeper"
         },
         {
             "id": 4,
             "positionName": "Seeker"
         }
     ]

     ```
     * [X] Part 3: Combine the two list and show the results in a list.
     * [X] Part 4: Make call to following the following WebSocket end point: ***wss://cjmobileapps.com/api/v1/quidditch/status***

     1) Status updates JSON

     ```
     {
        "id":8,
        "status":"Alicia Spinnet is dueling a Slytherin 🐍"
     }

     ```

     * [X] Part 5: Update the players in the list with the correct status update.

Features to be implemented in the future:
* [ ] Add unit test

## Screen shots and Video Walkthrough

Here's a screenshot and walkthrough video of implemented user stories:

<img src='https://i.imgur.com/5zWSF4R.png' title='User Story 1 Screen shot' width='' alt='User Story 1 Screen Shot' />


## Open source libraries

- [RxSwift](https://github.com/ReactiveX/RxSwift) - ReactiveX is a combination of the best ideas from
the Observer pattern, the Iterator pattern, and functional programming.
- [Alamofire](https://github.com/Alamofire/Alamofire) - Alamofire is an HTTP networking library written in Swift.
- [Kingfisher](https://github.com/onevcat/Kingfisher) - A lightweight, pure-Swift library for downloading and caching images from the web.
