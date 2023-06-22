Class {
	#name : #HrefLinkParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'href',
		'hrefSea'
	],
	#category : #FamoosArchive
}

{ #category : #grammar }
HrefLinkParser >> href [
	^ (('<a' asPParser / '<A' asPParser) trim
		, ('href' asPParser / 'HREF' asPParser) trim , '=' asPParser trim
		, $" asPParser , $" asPParser negate star flatten trim , '">' asPParser)
		==> #fifth
]

{ #category : #grammar }
HrefLinkParser >> hrefSea [
	^ (href sea ==> #second) star
]

{ #category : #accessing }
HrefLinkParser >> start [
	^ hrefSea
]
