# Fav Contacts
Fav_Contacts is a mini project to explore about TableView Controller.  This project  will show how to fetch contacts from Contacts API and how to make contacts as Favorite. 

Shortnotes on the below topics :-

- TableView Controller
- UINavigation Controller
- Contacts API
- Rename the Xcode Project


## UITableViewController
A view controller that specializes in managing a table view.

```sh
class UITableViewController : UIViewController
```

A table view controller typically has these visible components:
- A table view, which is the user interface component, or view, that’s shown on screen. A table view is an instance of the UITableView class, which is a subclass of UIScrollView.
-  Table view cells, which are the repeatable rows, or views, shown in the table view. A table view cell is an instance of a UITableViewCell class, and that class is often subclassed to create custom table view cells.

A table view controller also relies on the use of these components, behind-the scenes:
- A table view delegate, which is responsible for managing the layout of the table view and responding to user interaction events. A table view delegate is an instance of the UITableViewDelegate class.
- A table view data source, which is responsible for managing the data in a table view, including table view cells and sections. A data source is an instance of the UITableViewDataSource class.

As per the Model-View-Controller architecture, a table view and a table view cell are views, and a table view controller is a controller.

Views are responsible for displaying information visibly to the user, with a user interface (UI). Controllers are responsible for implementing logic, managing data and taking decisions. Said differently: you can’t see a controller, but it’s there, managing what you see through views.



### IndexPath
Every time the table view controller needs a cell from tableView(_:cellForRowAt:), it provides an index path as an argument for the function. Within the function body you can use the parameter indexPath to know exactly which cell the table view controller needs.    


The most important functions for UITableViewDataSource are:
-    numberOfSections(in:)
-    tableView(_:numberOfRowsInSection:)
-    tableView(_:cellForRowAt:)


## UINavigationController
A navigation controller maintains a stack of view controllers. When we design our navigation controller, we need to specify the very first view the user sees. That view’s controller is called the root view controller, or simply root controller, and is the base of the navigation controller’s stack of view controllers.

### UINavigationBar
Navigational controls displayed in a bar along the top of the screen, usually in conjunction with a navigation controller.

## Contacts API 
Access the user's contacts and format and localize contact information.
[Conatcts API](https://developer.apple.com/documentation/contacts)

## How to rename the Project name in Xcode
My project name in Xcode was Contacts, because of which I faced problem to import the Contacts API. So I had to rename my project.
[Rename the Project Name](https://stackoverflow.com/questions/33370175/how-do-i-completely-rename-an-xcode-project-i-e-inclusive-of-folders)

[!NOTE]

>Please note I have refered various source to make my shortnotes
> Reference Sources :-
> - [TableViewController](https://learnappmaking.com/table-view-controller-uitableviewcontroller-how-to/)
> - [Conatcts API](https://developer.apple.com/documentation/contacts)
> - [Rename the Project Name](https://stackoverflow.com/questions/33370175/how-do-i-completely-rename-an-xcode-project-i-e-inclusive-of-folders)


