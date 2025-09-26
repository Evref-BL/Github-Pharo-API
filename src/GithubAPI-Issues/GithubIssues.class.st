Class {
	#name : 'GithubIssues',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-Issues',
	#package : 'GithubAPI-Issues'
}

{ #category : 'from organisations' }
GithubIssues >> getAllForOrg: anOrgName withParms: parms [
	|endpoint|
	endpoint := '/' join: { '/orgs' . anOrgName  . 'issues' }.
	^ self getAll: endpoint withParams: parms. 
]

{ #category : 'from organisations' }
GithubIssues >> getAllForOwner: anOrgName withParms: parms [

	^ self getAllForOrg: anOrgName withParms: parms
]

{ #category : 'from repos' }
GithubIssues >> getAllForRepo: aRepoName ofOwner: anOwnerName withParms: params [
	"https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues"
	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'issues'.
			             }.
	^ self getAll: endpoint withParams: params
]

{ #category : 'from organisations' }
GithubIssues >> getForOrg: anOrgName withParms: params [

	| endpoint |
	endpoint := '/' join: {
			            '/orgs'.
			            anOrgName.
			            'issues' }.
	^ self get: endpoint withParams: params
]

{ #category : 'from repos' }
GithubIssues >> getForRepo: aRepoName ofOwner: anOwnerName withParms: params [
	"https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues"

	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'issues' }.
	^ self get: endpoint withParams: params
]

{ #category : 'from repos' }
GithubIssues >> getIssue: anIssueNumber ForRepo: aRepoName ofOwner: anOwnerName withParms: params [
	"https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#get-an-issue"

	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'issues'.
			            anIssueNumber asString.
			             }.
	^ self get: endpoint withParams: params
	
]

{ #category : 'from organisations' }
GithubIssues >> getLatestsForOrg: anOrgName [

	^ self getForOrg: anOrgName withParms: Dictionary new. 
]

{ #category : 'from organisations' }
GithubIssues >> getLatestsForOwner: anOrgName [
	"alias method"
	
	^ self getLatestsForOrg: anOrgName.
]

{ #category : 'from repos' }
GithubIssues >> getLatestsForRepo: aRepoName ofOwner: anOwnerName [
	"https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues"
	"default 30"
	^ self
		  getForRepo: aRepoName
		  ofOwner: anOwnerName
		  withParms: Dictionary new
]

{ #category : 'from sub issues' }
GithubIssues >> getParentIssueOf: anIssueNumber ForRepo: aRepoName ofOwner: anOwnerName withParms: params [
	"https://docs.github.com/en/rest/issues/sub-issues?apiVersion=2022-11-28#get-parent-issue"

	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'issues'.
			            anIssueNumber asString.
			            'parent' }.
	^ self get: endpoint withParams: params
]

{ #category : 'from sub issues' }
GithubIssues >> getSubIssuesOf: anIssueNumber ForRepo: aRepoName ofOwner: anOwnerName withParms: params [
	"https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#get-an-issue"

	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'issues'.
			            anIssueNumber asString.
							'sub_issues' }.
	^ self get: endpoint withParams: params
]
