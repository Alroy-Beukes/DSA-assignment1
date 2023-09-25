import ballerina/grpc;
import ballerina/io;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: MANAGEMENT_DESC}
service "Management" on ep {

    private table<Book> key(isbn) books;
    private table<User> key(userId) users;
    private table<Borrowed_books> key(isbn) borrowedBooks;

    function  init() {
        
        self.books = table[];
        self.users = table[];
        self.borrowedBooks = table [];

     }

    remote function addBook(Book value) returns string|error {
    }
    remote function createUser(User value) returns User|error {
    }
    remote function updateBook(Book value) returns Book|error {
    }
    remote function removeBook(string value) returns string|error {
    }
    remote function availableBooks() returns string|error {
    }
    remote function locateBook(string value) returns string|error {
    }
    remote function borrowBook(Borrowed_books value) returns string|error {
    }
}

