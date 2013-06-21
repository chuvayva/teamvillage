Feature: edit task info

As a user 
So I can edit tasks of the project


Background: 
	Given the following users exist:
	  | name	| email								| password	|
	  | Fedor	| baikonur_1@bk.ru		| 123456		|
	  | Max		| baikonur_2@bk.ru		| 123456		|

	And the following projects exist:
		|	name		| owner |
		|	Mars		| Fedor |

	And the following tasks exist:
		|	name							| project 	| persentage |
		|	Count satellites	| Mars		  | 20 				 |


Scenario: edit task info
	Given I am sign in as "Fedor" with password "123456"
	And I am on the "Mars" project page
	When follow "Edit" button on "Count satellites" task
	Then I should be on edit "Count satellites" task page 
	When I fill in "Name" with "Meet strangers"
	And I fill in "Persentage" with "50"
	And press "Save"
	And should see "Task was successfully updated"