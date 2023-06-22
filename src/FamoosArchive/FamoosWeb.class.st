"
I encapsulate the FAMOOS archival website.
I contain a number of FamoosFile instances.
"
Class {
	#name : #FamoosWeb,
	#superclass : #FamoosFileCollection,
	#instVars : [
		'linkDict',
		'urlStatus'
	],
	#classInstVars : [
		'instance'
	],
	#category : #FamoosArchive
}

{ #category : #convenience }
FamoosWeb class >> htmlFiles [
	^ self instance htmlFiles
]

{ #category : #convenience }
FamoosWeb class >> instance [
	"A singleton so we can cache the analysis results too."
	instance ifNil: [ instance := self new ].
	^ instance
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

{ #category : #accessing }
FamoosWeb >> linkDict [
	"Dictionary of links to files containing them."

	linkDict
		ifNil: [ linkDict := Dictionary new.
			FamoosWeb instance htmlFiles files
				do: [ :file | 
					file links
						do: [ :link | (linkDict at: link ifAbsentPut: [ Set new ]) add: file ] ].
			linkDict := linkDict associations sorted asOrderedDictionary ].
	^ linkDict
]

{ #category : #querying }
FamoosWeb >> urlStatus [
	urlStatus
		ifNil: [ urlStatus := (self urls
					collect: [ :each | each -> (FamoosUtility urlStatus: each) ]) asDictionary ].
	^ urlStatus
]

{ #category : #accessing }
FamoosWeb >> urls [
	"External URLs"

	^ self linkDict keys sorted select: [ :each | each beginsWith: 'http' ]
]
