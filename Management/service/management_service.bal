import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: MANAGEMENT_DESC}
service "Management" on ep {

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

