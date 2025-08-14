Class {
	#name : 'GithubContents',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-Contents',
	#package : 'GithubAPI-Contents'
}

{ #category : 'as yet unclassified' }
GithubContents >> getContent: aPath forRepo: aRepoName ofOwner: anOrgName [ 
	"https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#get-repository-content"
	
	^ self getContent: aPath forRepo: aRepoName ofOwner:anOrgName  withParms: Dictionary new. 
]

{ #category : 'as yet unclassified' }
GithubContents >> getContent: aPath forRepo: aRepoName ofOwner: anOrgName onBranchRef: aRef [
	"https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#get-repository-content"
	
	^ self getContent: aPath forRepo: aRepoName  ofOwner: anOrgName withParms: ({ #ref -> aRef } asDictionary) 
]

{ #category : 'as yet unclassified' }
GithubContents >> getContent: aPath forRepo: aRepoName ofOwner: anOrgName withParms: parms [
	"https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#get-repository-content"
	
	| endpoint |
	
	endpoint := ('/' join: {'/repos' . anOrgName asString . aRepoName asString . 'contents' . aPath }).
	^ self get: endpoint withParams: parms. 
]

{ #category : 'as yet unclassified' }
GithubContents >> getReadMeforRepo: aRepoName ofOwner: anOrgName onBranchRef: aRef [
	"https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#get-repository-content"
	
	| endpoint |
	
	endpoint := ('/' join: {'/repos' . anOrgName asString . aRepoName asString . 'readme' .  }).
	
	^ self get: endpoint withParams: {#ref -> aRef } asDictionary . 
]
