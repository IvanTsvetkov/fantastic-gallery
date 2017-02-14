Feature: Post group work
	Scenarios created by Gallery Team (Ivans Cvetkovs, Una Drilina, Andrejs Safonovs and Arturs Maksimovics)
#================================By Ivans Cvetkovs=================================================#


@ViewAllGalleries
Scenario: View all Galleries
	Given We are on home page 
	When User have clicked on Photo Gallery in the menu
	Then All galleries are shown

@ViewAllGalleries
Scenario Outline: Change order of galleries in all galleries
	Given we are on Gallery list page
	When user click on <field> <sorttype>
	Then gallery list is sorted by <field> <sorttype> 
	
Examples:
| field  	| sorttype   |
| ID	 	| ascending  |
| Name	 	| descending |
| Slug	 	|
| Author 	|
| Published |	

		
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



#================================By Una Drilina=================================================#

@AddNewGallery
Scenario: User can add new gallery by clicking add gallery
	Given we are on home webpage
	When user go on menu  Photo Galleries
	Then see Photo Galleries menu
		And click on Add Gallery/Image
	Then see form Create new gallery for adding new gallery.
	
@AddNewGallery
Scenario: Existing fields of add gallery form
	Given we are on Create new gallery form
		And user see  fields of:
	|Name:*        |
	|Slug:         |
	|Description:  |
	|Author:       |
	|Published:    | 
	|Preview image:|
	 
	
@AddNewGallery
Scenario Outline: Press apply on add new gallery form
	Given we are on Create new gallery form
	When user fill the form
		And user click on <button>
	Then user see <results>

Examples: 
|button|results|
|apply |"Create new gallery" form will remain open|
|save  | user moved to "All gallery view" page    |

@AddNewGallery
Scenario Outline:  Try to press save or apply if Name field is empty
	Given Open Create new gallery form
		And User leave Name field empty
	When User click on <button> 
	Then appears error message, with message that this field is mandatory

Examples:
|button|
|apply |
|save  |

@AddNewGallery
Scenario: check preview image field (miss info)
	Given we are on Create new gallery form
	When look at preview image field
	Then user see new added image or already existing (in the system)

@EditGallery
Scenario Outline: Edit gallery
	Given We are on all galleries page
	When user click on <button> 
	Then user see Create new gallery form

Examples:
|button		|
|edit symbol|
|name field |

@EditGallery
Scenario Outline: Save edited fields (need more attention)
	Given We are on Create new gallery form
	When user enter <name> on gallery name label
	Then see the new name 
	When user click on <button> 
	Then  see the <results>


Examples:
|name		  |button	|results														 |
|gallery      |apply	|changes will be saved and view will be reload                   |
|gallery      |save 	|changes will be saved and all gallery view will be opened       |
|[empty space]|apply	|appears error message, with message that this field is mandatory|
|[empty space]|save 	|appears error message, with message that this field is mandatory|

@AddNewAlbum
Scenario: Create new album
	Given we are on Albums view page
	When user click on Add new 
	Then user see form to field for new Album ("Create new Album")

@AddNewAlbum
Scenario: Add an existing gallery/album to the album
	Given user open web page
	When user click on Add Album/Gallery in menu
	Then user see all existing albums list
		And user have options to delete/change the order of album/gallery

@AddNewAlbum
Scenario Outline: Fields of Add new Album
	Given we are on  Album view page
	When user click on Add new
	Then user see Create new Album form
		And album has fields:<title> and <type> 
	Examples:
	|title		   |type      |
	|Name:*        |textbox   |
	|Slug:         |textbox   |
	|Description:  |textbox   |
	|Author:       |          |
	|Published:    |check-box |
	|Preview image:|img       |
	
	
#==============================By Arturs Maksimovics=================================================#

@AddGalleryToPage(Thumbnails) @AddGalleryToPage(Slideshow) @AddGalleryToPage(ImageBrowser)
Scenario: Adding gallery to page Thumbnails/Slideshow/Image Browser 
	Given  We are on home page 
	When  User clicks on the gallery icon (camera) in the page content menu 
	Then  Photo gallery form is displayed 

@AddGalleryToPage(Thumbnails) @AddGalleryToPage(Slideshow) @AddGalleryToPage(ImageBrowser)
Scenario Outline: Section selection 
	Given View customization form (Photo gallery) 
	When User selects <section>
	Then corresponding gallery is displayed in the <result> gallery field 
	Examples: 
|	section			|	result			|
|	Thumbnails		|	Thumnails		|
|	Slideshow		|	Slideshow		|
|	Image Browser	| 	Image Browser	|

