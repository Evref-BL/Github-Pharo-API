Class {
	#name : 'GithubPullRequests',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-PullRequests',
	#package : 'GithubAPI-PullRequests'
}

{ #category : 'as yet unclassified' }
GithubPullRequests >> getAllForRepo: aRepoName ofOwner: anOwnerName [
	|endpoint|
	endpoint := '/' join: { '/repos' . anOwnerName . aRepoName . 'pulls'  }.
	
	^ self getAll: endpoint withParams: Dictionary new.
]

{ #category : 'as yet unclassified' }
GithubPullRequests >> getCommitsOfPull: aPullNumber ForRepo: aRepoName ofOwner: anOwnerName [
	"https://docs.github.com/en/rest/pulls/pulls?apiVersion=2022-11-28#get-a-pull-request"
	
	|endpoint|
	endpoint := '/' join: { '/repos' . anOwnerName . aRepoName . 'pulls' . aPullNumber asString . 'commits' }.
	
	^ self getAll: endpoint withParams: Dictionary new.
]

{ #category : 'as yet unclassified' }
GithubPullRequests >> getPull: aPullNumber ForRepo: aRepoName ofOwner: anOwnerName [
	"https://docs.github.com/en/rest/pulls/pulls?apiVersion=2022-11-28#get-a-pull-request"
	
	|endpoint|
	endpoint := '/' join: { '/repos' . anOwnerName . aRepoName . 'pulls' . aPullNumber asString }.
	
	^ self get: endpoint withParams: Dictionary new.
]
