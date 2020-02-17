var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "",
  database: "employeeTracker_db"
});

connection.connect(function(err) {
  if (err) throw err;
  startApp();
});

function startApp() {
    inquirer.prompt([
        {
            type:"list",
            name:"task",
            message:"Which would your like to do?",
            choices: [
                "View all employee", 
                "View all employee by department", 
                "View all employee by manager",
                "Add employee",
                "Remove employee",
                "Update employee role",
                "Update employee manager"
            ]

        }
    ]).then(function(answer) {

       
        if (answer.task === "View all employee" ) {
            viewAllEmp();
        }
        if (answer.task === "Add employee") {
            addEmp();
        }
        if (answer.task === "Remove employee") {
            removeEmp();
        }
    })
};

function viewAllEmp() {
  connection.query("SELECT * FROM employee_table", function(err, res) {
      if (err) throw err;
      console.log(res);

  })

  
}