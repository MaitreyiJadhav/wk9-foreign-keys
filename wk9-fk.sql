CREATE DATABASE todoList;

use todoList;

CREATE TABLE projects (
            projectID int NOT NULL auto_increment,
            projectName varchar(150)  NOT NULL,
            PRIMARY KEY (projectID)
          );

ALTER TABLE projects
         ADD COLUMN projectDescription text not null AFTER projectName;


 ALTER TABLE projects ADD INDEX project_index(projectName);

 CREATE TABLE todoItems (
            todoID int  NOT NULL auto_increment,
            todoItem varchar(255)  NOT NULL,
            todoStatus BOOL NOT NULL,

            dateCreated DATETIME DEFAULT NOW()  NOT NULL,

            PRIMARY KEY (todoID)
          );


ALTER TABLE todoItems ADD INDEX project_index(todoItem);

ALTER TABLE `todoItems`
          ADD COLUMN projectID INT not null AFTER dateCreated;

ALTER TABLE `todoItems`
ADD FOREIGN KEY (projectID) REFERENCES projects(projectID);

INSERT INTO projects (projectName, `projectDescription`)
          VALUES ('Database', 'introduction to database');

INSERT INTO todoItems (todoItem, todoStatus,dateCreated, `projectID`)
          VALUES ('study for exam', 'true', '2019-02-25', 3);


UPDATE projects
SET projectDescription = 'introduction to database part2'
WHERE `projectID` = 3;


  DELETE FROM `todoItems` WHERE `projectID` = 3;

  UPDATE `todoItems`
          SET todoItem = 'study for midterm'
          WHERE `projectID` = 3;
