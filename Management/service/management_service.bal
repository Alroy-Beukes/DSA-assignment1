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

    remote function updateBook(Book partBook) returns Book?|string {
        
         Book? theBook = self.books[partBook.isbn];
        
        if theBook == (){
            return "Error book with isbn number "+partBook.isbn+" not found";
            
        }else{
            string? title = partBook?.title;
            if title != (){
                theBook.title = title;
            }

            string? author = partBook?.author_1;
            if author != () {
                theBook.author_1 = author;
            }

            string? author2 = partBook?.author_2;
            if author != () {
                theBook.author_2 = author;
            }

            string? location = partBook?.location;
            if location != () {
                theBook.location = location;
            }

            string? status = partBook?.status;
            if status != () {
                theBook.status = status;
            }
        }
        
        return theBook;

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
    remote function borrowBook(Borrowed_books book) returns string|error {
        // Check if the book exists in the library
        Book? theBook = self.books[book.isbn];
    
        // Check if the user exists
        if (self.users[book.userId] == ()) {
            return "User with ID " + book.userId + " not found";
        }
    
        // Check if the book exists
        if (theBook == ()) {
            return "Book with ISBN " + book.isbn + " not found";
        }
    
        // Record the book as borrowed
        self.borrowedBooks.add(book);
    
        return "Book with ISBN " + book.isbn + " was borrowed by user " + book.userId;
    }
}