@AddGalleryToPage(Thumbnails) @AddGalleryToPage(Slideshow) @AddGalleryToPage(ImageBrowser)
Scenario Outline: Gallery choosing 
	Given View customization form (Photo gallery) <section>
	When User selects <name> gallery in the gallery list
	Then corresponding gallery is displayed in the <result> gallery list
	Examples: 
|	section			|	result			|
|	Gallery1		|	Gallery1		|
|	Gallery2		|	Gallery2		|
|	Gallery3		| 	Gallery3		|

@AddGalleryToPage(Thumbnails)
Scenario Outline: Image columns per page 
	Given View customization form (Photo gallery) <section> 
	When User inserts maximal number <input> of image columns 
	Then Users insert input <result> is displayed in the field-box 
	Examples: 
|	section			|	input	|	result	|
|	Thumbnail		|	5		|	5		|


@AddGalleryToPage(Thumbnails) @AddGalleryToPage(ImageBrowser)
Scenario Outline: Images count per page 
	Given View customization form (Photo gallery) <section> 
	When User inserts number <input> of images per page 
	Then Users insert input <result> is displayed in the field-box 
	Examples: 
|	section			|	input	|	result	|
|	Thumbnail		|	5		|	5		|
|	Image Browser	|	5		|	5		|				
				
@AddGalleryToPage(Thumbnails) @AddGalleryToPage(Slideshow) @AddGalleryToPage(ImageBrowser)
Scenario Outline: Ordering by option 
	Given View customization form (Photo gallery) <section> 
	When User selects ordering <option> 
	Then Corresponding <result> is selected 
	Examples: 
|	section			|	option		|	result		|
|	Thumbnail		|	Title		|	Title		|
|	Thumbnail		|	Date		|	Date		|
|	Thumbnail		|	Filename	|	Filename	|
|	Thumbnail		|	Size		|	Size		|
|	Thumbnail		|	Type		|	Type		|
|	Thumbnail		|	Resolution	|	Resolution	|
|	Thumbnail		|	Random		|	Random		|
|	Slideshow		|	Title		|	Title		|
|	Slideshow		|	Date		|	Date		|
|	Slideshow		|	Filename	|	Filename	|
|	Slideshow		|	Size		|	Size		|
|	Slideshow		|	Type		|	Type		|
|	Slideshow		|	Resolution	|	Resolution	|
|	Slideshow		|	Random		|	Random		|
|	Image Browser	|	Title		|	Title		|
|	Image Browser	|	Date		|	Date		|
|	Image Browser	|	Filename	|	Filename	|
|	Image Browser	|	Size		|	Size		|
|	Image Browser	|	Type		|	Type		|
|	Image Browser	|	Resolution	|	Resolution	|
|	Image Browser	|	Random		|	Random		|
					
@AddGalleryToPage(Thumbnails) @AddGalleryToPage(Slideshow) @AddGalleryToPage(ImageBrowser)
Scenario Outline: Sorting by option 
	Given View customization form (Photo gallery) <section> 
	When User selects sort <type> 
	Then Corresponding <result> is selected 
	Examples: 
|	section			|	type		|	result		|
|	Thumbnail		|	Ascending	|	Ascending	|
|	Thumbnail		|	Descending	|	Descending	|
|	Slideshow		|	Ascending	|	Ascending	|
|	Slideshow		|	Descending	|	Descending	|
|	Image Browser	|	Ascending	|	Ascending	|
|	Image Browser	|	Descending	|	Descending	|
						
@AddGalleryToPage(Thumbnails) @AddGalleryToPage(Slideshow) @AddGalleryToPage(ImageBrowser)
Scenario Outline: Image title properties 
	Given View customization form (Photo gallery) <section> 
	When User selects image title <option> 
	Then Image title corresponding <result> is selected 
	Examples: 
|	section			|	option			|	result			|
|	Thumbnails		|	Show on hover	|	Show on hover	|
|	Thumbnails		|	Always show		|	Always show		|
|	Thumbnails		|	Don't show		|	Don't show		|
|	Image Browser	|	Yes				|	Yes				|
|	Image Browser	|	No				|	No				|
|	Slideshow		|	Yes				|	Yes				|
|	Slideshow		|	No				|	No				|
							
@AddGalleryToPage(Thumbnails)
Scenario Outline: Enabling pagination 
	Given View customization form (Photo gallery) <section> 
	When User selects pagination <option> 
	Then Pagination corresponding <result> is selected 
	Examples: 
