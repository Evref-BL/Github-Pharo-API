Class {
	#name : 'GithubMilestones',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-Milestones',
	#package : 'GithubAPI-Milestones'
}

{ #category : 'as yet unclassified' }
GithubMilestones >> getAllForRepo: aRepoName ofOwner: anOwnerName withParms: params [
	"https://docs.github.com/en/rest/issues/milestones?apiVersion=2022-11-28#list-milestones"

	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'milestones' }.
	^ self getAll: endpoint withParams: params
]

{ #category : 'as yet unclassified' }
GithubMilestones >> getForRepo: aRepoName ofOwner: anOwnerName withParms: params [
	"https://docs.github.com/en/rest/issues/milestones?apiVersion=2022-11-28#list-milestones"

	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'milestones' }.
	^ self get: endpoint withParams: params
]

{ #category : 'as yet unclassified' }
GithubMilestones >> getLatestsForRepo: aRepoName ofOwner: anOwnerName [
	"https://docs.github.com/en/rest/issues/milestones?apiVersion=2022-11-28#list-milestones"

	"default 30"

	^ self getForRepo: aRepoName ofOwner: anOwnerName withParms: Dictionary new. 
]

{ #category : 'as yet unclassified' }
GithubMilestones >> getMilestone: aMilestoneNumber ForRepo: aRepoName ofOwner: anOwnerName withParms: params [
	"https://docs.github.com/en/rest/issues/milestones?apiVersion=2022-11-28#get-a-milestone"

	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'milestones'.
			            aMilestoneNumber asString }.
	^ self get: endpoint withParams: params
]
