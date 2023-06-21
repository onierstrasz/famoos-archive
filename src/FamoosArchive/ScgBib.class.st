"
I encapsulate the SCG bibliography data.
I am a Singleton, as there is no reason to reload me.
"
Class {
	#name : #ScgBib,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#classInstVars : [
		'instance'
	],
	#category : #FamoosArchive
}

{ #category : #accessing }
ScgBib class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
ScgBib >> data [
	^ data
]

{ #category : #accessing }
ScgBib >> data: anObject [
	data := anObject
]

{ #category : #accessing }
ScgBib >> gtItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'SCG Bib items';
		priority: 20;
		object: [ self data  ];
		view: #gtItemsFor:
]

{ #category : #testing }
ScgBib >> hasKey: aKey [
	^ self data includesKey: aKey
]

{ #category : #accessing }
ScgBib >> initialize [
	| url json |
	url := 'https://raw.githubusercontent.com/scgbern/scgbib/main/scgbib.json'.
	json := ZnClient new get: url.
	self
		data: ((STON fromString: json) collect: [ :each | (each at: 'key') -> each ])
				asOrderedDictionary
]