|	section		|	option			|	result			|
|	Thumbnails	|	Yes				|	Yes				|
|	Thumbnails	|	No				|	No				|
|	Thumbnails	|	Load More		|	Load More		|
|	Thumbnails	|	Scroll Load		|	Scroll Load		|
							
@AddGalleryToPage(Thumbnails) @AddGalleryToPage(ImageBrowser)
Scenario Outline: Thumb click action 
	Given View customization form (Photo gallery) <section> 
	When User selects thumb click action <option> 
	Then Thumb click action corresponding <result> is selected 
	Examples: 
|	section			|	option			|	result			|
|	Thumbnails		|	Open lightbox	|	Open lightbox	|
|	Thumbnails		|	Redirect to url	|	Redirect to url	|
|	Thumbnails		|	Do Nothing		|	Do Nothing		|
|	Image Browser	|	Open lightbox	|	Open lightbox	|
|	Image Browser	|	Redirect to url	|	Redirect to url	|
|	Image Browser	|	Do Nothing		|	Do Nothing		|
						
@AddGalleryToPage(Slideshow) @AddGalleryToPage(ImageBrowser)
Scenario Outline: Effect duration 
	Given View customization form (Photo gallery) <section> 
	When User inserts effect duration <input> in the input-field-box 
	Then Users insert <result> is displayed 
	Examples: 
|	section			|	input	|	result	|
|	Image browser	|	10		|	10		|
|	Slideshow		|	10		|	10		|

#=================================By Andrejs Safonovs============================================#
#Add images to gallery

@AddingImageToSystem
Scenario: Adding image to system
	
	Given Create new gallery form
	When User clicks on Add Images button
	Then Add image form is displayed. User can add images from laptop or existing in system

@ChangingImageData
Scenario: Changing image data

	Given Create new gallery form
	When Image is added to system
	Then Image data is displayed: ( "title" / "format" / "dimension" / "weight" )
	
@ChangingImageTitle
Scenario: Changing image title

	Given Create new gallery form
		And Image is added to system
	When User is typing "text" in image title input field
	Then Image title is changed to "text"
	
@ChangingImageDescription
Scenario: Changing image description

	Given Create new gallery form
		And Image is added to system
	When User is typing "text" in image description input field
	Then Image description is changed to "text"
	
@DeletingImageFromGallery
Scenario: Deleting image from gallery

	Given Create new gallery form
		And Image is added to system
	When User is clicking on remove image (Trashcan icon) button
	Then Image is deleted from gallery
	
@AddingTagToTheGallery
Scenario: Adding tag to the gallery

	Given Create new gallery form
		And Image is added to system
	When User clicks on Add tag button
		And User typing a "tag" for image in a text field
	Then Gallery is tagged by "tag"
	
@ChangingTheOrderOfImages
Scenario: Changing the order of images

	Given Create new gallery form
		And Images are added to system
	When User changes order by drag-and-drop image
	Then Order of images is changed
	
@ViewingThumbnailOfImage
Scenario: Viewing thumbnail of image

	Given Create new gallery form
	When Image is added to system
	Then Image thumbnail is displayed

@SearchingImagesInGallery
Scenario: Searching images in gallery

	Given Create new gallery form
	When User is typing "text" in the search input field
		And User is clicking on magnifier icon or press enter
	Then Search "text" through images by image name is performed
	
#Add album to page (extended album), Add album to page (compact album)

@OpeningAlbumAddingForm
Scenario: Opening album adding form

	Given User opens homepage
	When User is selecting the camera icon in the page content menu
	Then View customization form (Photo gallery) opens
	
@ViewingImagesInAlbum
Scenario Outline: Viewing images in album

	Given View customization form <section>
	When Image was published
	Then Image in album is displayed

#BROKEN
Examples:
|section		|
|Extended Album	|
|Compact Album	|
	
@ViewingAlbumThumbnails
Scenario Outline: Viewing album thumbnails

	Given View customization form
	When User is selecting form <section>
	#outline with thumbnail / slideshow / image browser view / compact album
		And User is selecting proper album by album "name"
	Then "name" album thumbnail is displayed in <result> section
	
Examples:
|section		|result			|
|Extended Album	|Extended Album	|
|Compact Album	|Compact Album	|



@SortingImagesByOption
Scenario Outline: Sorting images in album by option

	Given View customization form <section>
	When User is selecting <option>
	Then Images in <result> section are sorted by <option>

