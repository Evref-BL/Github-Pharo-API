Class {
	#name : 'GithubOrganizations',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-Organizations',
	#package : 'GithubAPI-Organizations'
}

{ #category : 'api' }
GithubOrganizations >> get: orgsName [
	
	"https://docs.github.com/en/rest/orgs/orgs?apiVersion=2022-11-28#get-an-organization"
	
	| endpoint |

	endpoint := ('/' join: { '/orgs' . orgsName asString}).
	^ self get: endpoint withParams: Dictionary new. 

]

{ #category : 'searching' }
GithubOrganizations >> getAllWithParams: paramsDict [

	"https://docs.github.com/en/rest/orgs/orgs?apiVersion=2022-11-28#list-organizations"

	"expected in paramsDict : since and per_page"

	| endpoint |
	endpoint := '/orgs/'.
	
	^self getAll: endpoint withParams: paramsDict. 
]

{ #category : 'as yet unclassified' }
GithubOrganizations >> getRepositoriesOfOrganization: anOrgName [ 
	"https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-organization-repositories"
	
	| endpoint |
	
	endpoint := ('/' join: {'/orgs' . anOrgName asString . 'repos'}).
	^ self getAll: endpoint withParams: Dictionary new. 
]

{ #category : 'as yet unclassified' }
GithubOrganizations >> getRepositoriesOfOrganization: anOrgName perPage: perPage page: pageIndex [

	 |endpoint|
	
	endpoint := ('/' join: {'/orgs' . anOrgName asString . 'repos'}).
	
	^ self getByPage: pageIndex perPage: perPage from: endpoint withParams: Dictionary new. 
]
