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

    remote function addBook(Book book) returns string|error {
        self.books.add(book);

        io:println("Book added: ISBN - " + book.isbn);

        return "You added " + book.isbn + " ";
    }

    remote function createUser(User user) returns User|error {
        self.users.add(user);
        return "New user added: "+user.name;
    }

    remote function updateBook(Book value) returns Book|error {
    }
    remote function removeBook(string isbn) returns string|error {
        Book? theBook = self.books[isbn];
         
        Book? newBooks=self.books.remove(isbn);
    
        if newBooks == () {
            return  "No book removed";
        } else {
            // return newBooks.toString();
            return self.books.toString();
        }
    }
    remote function availableBooks() returns string|error {
    }
    remote function locateBook(string value) returns string|error {
    }
    remote function borrowBook(Borrowed_books value) returns string|error {
    }
}

