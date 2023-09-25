import ballerina/http;
import ballerina/io;

type Lecturer readonly & record {
    string staffNumber;
    string staffName;
    string staffTitle?;
    string officeNumber?;
    [string, string, string][] courses;
};

table<Lecturer> key(staffNumber) lecturers = table [];

service /lecturerapp on new http:Listener(6100) {
    resource function post createLecturer(Lecturer lecturer) returns string {
    
    }

    resource function get allLecturers() returns table<Lecturer> {
        
    }

    resource function put updateLecturer(Lecturer lecturer) returns string {
        io:println(lecturer);
        return string `${lecturer.staffName} updated successfully`;
    }

    resource function get lecturerInfo(string staffNumber) returns Lecturer|string {
    
    }

    resource function delete deleteLecturerByStaffNumber(string staffNumber) returns string {
    

    }

    resource function get lecturersByCourseCode(string courseCode) returns Lecturer[] {

    }

    resource function get lecturersByOfficeNumber(string officeNumber) returns Lecturer[] {
    
    }

}
