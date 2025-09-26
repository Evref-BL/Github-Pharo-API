Class {
	#name : 'BaselineOfGithubAPI',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfGithubAPI',
	#package : 'BaselineOfGithubAPI'
}

{ #category : 'baselines' }
BaselineOfGithubAPI >> baseline: spec [
"donne l'ensmebe des package requis pour la baseline (à inclure dans l'archive définis par Iceberg)"
   <baseline>
   spec for: #common do: [ 
   	self defineDependencies: spec.
   	self definePackages: spec.
   	self defineGroups: spec ]
   
]

{ #category : 'baselines' }
BaselineOfGithubAPI >> defineDependencies: spec [
	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].
		
	spec
    baseline: 'Mocketry'
    with: [ spec repository: 'github://dionisiydk/Mocketry' ]
]

{ #category : 'baselines' }
BaselineOfGithubAPI >> defineGroups: spec [
  "optional if you want to create specifc configuration of your baseline"
]

{ #category : 'baselines' }
BaselineOfGithubAPI >> definePackages: spec [
	"define the package to load"

	spec package: 'GithubAPI-Core'.
	spec
		package: 'GithubAPI-Core-Tests'
		with: [ spec requires: #( 'GithubAPI-Core' 'Mocketry' ) ].

	spec
		package: 'GithubAPI-Users'
		with: [ spec requires: #( 'GithubAPI-Core' ) ].
	spec
		package: 'GithubAPI-Users-Tests'
		with: [ spec requires: #( 'GithubAPI-Users' 'Mocketry' ) ].

	spec
		package: 'GithubAPI-Organizations'
		with: [ spec requires: #( 'GithubAPI-Core' ) ].
	spec
		package: 'GithubAPI-Organizations-Tests'
		with: [ spec requires: #( 'GithubAPI-Organizations'
			   'Mocketry' ) ].

	spec
		package: 'GithubAPI-Repositories'
		with: [ spec requires: #( 'GithubAPI-Core' ) ].
	spec
		package: 'GithubAPI-Repositories-Tests'
		with: [ spec requires: #( 'GithubAPI-Repositories'
		   'Mocketry' ) ].

	spec
		package: 'GithubAPI-Branches'
		with: [ spec requires: #( 'GithubAPI-Core' ) ].
	spec
		package: 'GithubAPI-Branches-Tests'
		with: [ spec requires: #( 'GithubAPI-Branches' 'Mocketry' ) ].

	spec
		package: 'GithubAPI-Commits'
		with: [ spec requires: #( 'GithubAPI-Core' ) ].
	spec
		package: 'GithubAPI-Commits-Tests'
		with: [ spec requires: #( 'GithubAPI-Commits' 'Mocketry' ) ].

	spec
		package: 'GithubAPI-PullRequests'
		with: [ spec requires: #( 'GithubAPI-Core' ) ].
	spec
		package: 'GithubAPI-PullRequests-Tests'
		with: [ spec requires: #( 'GithubAPI-PullRequests'
		   'Mocketry' ) ].

	spec
		package: 'GithubAPI-Contents'
		with: [ spec requires: #( 'GithubAPI-Core' ) ].
	spec
		package: 'GithubAPI-Contents-Tests'
		with: [ spec requires: #( 'GithubAPI-Contents' 'Mocketry' ) ].

	spec
		package: 'GithubAPI-Actions'
		with: [ spec requires: #( 'GithubAPI-Core' ) ].
	spec
		package: 'GithubAPI-Actions-Tests'
		with: [ spec requires: #( 'GithubAPI-Actions' 'Mocketry' ) ].

	spec
		package: 'GithubAPI-Issues'
		with: [ spec requires: #( 'GithubAPI-Core' ) ].
	spec
		package: 'GithubAPI-Issues-Tests'
		with: [ spec requires: #( 'GithubAPI-Issues' 'Mocketry' ) ].
		
	spec
		package: 'GithubAPI-Milestones'
		with: [ spec requires: #( 'GithubAPI-Core' ) ].
	spec
		package: 'GithubAPI-Milestones-Tests'
		with: [ spec requires: #( 'GithubAPI-Milestones' 'Mocketry' ) ]
]
