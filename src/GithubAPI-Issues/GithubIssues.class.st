Class {
	#name : 'GithubIssues',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-Issues',
	#package : 'GithubAPI-Issues'
}

{ #category : 'as yet unclassified' }
GithubIssues >> getAllForOrg: anOrgName withParm: parms [
	|endpoint|
	endpoint := '/' join: { '/orgs' . anOrgName  . 'issues' }.
	^ self getAll: endpoint withParams: parms. 
]

{ #category : 'as yet unclassified' }
GithubIssues >> getLatestForOrg: anOrgName [
	|endpoint|
	endpoint := '/' join: { '/orgs' . anOrgName  . 'issues' }.
	^ self get: endpoint withParams: Dictionary new. 
]

{ #category : 'as yet unclassified' }
GithubIssues >> getLatestOfRepo: aRepoName ofOrg: anOrgName [
	"https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues"
	
	|endpoint|
	endpoint := '/' join: { '/repos' . anOrgName  . aRepoName . 'issues' }.
	^ self get: endpoint withParams: Dictionary new. 
]
