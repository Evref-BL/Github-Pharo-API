Class {
	#name : 'GithubUsers',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-Users',
	#package : 'GithubAPI-Users'
}

{ #category : 'api' }
GithubUsers >> get: userName [
	
	"https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-a-user"
	
	| endpoint |

	endpoint := ('/users/' , userName asString).
	^ self get: endpoint withParams: Dictionary new. 

]

{ #category : 'searching' }
GithubUsers >> getAllWithParams: paramsDict [

	"https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#list-users"

	| endpoint |
	endpoint := '/users/'.
	
	^self getAll: endpoint withParams: paramsDict. 
]

{ #category : 'as yet unclassified' }
GithubUsers >> getUserId: anId [
	
	"https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-a-user-using-their-id"
	
		| endpoint |

	endpoint := ('/user/' , anId asString).
	^ self get: endpoint withParams: Dictionary new. 

]

{ #category : 'as yet unclassified' }
GithubUsers >> getUsername: userName [
	
	"https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-a-user"
	
	^ self get: userName 

]
