Class {
	#name : #FamoosWeb,
	#superclass : #Object,
	#category : #FamoosArchive
}

{ #category : #accessing }
FamoosWeb >> gtItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'Website folder';
		priority: 50;
		object: [ self websiteFolder ];
		view: #gtItemsFor:
]

{ #category : #constant }
FamoosWeb >> websiteFolder [
	<gtExample>
	<noTest>
	^ FileLocator imageDirectory
		/ 'pharo-local/iceberg/onierstrasz/famoos-archive/famoos'
]
