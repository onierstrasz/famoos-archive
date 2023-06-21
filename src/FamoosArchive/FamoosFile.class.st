Class {
	#name : #FamoosFile,
	#superclass : #Object,
	#instVars : [
		'fileReference'
	],
	#category : #FamoosArchive
}

{ #category : #initialization }
FamoosFile class >> for: aFileReference [ 
	^ self new fileReference: aFileReference
]

{ #category : #accessing }
FamoosFile >> basename [
	^ self fileReference basename
]

{ #category : #accessing }
FamoosFile >> fileReference [
	^ fileReference
]

{ #category : #initialization }
FamoosFile >> fileReference: aFileReference [ 
	fileReference := aFileReference
]

{ #category : #accessing }
FamoosFile >> printOn: aStream [
	self fileReference printOn: aStream
]
