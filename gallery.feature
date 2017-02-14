Feature: Post group work
	Scenarios created by Gallery Team (Ivans Cvetkovs, Una Drilina, Andrejs Safonovs and Arturs Maksimovics)

@ViewAllGalleries
Scenario: View all Galleries
	Given We are home page 
	And User have clicked on Photo Gallery in the menu
	Then All galleries are shown

#@ViewAllGalleries
#Scenario: Change order of galleries in all galleries
	
@ViewALlGalleries
Scenario: Publish gallery via symbol or bulk action
	Given we are on Gallery list page
	When user press publish button
	Then all selected fields should be published
	
@ViewAllGalleries
Scenario: Delete gallery via symbol or bulk action
	Given we are on Gallery list page
	When User press delete button
	Then All selected gallery should be deleted
	And It could not be restored
	
@ViewAllGalleries
Scenario: Unpublish gallery via symbol or bulk action
	Given we are on Gallery list page
	When User presses unpublish button
	Then All galleries should be unpublished
	
@ViewAllGalleries
Scenario: Search for gallery by name
	Given we are on Gallery list page
	When User search by gallery "name"
	Then "name" should appear
	
@ViewAllGalleries
Scenario: Add new gallery
	Given we are on Gallery list page
	When User click on add new gallery
	Then Create new gallery form should appear

@ViewAllAlbums
Scenario: Add new album from Add Galleries/Albums menu
	Given we are on home page
	When User click on Albums in the menu
	Then Create new Album form is shown

@ViewAllAlbums
Scenario: Add new album from album view menu
	Given we are on Albums view page
	When User click on Add new
	Then Create new album form is shown

@ViewAllAlbums
Scenario: Search for albums by name
	Given we are on Albums view page
	When User enters "name" in search field
	Then "name" album appears

	
@ViewAllAlbums
Scenario: Publish album by icon or bulk action
	Given we are on Albums view page
	When User click on publish icon
	Then All selected albums should be published

@ViewAllAlbums
Scenario: Unpublish album by icon or bulk action
	Given we are on Albums view page
	When User click on unpublish icon
	Then All selected albums should be unpublished
	
@ViewAllAlbums
Scenario: Delete album by icon or bulk action
	Given we are on Albums view page
	When User click on delete icon
	Then All selected albums should be deleted
	

@ViewAllAlbums
Scenario Outline: 
	Given we are on Albums view page
	When User press <button> (edit or name)
	Then Album edit form is displayed
Examples:
| button | 
| Edit	 |
| Name	 |

@ViewAllAlbums
Scenario Outline:
	Given we are on Albums view page
	When User click on <field> 
	Then Everything is sorted by <field> ascending
	When User press <field>
	Then Everything is sorted by <field> descending
Examples:
| field     |
| Name      |
| Slug      |
| Author    |
| Published |
