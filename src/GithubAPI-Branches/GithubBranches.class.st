Class {
	#name : 'GithubBranches',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-Branches',
	#package : 'GithubAPI-Branches'
}

{ #category : 'as yet unclassified' }
GithubBranches >> getAllForRepo: aRepoName ofOwner: anOwnerName [
	|endpoint|
	endpoint := '/' join: { '/repos' . anOwnerName  . aRepoName . 'branches' }.
	^ self getAll: endpoint withParams: Dictionary new. 
]

{ #category : 'as yet unclassified' }
GithubBranches >> getBranch: aBranchName ForRepo: aRepoName ofOwner: anOwnerName [
	|endpoint|
	endpoint := '/' join: { '/repos' . anOwnerName  . aRepoName . 'branches' . aBranchName }.
	^ self get: endpoint withParams: Dictionary new. 
]

{ #category : 'as yet unclassified' }
GithubBranches >> getForRepo: aRepoName ofOwner: anOwnerName withParms: parms [
	"https://docs.github.com/en/rest/branches/branches?apiVersion=2022-11-28#list-branches"
	
	|endpoint|
	endpoint := '/' join: { '/repos' . anOwnerName  . aRepoName . 'branches' }.
	^ self get: endpoint withParams: parms. 
]

{ #category : 'as yet unclassified' }
GithubBranches >> getLatestForRepo: aRepoName ofOwner: anOwnerName [
	"https://docs.github.com/en/rest/branches/branches?apiVersion=2022-11-28#list-branches"
	
	"default on page with 30 branches"
	
	^ self getForRepo: aRepoName ofOwner: anOwnerName withParms: Dictionary new.  
]
