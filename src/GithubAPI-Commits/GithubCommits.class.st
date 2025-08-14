Class {
	#name : 'GithubCommits',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-Commits',
	#package : 'GithubAPI-Commits'
}

{ #category : 'as yet unclassified' }
GithubCommits >> getAllForRepo: aRepoName ofOwner: anOwnerName [
	|endpoint|
	endpoint := '/' join: { '/repos' . anOwnerName  . aRepoName . 'commits' }.
	^ self getAll: endpoint withParams: Dictionary new. 
]

{ #category : 'as yet unclassified' }
GithubCommits >> getCommit: aCommitRef ForRepo: aRepoName ofOwner: anOwnerName [
	|endpoint|
	endpoint := '/' join: { '/repos' . anOwnerName  . aRepoName . 'commits' . aCommitRef asString}.
	^ self get: endpoint withParams: Dictionary new. 
]

{ #category : 'as yet unclassified' }
GithubCommits >> getForRepo: aRepoName ofOwner: anOwnerName withParms: parms [
	|endpoint|
	endpoint := '/' join: { '/repos' . anOwnerName  . aRepoName . 'commits' }.
	^ self get: endpoint withParams: parms . 
]

{ #category : 'as yet unclassified' }
GithubCommits >> getLatestForRepo: aRepoName ofOwner: anOwnerName [
	"https://docs.github.com/en/rest/commits/commits?apiVersion=2022-11-28#list-commits"
	"default 30 commits"
	
	^ self getForRepo: aRepoName ofOwner: anOwnerName withParms: Dictionary new. 
]
