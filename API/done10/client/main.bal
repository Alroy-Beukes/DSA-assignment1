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
