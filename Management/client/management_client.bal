import ballerina/io;

ManagementClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    Book addBookRequest = {title: "ballerina", author_1: "ballerina", author_2: "ballerina", location: "ballerina", isbn: "ballerina", status: "ballerina"};
    string addBookResponse = check ep->addBook(addBookRequest);
    io:println(addBookResponse);

    User createUserRequest = {userId: "ballerina", name: "ballerina", accountType: "ballerina"};
    User createUserResponse = check ep->createUser(createUserRequest);
    io:println(createUserResponse);

    Book updateBookRequest = {title: "ballerina", author_1: "ballerina", author_2: "ballerina", location: "ballerina", isbn: "ballerina", status: "ballerina"};
    Book updateBookResponse = check ep->updateBook(updateBookRequest);
    io:println(updateBookResponse);

    string removeBookRequest = "ballerina";
    string removeBookResponse = check ep->removeBook(removeBookRequest);
    io:println(removeBookResponse);

    string availableBooksResponse = check ep->availableBooks();
    io:println(availableBooksResponse);

    string locateBookRequest = "ballerina";
    string locateBookResponse = check ep->locateBook(locateBookRequest);
    io:println(locateBookResponse);

    Borrowed_books borrowBookRequest = {userId: "ballerina", isbn: "ballerina"};
    string borrowBookResponse = check ep->borrowBook(borrowBookRequest);
    io:println(borrowBookResponse);
}

