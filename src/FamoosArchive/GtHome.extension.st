Extension { #name : #GtHome }

{ #category : #'*FamoosArchive' }
GtHome >> famoosSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'FAMOOS Archive';
		description: 'The FAMOOS Archive project';
		databaseName: 'onierstrasz/famoos-archive/lepiter';
		startPageName: 'FAMOOS Archive';
		priority: 8
]
