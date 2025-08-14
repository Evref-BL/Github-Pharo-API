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
	spec
		package: 'GithubAPI-Core'.
	spec package: 'GithubAPI-Core-Tests' with: [ spec requires: #('GithubAPI-Core' 'Mocketry') ].
	
	spec package: 'GitlabAPI-Users' with: [ spec requires: #('GitlabAPI-Core') ].
	spec package: 'GitlabAPI-Users-Tests' with: [ spec requires: #('GitlabAPI-Users' 'Mocketry') ].
	
	spec package: 'GitlabAPI-Organizations' with: [ spec requires: #('GitlabAPI-Core') ].
	spec package: 'GitlabAPI-Organizations-Tests' with: [ spec requires: #('GitlabAPI-Organizations' 'Mocketry') ].
	
	spec package: 'GitlabAPI-Respositories' with: [ spec requires: #('GitlabAPI-Core') ].
	spec package: 'GitlabAPI-Respositories-Tests' with: [ spec requires: #('GitlabAPI-Respositories' 'Mocketry') ].
	
		spec package: 'GitlabAPI-Branches' with: [ spec requires: #('GitlabAPI-Core') ].
	spec package: 'GitlabAPI-Branches-Tests' with: [ spec requires: #('GitlabAPI-Branches' 'Mocketry') ].
	
	spec package: 'GitlabAPI-Commits' with: [ spec requires: #('GitlabAPI-Core') ].
	spec package: 'GitlabAPI-Commits-Tests' with: [ spec requires: #('GitlabAPI-Commits' 'Mocketry') ].
	
	spec package: 'GitlabAPI-PullRequests' with: [ spec requires: #('GitlabAPI-Core') ].
	spec package: 'GitlabAPI-PullRequests-Tests' with: [ spec requires: #('GitlabAPI-PullRequests' 'Mocketry'). 
		
	spec package: 'GitlabAPI-Contents' with: [ spec requires: #('GitlabAPI-Core') ].
	spec package: 'GitlabAPI-Contents-Tests' with: [ spec requires: #('GitlabAPI-Contents' 'Mocketry')].
		
		].
]
