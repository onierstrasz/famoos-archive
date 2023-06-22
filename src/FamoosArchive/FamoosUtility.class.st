Class {
	#name : #FamoosUtility,
	#superclass : #Object,
	#category : #FamoosArchive
}

{ #category : #utility }
FamoosUtility class >> urlStatus: anUrlString [
	^ [ ZnClient new
		enforceHttpSuccess;
		timeout: 1;
		head: anUrlString;
		response ] onErrorDo: [ :ex | ex printString ]
]
