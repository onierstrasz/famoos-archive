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

{ #category : #action }
FamoosFile >> gtActionWebBrowseFor: anAction [

	<gtAction>
	"self exists ifFalse: [ ^ anAction noAction ]."

	^ anAction button
		  icon: BrGlamorousIcons go;
		  tooltip: 'Open in OS';
		  action: [ WebBrowser openOn: self fileReference fullName ]
]

{ #category : #view }
FamoosFile >> gtContentsFor: aView [
	<gtView>
	^ aView forward
		title: 'Contents';
		priority: 10;
		object: [ self fileReference ];
		view: #gtContentsFor:
]

{ #category : #view }
FamoosFile >> gtPathFor: aView [
	<gtView>
	^ aView forward
		title: 'Path';
		priority: 20;
		object: [ self fileReference ];
		view: #gtPathFor:
]

{ #category : #accessing }
FamoosFile >> localPath [
	"Path relative to the website folder. 
	Cache this if there are performance issues ..."

	^ self fileReference fullName withoutPrefix: FamoosWeb websiteFolder fullName
]

{ #category : #accessing }
FamoosFile >> printOn: aStream [
	self localPath printOn: aStream
]
