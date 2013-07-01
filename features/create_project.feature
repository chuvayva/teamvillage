Feature: create new project
  As a logged in user
  I want to create my own new project 

Background:

	Given the following users exist:
	  | name	| email						    | password	|
	  | Fedor	| baikonur_1@bk.ru		| 123456		|
	  | Max		| baikonur_2@bk.ru		| 123456		|

	And the following projects exist:
		|	name		| owner |
		|	Mars		| Fedor |

Scenario: create project
  Given I am sign in as "Fedor" with password "123456"
  And I am on the home page
  When I follow "New Project"
  Then should be on create project page
  When I fill in "Name" with "Team Village"
  And press "Save"
  Then I should be on the "Team Village" project page
  And should see "Team Village"


Scenario: add task to project
  Given I am sign in as "Fedor" with password "123456"
  And I am on the "Mars" project page
  When I follow "Add Task"
  Then should see "New task"
  When I fill in "Name" with "Count satellites"
  When I fill in "Persentage" with "3"
  And select "Max" from "Executer"
  And press "Save"
  # Then I should be on the "Mars" project page
  When I am on the "Mars" project page
  And should see "Count satellites"



