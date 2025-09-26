"
A GithubMilestonesTest is a test class for testing the behavior of GithubMilestones
"
Class {
	#name : 'GithubMilestonesTest',
	#superclass : 'TestCase',
	#category : 'GithubAPI-Milestones-Tests',
	#package : 'GithubAPI-Milestones-Tests'
}

{ #category : 'example' }
GithubMilestonesTest >> getMilestoneExample [
	^ '{
  "url": "https://api.github.com/repos/octocat/Hello-World/milestones/1",
  "html_url": "https://github.com/octocat/Hello-World/milestones/v1.0",
  "labels_url": "https://api.github.com/repos/octocat/Hello-World/milestones/1/labels",
  "id": 1002604,
  "node_id": "MDk6TWlsZXN0b25lMTAwMjYwNA==",
  "number": 1,
  "state": "open",
  "title": "v1.0",
  "description": "Tracking milestone for version 1.0",
  "creator": {
    "login": "octocat",
    "id": 1,
    "node_id": "MDQ6VXNlcjE=",
    "avatar_url": "https://github.com/images/error/octocat_happy.gif",
    "gravatar_id": "",
    "url": "https://api.github.com/users/octocat",
    "html_url": "https://github.com/octocat",
    "followers_url": "https://api.github.com/users/octocat/followers",
    "following_url": "https://api.github.com/users/octocat/following{/other_user}",
    "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
    "organizations_url": "https://api.github.com/users/octocat/orgs",
    "repos_url": "https://api.github.com/users/octocat/repos",
    "events_url": "https://api.github.com/users/octocat/events{/privacy}",
    "received_events_url": "https://api.github.com/users/octocat/received_events",
    "type": "User",
    "site_admin": false
  },
  "open_issues": 4,
  "closed_issues": 8,
  "created_at": "2011-04-10T20:09:31Z",
  "updated_at": "2014-03-03T18:58:10Z",
  "closed_at": "2013-02-12T13:22:01Z",
  "due_on": "2012-10-09T23:39:01Z"
}'
]

{ #category : 'example' }
GithubMilestonesTest >> getMilestonesExample [

	^ '[' , self getMilestoneExample , ']'. 
]

{ #category : 'tests' }
GithubMilestonesTest >> testGetAllForRepoOfOwnerWithParms [

	| hostUrl githubApi result client endpoint gitlabRessource data response |
	"Given"
	hostUrl := 'https://www.url.com'.
	client := ZnClient new.

	githubApi := GithubApi new
		             privateToken: 'token';
		             hostUrl: hostUrl;
		             client: client.

	endpoint := '/' join:
		            { '/repos'. 'octocat'. 'Hello-World'. 'milestones' }.
	data := {  } asDictionary.

	response := NeoJSONReader fromString: self getMilestonesExample.

	gitlabRessource := githubApi milestones.

	(gitlabRessource stub getAll: endpoint withParams: data) willReturn:
		response.


	"When"
	result := gitlabRessource
		          getAllForRepo: 'Hello-World'
		          ofOwner: 'octocat'
		          withParms: data.

	"Then"
	self assert: result isArray.
	self assert: result size equals: 1.
	self assert: (result first at: #id) equals: 1002604.
	self
		assert: (result first at: #node_id)
		equals: 'MDk6TWlsZXN0b25lMTAwMjYwNA=='
]

{ #category : 'tests' }
GithubMilestonesTest >> testGetForRepoOfOwnerWithParms [

	| hostUrl githubApi result client endpoint gitlabRessource data response |
	"Given"
	hostUrl := 'https://www.url.com'.
	client := ZnClient new.

	githubApi := GithubApi new
		             privateToken: 'token';
		             hostUrl: hostUrl;
		             client: client.

	endpoint := '/' join:
		            { '/repos'. 'octocat'. 'Hello-World'. 'milestones' }.
	data := {  } asDictionary.

	response := NeoJSONReader fromString: self getMilestonesExample.

	gitlabRessource := githubApi milestones.

	(gitlabRessource stub get: endpoint withParams: data) willReturn:
		response.


	"When"
	result := gitlabRessource
		          getForRepo: 'Hello-World'
		          ofOwner: 'octocat'
		          withParms: data.

	"Then"
	self assert: result isArray.
	self assert: result size equals: 1.
	self assert: (result first at: #id) equals: 1002604.
	self
		assert: (result first at: #node_id)
		equals: 'MDk6TWlsZXN0b25lMTAwMjYwNA=='
]

{ #category : 'tests' }
GithubMilestonesTest >> testGetLatestsForRepoOfOwner [

	| hostUrl githubApi result client endpoint gitlabRessource data response |
	"Given"
	hostUrl := 'https://www.url.com'.
	client := ZnClient new.

	githubApi := GithubApi new
		             privateToken: 'token';
		             hostUrl: hostUrl;
		             client: client.

	endpoint := '/' join:
		            { '/repos'. 'octocat'. 'Hello-World'. 'milestones' }.
	data := {  } asDictionary.

	response := NeoJSONReader fromString: self getMilestonesExample.

	gitlabRessource := githubApi milestones.

	(gitlabRessource stub get: endpoint withParams: data) willReturn:
		response.


	"When"
	result := gitlabRessource
		          getLatestsForRepo: 'Hello-World'
		          ofOwner: 'octocat'.

	"Then"
	self assert: result isArray.
	self assert: result size equals: 1.
	self assert: (result first at: #id) equals: 1002604.
	self
		assert: (result first at: #node_id)
		equals: 'MDk6TWlsZXN0b25lMTAwMjYwNA=='
]

{ #category : 'tests' }
GithubMilestonesTest >> testGetMilestoneForRepoOfOwnerWithParms [

	| hostUrl githubApi result client endpoint gitlabRessource data response |
	"Given"
	hostUrl := 'https://www.url.com'.
	client := ZnClient new.

	githubApi := GithubApi new
		             privateToken: 'token';
		             hostUrl: hostUrl;
		             client: client.

	endpoint := '/' join: {
			            '/repos'.
			            'octocat'.
			            'Hello-World'.
			            'milestones'.
			            123 asString }.
	data := {  } asDictionary.

	response := NeoJSONReader fromString: self getMilestoneExample.

	gitlabRessource := githubApi milestones .

	(gitlabRessource stub get: endpoint withParams: data) willReturn:
		response.


	"When"
	result := gitlabRessource
		          getMilestone: '123'
		          ForRepo: 'Hello-World'
		          ofOwner: 'octocat'
		          withParms: data.

	"Then"
	self assert: result isDictionary.
	self assert: (result at: #id) equals: 1002604.
	self
		assert: (result at: #node_id)
		equals: 'MDk6TWlsZXN0b25lMTAwMjYwNA=='
]
