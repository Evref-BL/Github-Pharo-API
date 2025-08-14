"
A GithubUsersTest is a test class for testing the behavior of GithubUsers
"
Class {
	#name : 'GithubUsersTest',
	#superclass : 'TestCase',
	#category : 'GithubAPI-Users-Tests',
	#package : 'GithubAPI-Users-Tests'
}

{ #category : 'tests' }
GithubUsersTest >> testGet [

	| hostUrl gitlabApi result client endpoint gitlabRessource data responseMessage response |
	
	"Given"
	hostUrl := 'https://www.url.com'.
	client := ZnClient new.
	
	gitlabApi := GitlabApi new privateToken: 'token'; hostUrl: hostUrl; client: client.
	
	endpoint := '/endpoint'.
	data := { 'param' -> 'value' } asDictionary.
	
	responseMessage := 'nhlad'.
	response := self userAlkalinan.
	
	gitlabRessource := gitlabApi users.
	
	(client stub get) willReturn: response.
	
	"When"
	result := gitlabRessource get: 'alkalinan'.
	
	"Then"
	self assert: (result isDictionary) equals: true.
	self assert: (result at: #name) equals: responseMessage.

]

{ #category : 'as yet unclassified' }
GithubUsersTest >> userAlkalinan [
	^ '{
  "login": "alkalinan",
  "id": 19858911,
  "node_id": "MDQ6VXNlcjE5ODU4OTEx",
  "avatar_url": "https://avatars.githubusercontent.com/u/19858911?v=4",
  "gravatar_id": "",
  "url": "https://api.github.com/users/alkalinan",
  "html_url": "https://github.com/alkalinan",
  "followers_url": "https://api.github.com/users/alkalinan/followers",
  "following_url": "https://api.github.com/users/alkalinan/following{/other_user}",
  "gists_url": "https://api.github.com/users/alkalinan/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/alkalinan/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/alkalinan/subscriptions",
  "organizations_url": "https://api.github.com/users/alkalinan/orgs",
  "repos_url": "https://api.github.com/users/alkalinan/repos",
  "events_url": "https://api.github.com/users/alkalinan/events{/privacy}",
  "received_events_url": "https://api.github.com/users/alkalinan/received_events",
  "type": "User",
  "user_view_type": "public",
  "site_admin": false,
  "name": "nhlad",
  "company": null,
  "blog": "",
  "location": null,
  "email": null,
  "hireable": null,
  "bio": "Computer Science Doctor at the university of Montpellier, France.",
  "twitter_username": null,
  "public_repos": 18,
  "public_gists": 0,
  "followers": 1,
  "following": 0,
  "created_at": "2016-06-10T14:30:58Z",
  "updated_at": "2025-08-01T14:16:13Z"
}
'
]
