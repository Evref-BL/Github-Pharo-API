Class {
	#name : 'GithubApi',
	#superclass : 'Object',
	#instVars : [
		'client',
		'hostUrl',
		'privateToken',
		'output'
	],
	#category : 'GithubAPI-Core',
	#package : 'GithubAPI-Core'
}

{ #category : 'accessing' }
GithubApi >> client [

	^ client
]

{ #category : 'accessing' }
GithubApi >> client: anObject [

	client := anObject
]

{ #category : 'accessing' }
GithubApi >> hostUrl [

	^ hostUrl
]

{ #category : 'accessing' }
GithubApi >> hostUrl: anObject [

	hostUrl := anObject
]

{ #category : 'initialization' }
GithubApi >> initialize [
	
	self hostUrl: 'https://api.github.com'.
	self client: (ZnClient new
			 accept: ZnMimeType applicationJson;
			 yourself)
]

{ #category : 'organizations' }
GithubApi >> organizations [
	^ GithubOrganizations new githubAPI: self. 
]

{ #category : 'accessing' }
GithubApi >> output [

	^ output
]

{ #category : 'accessing' }
GithubApi >> output: anObject [

	output := anObject
]

{ #category : 'accessing' }
GithubApi >> privateToken [

		^ self client request headers at: #'Authorization'
]

{ #category : 'accessing' }
GithubApi >> privateToken: anObject [

	self client headerAt: #'Authorization' add: ('token ', anObject)
]

{ #category : 'accessing' }
GithubApi >> repositories [
	^ GithubRepositories new githubAPI: self. 
]

{ #category : 'accessing' }
GithubApi >> users [
	^ GithubUsers new githubAPI: self 
]
