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

	spec
		package: 'GithubAPI-Core'.
	spec package: 'GithubAPI-Core-Tests' with: [ spec requires: #('GithubAPI-Core' 'Mocketry') ].
]
