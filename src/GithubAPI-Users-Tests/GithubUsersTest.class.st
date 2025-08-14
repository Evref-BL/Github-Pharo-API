"
A GithubUsersTest is a test class for testing the behavior of GithubUsers
"
Class {
	#name : 'GithubUsersTest',
	#superclass : 'TestCase',
	#category : 'GithubAPI-Users-Tests',
	#package : 'GithubAPI-Users-Tests'
}

{ #category : 'as yet unclassified' }
GithubUsersTest >> getUserExample [
	^ '{
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
  "site_admin": false,
  "name": "monalisa octocat",
  "company": "GitHub",
  "blog": "https://github.com/blog",
  "location": "San Francisco",
  "email": "octocat@github.com",
  "hireable": false,
  "bio": "There once was...",
  "twitter_username": "monatheoctocat",
  "public_repos": 2,
  "public_gists": 1,
  "followers": 20,
  "following": 0,
  "created_at": "2008-01-14T04:33:35Z",
  "updated_at": "2008-01-14T04:33:35Z"
}'
]

{ #category : 'tests' }
GithubUsersTest >> testGet [

	| hostUrl gitlabApi result client endpoint gitlabRessource data responseMessage response |
	
	"Given"
	hostUrl := 'https://www.url.com'.
	client := ZnClient new.
	
	gitlabApi := GitlabApi new privateToken: 'token'; hostUrl: hostUrl; client: client.
	
	endpoint := '/endpoint'.
	data := { 'param' -> 'value' } asDictionary.
	
	responseMessage := 'monalisa octocat'.
	response := self getUserExample.
	
	gitlabRessource := gitlabApi users.
	
	(client stub get) willReturn: response.
	
	"When"
	result := gitlabRessource get: 'octocat'.
	
	"Then"
	self assert: (result isDictionary) equals: true.
	self assert: (result at: #name) equals: responseMessage.

]

{ #category : 'tests' }
GithubUsersTest >> testGetUnknowUsers [

	| hostUrl gitlabApi result client endpoint gitlabRessource data responseMessage response |
	
	"Given"
	hostUrl := 'https://www.url.com'.
	client := ZnClient new.
	
	gitlabApi := GitlabApi new privateToken: 'token'; hostUrl: hostUrl; client: client.
	
	endpoint := '/endpoint'.
	data := { 'param' -> 'value' } asDictionary.
	
	responseMessage := 'monalisa octocat'.
	response := NeoJSONWriter toString: (({#status -> 404 .
					#documentation_url -> 'https://docs.github.com/rest'.
					#message -> 'Not Found'}) asDictionary) .
	
	gitlabRessource := gitlabApi users.
	
	(client stub get) willReturn: response.
	
	"When"
	result := gitlabRessource get: 'fsihcsdpocskcdlqkscjqpod'.
	
	"Then"
	self assert: (result isDictionary) equals: true.
	self assert: (result at: #status) equals: 404.

]

{ #category : 'tests' }
GithubUsersTest >> testGetUserId [
	
	| hostUrl gitlabApi result client endpoint gitlabRessource data responseMessage response |
	
	"Given"
	hostUrl := 'https://www.url.com'.
	client := ZnClient new.
	
	gitlabApi := GitlabApi new privateToken: 'token'; hostUrl: hostUrl; client: client.
	
	endpoint := '/endpoint'.
	data := { 'param' -> 'value' } asDictionary.
	
	responseMessage := 'monalisa octocat'.
	response := self getUserExample.
	
	gitlabRessource := gitlabApi users.
	
	(client stub get) willReturn: response.
	
	"When"
	result := gitlabRessource get: 1.
	
	"Then"
	self assert: (result isDictionary) equals: true.
	self assert: (result at: #name) equals: responseMessage.
]

{ #category : 'tests' }
GithubUsersTest >> testGetUsername [

	self testGet 
]
