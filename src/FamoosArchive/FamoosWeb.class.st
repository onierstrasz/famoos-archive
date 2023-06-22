"
I encapsulate the FAMOOS archival website.
I contain a number of FamoosFile instances.
"
Class {
	#name : #FamoosWeb,
	#superclass : #FamoosFileCollection,
	#category : #FamoosArchive
}

{ #category : #convenience }
FamoosWeb class >> htmlFiles [
	^ self instance htmlFiles
]

{ #category : #convenience }
FamoosWeb class >> instance [
	"For now, not a singleton. Could be done later."

	^ self new
]

{ #category : #convenience }
FamoosWeb class >> refFiles [
	^ self instance refFiles
]

{ #category : #constant }
FamoosWeb class >> websiteFolder [
	<gtExample>
	<noTest>
	^ FileLocator imageDirectory
		/ 'pharo-local/iceberg/onierstrasz/famoos-archive/famoos'
]

{ #category : #view }
FamoosWeb >> gtWebsiteFor: aView [
	<gtView>
	^ aView forward
		title: 'Website folder';
		priority: 50;
		object: [ self class websiteFolder ];
		view: #gtItemsFor:
]

{ #category : #initialization }
FamoosWeb >> initialize [
	super initialize.
	self
		files: (self class websiteFolder allFiles collect: [ :each | FamoosFile for: each ])
]
