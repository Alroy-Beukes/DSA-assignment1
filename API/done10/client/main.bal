import ballerina/io;
import ballerina/http;
import ballerina/uuid;

type Lecturer record {
    string staffNumber?;
    string staffName?;
    string staffTitle?;
    string officeNumber?;
    [string, string, string][] courses?;
};


public function main() returns error? {
   

    http:Client lecturerClient = check new ("localhost:6100/lecturerapp");

    io:println("1. Add a new Lecturer: ");
    io:println("2. Retrieve a list of all lecturers");
    io:println("3. Update a lecturer's information");
    io:println("4. Retreive the details of a specfic lecturer based on their staff number");
    io:println("5. Delete a particular lecturer");
    io:println("6. Retrieve all the lecturers that teach a certain course");
    io:println("7. Retrieve all the lecturers that sit in the same office");
    string option = io:readln("Choose an option: ");

    match option {
        
        "1" => {
            Lecturer lecturer = {};
            string staffNumberUUID = uuid:createType1AsString();
            lecturer.staffNumber = staffNumberUUID;
            lecturer.staffName = io:readln("Enter the lecturer's name: ");
            lecturer.staffTitle = io:readln("Enter the lecturer's title: ");
            lecturer.officeNumber = io:readln("Enter the office number: ");
            string again = io:readln("Press 1 to add a course: ");

            while (again === "1") {
                [string, string, string][] courseObjects = addCourses();        
                lecturer.courses = courseObjects;

                again = io:readln("Press 1 to add another course| Press 2 to stop: ");

            }
            

            check create(lecturerClient, lecturer);

            io:println(lecturer.staffNumber, " ", lecturer.staffName, " ", lecturer.staffTitle, " ", lecturer.officeNumber, " ", lecturer.courses);
        }
        "2" => {
            check getAll(lecturerClient);
        }
        "3" => {
            Lecturer lecturer = {};

            string sameStaffNumber = io:readln("Enter the staff number of the lecturer you want to update: ");
            lecturer.staffNumber = sameStaffNumber;

            // Prompt the user for updated information
            string updatedName = io:readln("Enter the updated name: ");
            string updatedTitle = io:readln("Enter the updated title: ");
            string updatedOfficeNumber = io:readln("Enter the updated office number: ");
            
            // Update the lecturer object with the new data
            lecturer.staffName = updatedName;
            lecturer.staffTitle = updatedTitle;
            lecturer.officeNumber = updatedOfficeNumber;

            string again = io:readln("Press 1 to add a course: ");

            while (again === "1") {
                [string, string, string][] courseObjects = addCourses();        
                lecturer.courses = courseObjects;

                again = io:readln("Press 1 to add another course| Press 2 to stop: ");

            }

            check update(lecturerClient, lecturer, sameStaffNumber);

            io:println(lecturer.staffNumber, " ", lecturer.staffName, " ", lecturer.staffTitle, " ", lecturer.officeNumber, " ", 
                        lecturer.courses);
        }
        "4" => {
            string lecturerStaffNumber = io:readln("Retrieve a specific lecturer's info: ");
            check getLecturerByStaffNumber(lecturerClient, lecturerStaffNumber);
        }
        "5" => {
            string lecturerStaffNumber = io:readln("Enter Lecturer's staff number: ");
            check deleteLecturer(lecturerClient, lecturerStaffNumber);
        }
        "6" => {
            string courseCodee = io:readln("Enter the course code: ");
            check retrieveLecturersByCourse(lecturerClient, courseCodee);
        }
        "7" => {
            string officeNumberr = io:readln("Enter the office number: ");
            check retrieveLecturersByOffice(lecturerClient, officeNumberr);
        }
        _ => {
            io:println("Invalid Key");
            check main();
        }
    }
}

function addCourses() returns [string, string, string][] {
    [string, string, string][] courses = [];
    
    while (true) {
        string courseName = io:readln("Enter your course name (or press Enter to stop adding courses): ");
        if (courseName == "") {
            break; // Stop adding courses if the user presses Enter
        }

        string courseCode = io:readln("Enter your course code: ");
        string nqfLevel = io:readln("Enter your nqf level: ");
        
        courses.push([courseName, courseCode, nqfLevel]);
    }
    
    return courses;
}

public function create(http:Client http, Lecturer lecturer) returns error? {
    if (http is http:Client) {
        // Serialize the lecturer object to JSON
        string message = lecturer.toString(); // Assuming a toString() function for your Lecturer record
        message = check http->/createLecturer.post(lecturer);
        io:println(message);
        string exit = io:readln("Press 0 to go back: ");

        if (exit === "0") {
            error? mainResult = main();
            if mainResult is error {
                io:println("Error, You can't go back.");
            }
        }
    }
}

public function getAll(http:Client http) returns error? {
    if (http is http:Client) {
        Lecturer[] lecturers = check http->/allLecturers;
        foreach Lecturer item in lecturers {
            io:println("--------------------------");
            io:println("Lecturer name: ", item.staffName);
        }

        io:println("--------------------------");
        string exit = io:readln("Press 0 to go back: ");

        if (exit == "0") {
            error? mainResult = main();
            if mainResult is error {
                io:println("Error, You can't go back.");
            }
        }
    }
}

public function getLecturerByStaffNumber(http:Client http, string staffNumber) returns error? {
    if (http is http:Client) {
        Lecturer lecturer = check http->/lecturerInfo(staffNumber = staffNumber);
        io:println("--------------------------");
        io:println("Staff Number: ", lecturer.staffNumber);
        io:println("Lecturer name: ", lecturer.staffName);
        io:println("Lecturer title: ", lecturer.staffTitle);
        io:println("Lecturer office number: ", lecturer.officeNumber);
        io:println("Lecturer courses: ", lecturer.courses);
        io:println("--------------------------");
        string exit = io:readln("Press 0 to go back: ");

        if (exit == "0") {
            error? mainResult = main();
            if mainResult is error {
                io:println("Error, You can't go back.");
            }
        }
    }
}

public function update(http:Client http, Lecturer lecturer, string staffNumber) returns error? {
    if (http is http:Client) {
        // Serialize the lecturer object to JSON
        string message = lecturer.toString(); // Assuming a toString() function for your Lecturer record
        message = check http->/updateLecturer.put(lecturer);
        io:println(message);
        string exit = io:readln("Press 0 to go back: ");

        if (exit === "0") {
            error? mainResult = main();
            if mainResult is error {
                io:println("Error, You can't go back.");
            }
        }
    }
}

public function deleteLecturer(http:Client http, string staffNumber) returns error? {
    if (http is http:Client) {
        string message = check http->/deleteLecturerByStaffNumber.delete(staffNumber = staffNumber);
        io:println(message);
        io:println("--------------------------");
        string exit = io:readln("Press 0 to go back: ");
        if (exit == "0") {
            error? mainResult = main();
            if mainResult is error {
                io:println("Error, You can't go back.");
            }
        }
    }
}

public function retrieveLecturersByCourse(http:Client http, string courseCode) returns error? {
   if (http is http:Client) {
        Lecturer[] lecturers = check http->/lecturersByCourseCode(courseCode = courseCode);

        foreach Lecturer item in lecturers {
            io:println("--------------------------");
            io:println("Lecturer name: ", item.staffName);
        }
        
        io:println("--------------------------");
        string exit = io:readln("Press 0 to go back: ");

        if (exit == "0") {
            error? mainResult = main();
            if mainResult is error {
                io:println("Error, You can't go back.");
            }
        }
    } 
} 
