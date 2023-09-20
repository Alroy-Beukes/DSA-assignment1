import ballerina/grpc;
import ballerina/io;
listener grpc:Listener ep = new (9090); 

table<bookInfo> key(book_isbn) books = table [];
table<userInfo> key(id) users = table [];

@grpc:Descriptor {value: LIBRARY_DESC}

service "LibraryManagement" on ep {

    remote function addUser(userInfo user) returns string {
        io:println(user);
        error? err = users.add(user);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${user.first_name} saved successfully`;
    }
    remote function addBook(bookInfo book) returns string {
        io:println(book);
        error? err = books.add(book);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${book.title} saved successfully`;
    }
    remote function updateBook(bookInfo book) returns string {
        io:println(book);
        error? err = books.put(book);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${book.title} saved successfully`;
    }
    remote function deleteBook() returns string {
        books = <table<bookInfo> key(book_isbn)>books.filter((book) => book.book_isbn != book_isbn);
    }
    remote function getBookByISBN() returns bookInfo|string {
        foreach bookInfo book in books {
            if (book.book_isbn === book_isbn) {
                return book;
            }
        }
        return book_isbn + " is invalid";
    }
    remote function listBooks() returns table<bookInfo> key(book_isbn) {
        return books;
    }
}

