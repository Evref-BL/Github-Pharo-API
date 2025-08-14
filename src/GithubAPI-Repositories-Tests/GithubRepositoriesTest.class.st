"
A GithubRepositoriesTest is a test class for testing the behavior of GithubRepositories
"
Class {
	#name : 'GithubRepositoriesTest',
	#superclass : 'TestCase',
	#category : 'GithubAPI-Repositories-Tests',
	#package : 'GithubAPI-Repositories-Tests'
}

{ #category : 'as yet unclassified' }
GithubRepositoriesTest >> getRepoMooseApi [

	^ '
  {
    "id": 299571024,
    "node_id": "MDEwOlJlcG9zaXRvcnkyOTk1NzEwMjQ=",
    "name": "Moose-REST-API",
    "full_name": "Evref-BL/Moose-REST-API",
    "private": false,
    "owner": {
      "login": "Evref-BL",
      "id": 124255930,
      "node_id": "O_kgDOB2f-ug",
      "gravatar_id": "",
      "type": "Organization",
      "user_view_type": "public",
      "site_admin": false
    },
    "description": null,
    "fork": false,
    "created_at": "2020-09-29T09:40:25Z",
    "updated_at": "2023-08-08T13:27:23Z",
    "pushed_at": "2023-08-08T13:32:15Z",
    "homepage": null,
    "size": 36,
    "stargazers_count": 0,
    "watchers_count": 0,
    "language": "Smalltalk",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "has_discussions": false,
    "forks_count": 1,
    "archived": false,
    "disabled": false,
    "open_issues_count": 0,
    "license": {
      "key": "mit",
      "name": "MIT License",
      "spdx_id": "MIT",
      "node_id": "MDc6TGljZW5zZTEz"
    },
    "allow_forking": true,
    "is_template": false,
    "web_commit_signoff_required": false,
    "topics": [],
    "visibility": "public",
    "forks": 1,
    "open_issues": 0,
    "watchers": 0,
    "default_branch": "master",
    "permissions": {
      "admin": false,
      "maintain": false,
      "push": false,
      "triage": false,
      "pull": true
    },
    "custom_properties": {}
  }
'
]

{ #category : 'tests' }
GithubRepositoriesTest >> testGetOfOwner [

		| hostUrl githubApi result client endpoint gitlabRessource data responseMessage response |
	
	"Given"
	hostUrl := 'https://www.url.com'.
	client := ZnClient new.
	
	githubApi := GithubApi new privateToken: 'token'; hostUrl: hostUrl; client: client.
	
	endpoint := ('/' join: {'/orgs' . 'evref-bl' . 'repos'}).
	data := { 'param' -> 'value' } asDictionary.
	
	responseMessage := 'Evref-BL'.
	response :=  self getRepoMooseApi.

	gitlabRessource := githubApi repositories .
	

	(client stub get) willReturn: response.

	
	"When"
	result := gitlabRessource get: 'Moose-REST-API' ofOwner: 'evref-bl'.
	
	"Then"
	self assert: (result isDictionary).
	self assert: (result at: #name) equals: 'Moose-REST-API'.

]
