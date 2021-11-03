# Santa-I-Wish

This project is an redesign of the original project

Reason for redesign: 
  - firebase unfortunately does not work properly, some data does get posted on to the database while other data does not. 
  - CoreData slows down the project especially after mutliple child objects are created. 
  - Publish on app store. 
  
Original Source Code https://github.com/kima-92/ios-build-sprint-project-proposal/tree/Develop

## Version 1
- implement Firebase using Swift package manager instead of cocoapods
- remove swiftlint
- remove Objective-c interoperability
- UI Redesign

## Version 2 -> in the near future
- remove firebase and use cloudKit instead