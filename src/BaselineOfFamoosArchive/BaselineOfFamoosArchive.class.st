Class {
	#name : #BaselineOfFamoosArchive,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamoosArchive
}

{ #category : #loading }
BaselineOfFamoosArchive class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'famoos-archive' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfFamoosArchive >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'FamoosArchive'
		]
]
