"
I wrap a collection of FAMOOS files. I am useful for returning the result of a query.
"
Class {
	#name : #FamoosFileCollection,
	#superclass : #Object,
	#instVars : [
		'files'
	],
	#category : #FamoosArchive
}

{ #category : #accessing }
FamoosFileCollection class >> forFiles: aFileCollection [
	^ self new files: aFileCollection
]

{ #category : #accessing }
FamoosFileCollection >> files [
	^ files
]

{ #category : #accessing }
FamoosFileCollection >> files: anObject [
	files := anObject
]

{ #category : #accessing }
FamoosFileCollection >> filesByType [
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
FamoosFileCollection >> gtFilesTreeTypeFor: aView [
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
		"expandAll;"
		actionUpdateButton;
		send: [ :each | 
			each isAssociation
				ifTrue: [ FamoosFileCollection forFiles: each value ]
				ifFalse: [ each ] ]
]

{ #category : #example }
FamoosFileCollection >> htmlFiles [
	<gtExample>
	<noTest>
	^ self select: #isHtml
]

{ #category : #initialization }
FamoosFileCollection >> initialize [
	super initialize.
	self files: OrderedCollection new
]

{ #category : #example }
FamoosFileCollection >> refFiles [
	<gtExample>
	<noTest>
	^ self htmlFiles select: #isRef
]

{ #category : #querying }
FamoosFileCollection >> select: aBlock [
	^ FamoosFileCollection forFiles: (self files select: aBlock)
]
