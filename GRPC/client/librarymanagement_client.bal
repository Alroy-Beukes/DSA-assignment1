import ballerina/io;

LibraryManagementClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    io:println("1. Create Student");
    io:println("2. Create Librarian");

    string option_1 = io:readln("Choose an option: ");

    match option_1 {
        "1" => {
            userInfo user = {};
            user.first_name = io:readln("Enter user Name: ");
            user.last_name = io:readln("Enter user Surname: ");
            user.id = io:readln("Enter user id: ");
            user.occupation = io:readln("Enter user Occupation: "); //enum not working

            io:println("1. List available books");
            io:println("2. Locate a book");
            io:println("3. Borrow a book");
            string option_2 = io:readln("Choose an option: ");

            match option_2 {
                "1" => {

                }

                "2" => {

                }

                "3" => {

                }


            }

        }

        "2" => {
            userInfo user = {};
            user.first_name = io:readln("Enter user Name: ");
            user.last_name = io:readln("Enter user Surname: ");
            user.id = io:readln("Enter user id: ");
            user.occupation = io:readln("Enter user Occupation: "); //enum not working            


            io:println("1. Add a Book");
            io:println("2. Update a book");
            io:println("3. Remove a book");
            string option_2 = io:readln("Choose an option: ");

            match option_2 {
                "1" => {

                }

                "2" => {

                }

                "3" => {

                }


            }            

        }

         _ => {
            io:println("Invalid Key");
            check main();
        }
    }


    userInfo addUserRequest = {first_name: "ballerina", last_name: "ballerina", id: "ballerina", occupation: "student"};
    Responds addUserResponse = check ep->addUser(addUserRequest);
    io:println(addUserResponse);

    bookInfo addBookRequest = {title: "ballerina", author_1: "ballerina", author_2: "ballerina", book_location: "ballerina", book_isbn: "ballerina"};
    Responds addBookResponse = check ep->addBook(addBookRequest);
    io:println(addBookResponse);

    bookInfo updateBookRequest = {title: "ballerina", author_1: "ballerina", author_2: "ballerina", book_location: "ballerina", book_isbn: "ballerina"};
    Responds updateBookResponse = check ep->updateBook(updateBookRequest);
    io:println(updateBookResponse);

    string deleteBookRequest = "ballerina";
    Responds deleteBookResponse = check ep->deleteBook(deleteBookRequest);
    io:println(deleteBookResponse);

    string getBookByISBNRequest = "ballerina";
    bookInfo getBookByISBNResponse = check ep->getBookByISBN(getBookByISBNRequest);
    io:println(getBookByISBNResponse);
    stream<

bookInfo, error?> listBooksResponse = check ep->listBooks();
    check listBooksResponse.forEach(function(bookInfo value) {
        io:println(value);
    });
}

