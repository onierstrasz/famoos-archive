"
I encapsulate the FAMOOS archival website.
I contain a number of FamoosFile instances.
"
Class {
	#name : #FamoosWeb,
	#superclass : #Object,
	#instVars : [
		'files'
	],
	#category : #FamoosArchive
}

{ #category : #example }
FamoosWeb class >> instance [
	^ self new
]

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
			type := each extension.
			(filesByType at: type ifAbsentPut: [ OrderedCollection new ]) add: each ].
	^ filesByType associations sort: [ :a :b | a value size > b value size ]
]

{ #category : #view }
FamoosWeb >> gtFilesTreeTypeFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Files by type';
		priority: 42;
		items: [ self filesByType ];
		children: [ :each | each value ];
		column: 'Type'
			text: [ :each | each isAssociation ifTrue: [ each key ] ifFalse: [ each fileType ] ]
			width: 80;
		column: 'Count'
			text: [ :each | each isAssociation ifTrue: [ each value size ] ifFalse: [ '' ] ]
			width: 50;
		column: 'Files'
			text: [ :each | each isAssociation ifTrue: [ each value collect: #basename ] ifFalse: [ each ] ];
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

{ #category : #example }
FamoosWeb >> htmlFiles [
	<gtExample>
	<noTest>
	^ self files select: #isHtml
]

{ #category : #initialization }
FamoosWeb >> initialize [
	super initialize.
	self
		files: (self class websiteFolder allFiles collect: [ :each | FamoosFile for: each ])
]

{ #category : #example }
FamoosWeb >> instance [
	<gtExample>
	<noTest>
	^ self class instance
]

{ #category : #example }
FamoosWeb >> refFiles [
	<gtExample>
	<noTest>
	^ self htmlFiles select: #isRef
]
