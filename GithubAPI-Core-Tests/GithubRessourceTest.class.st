"
A GithubRessourceTest is a test class for testing the behavior of GithubRessource
"
Class {
	#name : 'GithubRessourceTest',
	#superclass : 'TestCase',
	#category : 'GithubAPI-Core-Tests',
	#package : 'GithubAPI-Core-Tests'
}

{ #category : 'tests' }
GithubRessourceTest >> testGetWithParams [

	| hostUrl api result client object endpoint gitlabRessource params |
	
	"Given"
	hostUrl := 'https://www.url.com'.
	client := ZnClient new.
	
	api := GithubApi new privateToken: 'token'; hostUrl: hostUrl; client: client.
	
	endpoint := '/endpoint'.
	params := { 'param' -> 'value' } asDictionary.
	
	object := { #id -> 1 } asDictionary.
	
	gitlabRessource := GithubRessource new githubAPI: api.
	
	(client stub get) willReturn: (NeoJSONWriter toString: object).
	
	"When"
	result := gitlabRessource get: endpoint withParams: params.
	
	"Then"
	self assert: result equals: object.
	params keysAndValuesDo: [ :key :value | self assert: (client request url query at: key) equals: value ].
]