Examples:
|section		|option     |result		|
|Extended Album	|Title      |Title		|
|Extended Album	|Date       |Date		|
|Extended Album	|Filename   |Filename	|
|Extended Album	|Size		|Size		|
|Extended Album	|Type		|Type		|
|Extended Album	|Resolution |Resolution	|
|Extended Album	|Random		|Random		|
|Compact Album	|Title      |Title		|
|Compact Album	|Date       |Date		|
|Compact Album	|Filename   |Filename	|
|Compact Album	|Size		|Size		|
|Compact Album	|Type		|Type		|
|Compact Album	|Resolution |Resolution	|
|Compact Album	|Random		|Random		|

@OrderingImages
Scenario Outline: Ordering images in album

	Given View customization form <section>
	When User is selecting sort <type>
	Then Corresponding <result> is selected
	
Examples:
|section		|type		|result		|
|Extended Album	|Ascending	|Ascending	|
|Extended Album	|Descending	|Descending	|	
|Compact Album	|Ascending	|Ascending	|	
|Compact Album	|Descending	|Descending	|

@SelectingNumberOfColumnsAtPage
Scenario Outline: Selecting number of columns at page

	Given View customization form <section>
	When User is typing number <input> of columns per page
	Then User inserts maximal number <result> of image columns
	
Examples:
|section		|input		|result		|
|Extended Album	|7			|7			|
|Compact Album	|8			|8			|	
	
@SelectingImageCountViewedPerPage
Scenario Outline: Selecting image count viewed per page

	Given View customization form <section>
	When User is typing number <input> of images per page
	Then User inserts number <result> of images per page
	
Examples:
|section		|input		|result		|
|Extended Album	|25			|25			|
|Compact Album	|43			|43			|	
	
@ImageTitleViewSelection
Scenario Outline: Image title view selection

	Given View customization form <section>
	When User is selecting image title <option>
	Then User is selecting displaying <result> of image titles
	
Examples:
|section		|option			|result			|
|Extended Album	|Show on hover	|Show on hover	|
|Extended Album	|Always show	|Always show	|
|Extended Album	|Don't show		|Don't show		|
|Compact Album	|Show on hover	|Show on hover	|
|Compact Album	|Always show	|Always show	|
|Compact Album	|Don't show		|Don't show		|

@EnablingPagination
Scenario Outline: Enabling pagination

	Given View customization form <section>
	When User selecting enable pagination <option>
	Then User is enabling or selecting <result> pagination

Examples:
|section		|option		|result		|
|Extended Album	|Yes		|Yes		|
|Extended Album	|No			|No			|
|Extended Album	|Load More	|Load More	|
|Extended Album	|Scroll Load|Scroll Load|
|Compact Album	|Yes		|Yes		|
|Compact Album	|No			|No			|
|Compact Album	|Load More	|Load More	|
|Compact Album	|Scroll Load|Scroll Load|

@SelectingThumbClickAction
Scenario Outline: Selecting thumb click action

	Given View customization form <section>
	When User is selecting thumb click action <option>
	Then User is enabling thumb click action <result>
	
Examples:
|section		|option			|result			|
|Extended Album	|Open lightbox	|Open lightbox	|
|Extended Album	|Redirect to url|Redirect to url|
|Extended Album	|Do Nothing		|Do Nothing		|
|Compact Album	|Open lightbox	|Open lightbox	|
|Compact Album	|Redirect to url|Redirect to url|
|Compact Album	|Do Nothing		|Do Nothing		|

@ClickingCancelButton
Scenario Outline: Clicking cancel button

	Given View customization form <section>
	When User is clicking on <option> button
	Then View customization form is <result>

Examples:
|section		|option	|result	|
|Extended Album	|cancel	|closed	|
|Compact Album	|cancel	|closed	|
	
@ClickingSaveButton
Scenario Outline: Clicking Save button

	Given View customization form <section>
	When User is clicking on <option> button
	Then Album is <result> to page

Examples:
|section		|option	|result	|
|Extended Album	|save	|sent	|
|Compact Album	|save	|sent	|

@SelectingNumberOfAlbumColumnsAtPage
Scenario: Selecting number of album columns at page

	Given View customization form Compact Album section
	When User is typing "number" of album columns per page
	Then User inserts maximal "number" of album columns

@SelectingAlbumsCountViewedPerPage
Scenario: Selecting albums count viewed per page

	Given View customization form Compact Album section
	When User is typing "number" of albums per page
	Then User inserts "number" of albums per page
	
@AlbumTitleViewSelection
Scenario Outline: Album title view selection

	Given View customization form Compact Album section
	When User is selecting album title view <option>
	Then User is selecting displaying <result> of album titles
	
Examples:
|option			|result			|
|Show on hover	|Show on hover	|
|Don't show		|Don't show		|
|Always show	|Always show	|
