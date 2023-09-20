import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.empty;
import ballerina/protobuf.types.wrappers;

public const string LIBRARY_DESC = "0A0D4C6962726172792E70726F746F12114C6962726172794D616E6167656D656E741A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F2298010A08626F6F6B496E666F12140A057469746C6518012001280952057469746C6512190A08617574686F725F311802200128095207617574686F723112190A08617574686F725F321803200128095207617574686F723212230A0D626F6F6B5F6C6F636174696F6E180420012809520C626F6F6B4C6F636174696F6E121B0A09626F6F6B5F6973626E1805200128095208626F6F6B4973626E22240A08526573706F6E647312180A076D65737361676518012001280952076D657373616765221E0A08626F6F6B4953424E12120A046973626E18012001280952046973626E22C8010A0875736572496E666F121D0A0A66697273745F6E616D65180120012809520966697273744E616D65121B0A096C6173745F6E616D6518022001280952086C6173744E616D65120E0A0269641803200128095202696412460A0A6F636375706174696F6E18042001280E32262E4C6962726172794D616E6167656D656E742E75736572496E666F2E4F636375706174696F6E520A6F636375706174696F6E22280A0A4F636375706174696F6E120B0A0773747564656E741000120D0A096C696272617269616E100132BE030A114C6962726172794D616E6167656D656E7412430A0761646455736572121B2E4C6962726172794D616E6167656D656E742E75736572496E666F1A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312430A07616464426F6F6B121B2E4C6962726172794D616E6167656D656E742E626F6F6B496E666F1A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312460A0A757064617465426F6F6B121B2E4C6962726172794D616E6167656D656E742E626F6F6B496E666F1A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312470A0A64656C657465426F6F6B121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1B2E4C6962726172794D616E6167656D656E742E526573706F6E647312420A096C697374426F6F6B7312162E676F6F676C652E70726F746F6275662E456D7074791A1B2E4C6962726172794D616E6167656D656E742E626F6F6B496E666F3001124A0A0D676574426F6F6B42794953424E121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1B2E4C6962726172794D616E6167656D656E742E626F6F6B496E666F620670726F746F33";

public isolated client class LibraryManagementClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function addUser(userInfo|ContextUserInfo req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        userInfo message;
        if req is ContextUserInfo {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.LibraryManagement/addUser", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function addUserContext(userInfo|ContextUserInfo req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        userInfo message;
        if req is ContextUserInfo {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.LibraryManagement/addUser", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function addBook(bookInfo|ContextBookInfo req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        bookInfo message;
        if req is ContextBookInfo {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.LibraryManagement/addBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function addBookContext(bookInfo|ContextBookInfo req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        bookInfo message;
        if req is ContextBookInfo {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.LibraryManagement/addBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function updateBook(bookInfo|ContextBookInfo req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        bookInfo message;
        if req is ContextBookInfo {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.LibraryManagement/updateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function updateBookContext(bookInfo|ContextBookInfo req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        bookInfo message;
        if req is ContextBookInfo {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.LibraryManagement/updateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function deleteBook(string|wrappers:ContextString req) returns Responds|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.LibraryManagement/deleteBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Responds>result;
    }

    isolated remote function deleteBookContext(string|wrappers:ContextString req) returns ContextResponds|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.LibraryManagement/deleteBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Responds>result, headers: respHeaders};
    }

    isolated remote function getBookByISBN(string|wrappers:ContextString req) returns bookInfo|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.LibraryManagement/getBookByISBN", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <bookInfo>result;
    }

    isolated remote function getBookByISBNContext(string|wrappers:ContextString req) returns ContextBookInfo|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryManagement.LibraryManagement/getBookByISBN", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <bookInfo>result, headers: respHeaders};
    }

    isolated remote function listBooks() returns stream<bookInfo, grpc:Error?>|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("LibraryManagement.LibraryManagement/listBooks", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BookInfoStream outputStream = new BookInfoStream(result);
        return new stream<bookInfo, grpc:Error?>(outputStream);
    }

    isolated remote function listBooksContext() returns ContextBookInfoStream|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("LibraryManagement.LibraryManagement/listBooks", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BookInfoStream outputStream = new BookInfoStream(result);
        return {content: new stream<bookInfo, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public class BookInfoStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|bookInfo value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|bookInfo value;|} nextRecord = {value: <bookInfo>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public type ContextBookInfoStream record {|
    stream<bookInfo, error?> content;
    map<string|string[]> headers;
|};

public type ContextBookInfo record {|
    bookInfo content;
    map<string|string[]> headers;
|};

public type ContextUserInfo record {|
    userInfo content;
    map<string|string[]> headers;
|};

public type ContextResponds record {|
    Responds content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type bookInfo record {|
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string book_location = "";
    readonly string book_isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type userInfo record {|
    string first_name = "";
    string last_name = "";
    string id = "";
    userInfo_Occupation occupation = student;
|};

public enum userInfo_Occupation {
    student, librarian
}

@protobuf:Descriptor {value: LIBRARY_DESC}
public type bookISBN record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Responds record {|
    string message = "";
|};

