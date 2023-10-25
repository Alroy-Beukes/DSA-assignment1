import ballerina/graphql;
import ballerina/io;


public function main() returns error? {

    graphql:Client graphqlClient = check new ("localhost:8080/graphql");
    
    io:println("Welcome to the Performamnce Management System of the Computing and Informatics Faculty");

    io:println("1. Register: ");
    io:println("2. Login");
    io:println("3. Create Department Objectives");
    
    string option = io:readln("Choose an option: ");

    match option {
        
        "1" => {
            string firstName = io:readln("Enter first name: ");
            string lastName = io:readln("Enter last country: ");
            string email = io:readln("Enter email address: ");
            string jobTitle = io:readln("Enter job title: ");
            string role = io:readln("Enter the role of the staff memeber: ");
            string departmentId = io:readln("Enter department ID: ");
            string supervisorId = io:readln("Enter supervisor ID if any: ");

            string graphqlMutationRegister = "mutation NewRegistration($firstName: String!, $lastName: String!, $email: String!," + 
                " $jobTitle: String!, $role: String!, departmentId: String!, supervisorId: String!) {" + 
                " register(" +
                " firstName: $firstName," +
                " lastName: $lastName," +
                " email: $email," +
                " jobTitle: $jobTitle," +
                " role: $role" +
                " departmentId: departmentId" +
                " supervisorId: supervisorId" +
                " )} ";

            map<string> variables = {
                "firstName": firstName,
                "lastName": lastName,
                "email": email,
                "jobTitle": jobTitle,
                "role": role,
                "departmentId": departmentId,
                "supervisorId": supervisorId
            };

            var CreateCourseResponse = check graphqlClient->execute(graphqlMutationRegister, variables, "NewRegistration", (), [string]);
    
            io:println(CreateCourseResponse);

            }
        
        "2" => {
            string firstName = io:readln("Enter first name: ");
            string lastName = io:readln("Enter last name: ");
            string email = io:readln("Enter email address: ");
            string password = io:readln("Enter password: "); // You need to get the user's password

            string graphqlMutationLogin = "mutation LoginUser($firstName: String!, $lastName: String!, $email: String!," + 
                " $password: String!) {" + 
                " login(" +
                " firstName: $firstName," +
                " lastName: $lastName," +
                " email: $email," +
                " password: $password" +
                " )} ";
            
            map<string> variables = {
                "firstName": firstName,
                "lastName": lastName,
                "email": email,
                "password": password
            };

            var CreateCourseResponse = check graphqlClient->execute(graphqlMutationLogin, variables, "LoginUser", (), [string]);
    
            io:println(CreateCourseResponse);
            io:println("token generated");
        }
        "3" => {
            string name = io:readln("Enter the name of the objective: ");
            string weight = io:readln("Enter the weight of this objective towards the Departmentss' goals: ");
            string departmentId = io:readln("Enter the department number to which this objective belongs to: ");

            string graphqlMutatioObj = "mutation AddDepartObj($name: String!, $weight: String!, $departmentId: String!," +  
                " createDepartmentObjective(" +
                " name: $name," +
                " weight: $weight," +
                " departmentId: $departmentId," +
                " )} ";

            map<string> variables = {
                "name": name,
                "weight": weight,
                "departmentId": departmentId
            };

            var CreateCourseResponse = check graphqlClient->execute(graphqlMutatioObj, variables, "NewRegistration", (), [string]);
    
            io:println(CreateCourseResponse);
        }
    }
}