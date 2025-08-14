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
