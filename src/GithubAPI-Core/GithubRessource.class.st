Class {
	#name : 'GithubRessource',
	#superclass : 'Object',
	#instVars : [
		'itemPerPage',
		'githubAPI'
	],
	#category : 'GithubAPI-Core',
	#package : 'GithubAPI-Core'
}

{ #category : 'initialization' }
GithubRessource >> defaultPerPageItem [
	^ 20.
]

{ #category : 'api' }
GithubRessource >> get: endpoint withParams: paramsDict [
	| response |
	
	githubAPI client path: githubAPI hostUrl, endpoint.
	paramsDict keysAndValuesDo: [ :key :value | githubAPI client queryAt: key put: value ].

	response := githubAPI client get.

	githubAPI output = 'json' ifTrue: [ ^response ].
	
	^NeoJSONReader fromString: response. 
	
	
]

{ #category : 'api' }
GithubRessource >> getAll: endpoint withParams: paramsDict [

	| currentPage results |
	currentPage := 1.
	results := OrderedCollection new.

	[
	| response responseDict |
	
	response := self
		            getByPage: currentPage
		            perPage: itemPerPage
		            from: endpoint
		            withParams: paramsDict.
	(response isEmpty or: response = '[]') ifTrue: [ ^ results ].

	"if api return an error"
	responseDict := githubAPI output = 'json'
		                ifTrue: [ NeoJSONReader fromString: response ]
		                ifFalse: [ response ].
	responseDict isArray ifFalse: [ ^response ].

	githubAPI output = 'json'
		ifTrue: [ results add: response ]
		ifFalse: [ results addAll: response ].
	currentPage := currentPage + 1.

	true ] whileTrue
]

{ #category : 'api' }
GithubRessource >> getByPage: page perPage: perPage from: endpoint withParams: paramsDict [
	| newParams |
	newParams := Dictionary new.
	newParams at: #page put: page.
	newParams at: #per_page put: perPage.
	
	paramsDict keysAndValuesDo: [ :key :value | newParams at: key put: value ].
	
	^self get: endpoint withParams: newParams. 
]

{ #category : 'accessing' }
GithubRessource >> githubAPI: anObject [

	githubAPI := anObject
]

{ #category : 'initialization' }
GithubRessource >> initialize [ 
	itemPerPage := self defaultPerPageItem
]

{ #category : 'api' }
GithubRessource >> post: endpoint withData: data [
	| response |
	githubAPI client path: githubAPI hostUrl, endpoint.
	
	data keysAndValuesDo: [ :key :value | githubAPI client queryAt: key put: value ].
	
	response := githubAPI client post.
	
	^NeoJSONReader fromString: response. 
]

{ #category : 'api' }
GithubRessource >> post: endpoint withFormData: data [
	| response |
	githubAPI client path: githubAPI hostUrl, endpoint.
	
	data keysAndValuesDo: [ :key :value | githubAPI client formAt: key put: value ].
	
	response := githubAPI client post.
	
	^NeoJSONReader fromString: response. 
]

{ #category : 'api' }
GithubRessource >> postJson: endpoint withData: data [
	| response |
	githubAPI client path: githubAPI hostUrl, endpoint.
	
	githubAPI client entity: (ZnEntity with: (NeoJSONWriter toString: data)).
	githubAPI client contentType: 'application/json'.
	
	response := githubAPI client post.
	
	^NeoJSONReader fromString: response. 
]
