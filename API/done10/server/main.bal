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
        io:println(lecturer);
        error? err = lecturers.add(lecturer);
        if (err is error) {
            return string `Error, ${err.message()}`;
        }
        return string `${lecturer.staffName} saved successfully`;
    }

    resource function get allLecturers() returns table<Lecturer> {
        return lecturers;
    }


    resource function put updateLecturere(Lecturer lecturer) returns string {
        io:println(lecturer);
        return string `${lecturer.staffName} updated successfully`;
    }

    resource function get lecturerInfo(string staffNumber) returns Lecturer|string {
        foreach Lecturer lecturer in lecturers {
            if (lecturer.staffNumber === staffNumber) {
                return lecturer;
            }
        }

        return staffNumber + " is invalid";
    }

    resource function put updateLecturer(Lecturer lecturer) returns string {
        io:println(lecturer);
        return string `${lecturer.staffName} updated successfully`;
    }

    resource function get lecturerInfo(string staffNumber) returns Lecturer|string {
    
    }

   // table<Lecturer>  lecturers = table [];

    resource function delete deleteLecturerByStaffNumber(string staffNumber) returns string {

        // Try to remove the lecturer by staff number
        Lecturer? removedLecturer = lecturers.remove(staffNumber);

        if (removedLecturer == null) {
            return "Lecturer not found";
        }

        return string `${removedLecturer.staffName} deleted successfully`;
    }

     resource function get lecturersByCourseCode(string courseCode) returns Lecturer[] {
        Lecturer[] matchingLecturers = [];

        foreach var lecturer in lecturers {
            boolean hasMatchingCourse = false;
            foreach var course in lecturer.courses {
                if (courseCode == course[1]) {
                    hasMatchingCourse = true;
                    break; // Break out of the inner loop once a match is found
                }
            }

            if (hasMatchingCourse) {
                matchingLecturers.push(lecturer);
            }
        }

        return matchingLecturers;
    }


resource function get lecturersByOfficeNumber(string officeNumber) returns Lecturer[] {
        Lecturer[] matchingLecturers = [];

        foreach var lecturer in lecturers {
            if (officeNumber == lecturer.officeNumber) {
                matchingLecturers.push(lecturer);
            }
        }

        return matchingLecturers;
    }
    
}
