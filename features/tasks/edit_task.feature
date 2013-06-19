# Feature: edit task info

# As a user 
# So I can edit tasks of the project


# Background: 
# 	Given the following users exist:
# 	  | name	| email						| password	|
# 	  | Fedor	| email_1@bk.ru		| 123456		|
# 	  | Max		| email_2@bk.ru		| 123456		|

# 	And the following projects exist:
# 		|	name		| owner |
# 		|	Mars		| Fedor |

# 	And the following tasks exists:
# 		|	name							| executer | persentage |
# 		|	Create DB script	| Fedor 	 | 20 				|


# Scenario: edit task info
# 	Given I am sign in as "Fedor"
# 	And I am on the "Mars" project page
# 	When press edit button on "Create DB script" task
# 	Then I should be on edit task page 
# 	When I fill "Name" with "Download DB script"
# 	And I fill "Persentage" with "50"
# 	And press "Save"
# 	Then I should bу on the "Mars" project page
# 	And should see "task successfully edited"