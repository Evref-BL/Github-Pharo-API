Class {
	#name : 'GithubRepositories',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-Repositories',
	#package : 'GithubAPI-Repositories'
}

{ #category : 'as yet unclassified' }
GithubRepositories >> get: aRepoName ofOwner: anOrgName [ 
	"https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-organization-repositories"
	
	| endpoint |
	
	endpoint := ('/' join: {'/repos' . anOrgName asString . aRepoName asString }).
	^ self get: endpoint withParams: Dictionary new. 
]
