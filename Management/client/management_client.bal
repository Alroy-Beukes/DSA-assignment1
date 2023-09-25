import ballerina/io;

ManagementClient ep = check new ("http://localhost:9090");

public function main() returns error? {

    function addBook() returns string|error {

        string Title = io:readln("Enter Book Title: ");
        string Author = io:readln("Enter Authors Name: ");
        string Location = io:readln("Enter the Book's location in the library: ");
        // string ISBN = io:readln("Enter the Book's isbn number: ");
        string identifier = uuid:createType4AsString();
        string ISBN = identifier;
        string Status = io:readln("Is the book available? (yes/no): ");
        string Author2 = "";
        string response = io:readln("Do you want to enter an additional author? (yes/no): ");

        if (response == "yes") {
            Author2 = io:readln("Enter the additional author's name: ");
        }

        Book book = {
            title: Title,
            author_1: Author,
            author_2: Author2,
            location: Location,
            isbn: ISBN,
            status: Status
    
        };

        string addedBook = check ep->addBook(book);

        io:println("The book we added has an isbn of " + book.isbn);

        string input = io:readln("\n\nEnter (1) to return to Exit: ");

        if input == "1" {
            return Menu();
        }
        return addedBook;
    }
}

function createUser() returns string|error {

    string studentID = uuid:createType1AsString();
    string UserId = studentID;
    string Name = io:readln("Enter User Name: ");
    string  profile= io:readln("Enter Profile: ");
    io:println("The student ID is " + UserId);

    User theUser = {
        userId :  UserId,
        name : Name,
        accountType: profile
    };

    string addedUser = check ep->createUser(theUser);

    io:println(addedUser);

    string input=io:readln("\n\nEnter (1) to return to Exit: ");

    if input == "1" {
        return Menu();
    }

    return addedUser;
}

