Class {
	#name : #FamoosWeb,
	#superclass : #Object,
	#instVars : [
		'files'
	],
	#category : #FamoosArchive
}

{ #category : #constant }
FamoosWeb class >> websiteFolder [
	<gtExample>
	<noTest>
	^ FileLocator imageDirectory
		/ 'pharo-local/iceberg/onierstrasz/famoos-archive/famoos'
]

{ #category : #accessing }
FamoosWeb >> files [
	^ files
]

{ #category : #accessing }
FamoosWeb >> files: anObject [
	files := anObject
]

{ #category : #accessing }
FamoosWeb >> filesByType [
	| filesByType |
	filesByType := Dictionary new.
	self files
		do: [ :each | 
			| type |
			type := each basename copyAfterLast: $..
			(filesByType at: type ifAbsentPut: [ OrderedCollection new ]) add: each ].
	^ filesByType associations sort: [ :a :b | a value size > b value size ]
]

{ #category : #view }
FamoosWeb >> gtFilesByTypeFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Files by type';
		priority: 40;
		items: [ self filesByType ];
		column: 'Type'
			text: [:each | each key ]
			width: 50;
		column: 'Count'
			text: [:each | each value size ]
			width: 50;
		column: 'Files'
			text: [:each | each value collect: #basename ];
		actionUpdateButton
]

{ #category : #view }
FamoosWeb >> gtItemsFor: aView [
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
