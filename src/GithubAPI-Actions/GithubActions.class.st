Class {
	#name : 'GithubActions',
	#superclass : 'GithubRessource',
	#category : 'GithubAPI-Actions',
	#package : 'GithubAPI-Actions'
}

{ #category : 'as yet unclassified' }
GithubActions >> getAllForRepo: aRepoName ofOwner: anOwnerName [
	"https://docs.github.com/en/rest/actions/workflow-runs?apiVersion=2022-11-28#list-workflow-runs-for-a-repository"

	| endpoint |
	self
		deprecated: 'Use getAllRunsForRepo:ofOwner: instead of current one'
		on: '25 September 2025'
		in:
		'Pharo-12.0.0+SNAPSHOT.build.1571.sha.cf5fcd22e66957962c97dffc58b0393b7f368147 (64 Bit)'.
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'actions/runs' }.
	^ self getAll: endpoint withParams: Dictionary new
]

{ #category : 'as yet unclassified' }
GithubActions >> getAllForRepo: aRepoName ofOwner: anOwnerName withParms: parms [
	"https://docs.github.com/en/rest/actions/workflow-runs?apiVersion=2022-11-28#list-workflow-runs-for-a-repository"

	| endpoint |
	self
		deprecated:
		'Use getAllRunsForRepo:ofOwner:withParms: instead of current one'
		on: '25 September 2025'
		in:
		'Pharo-12.0.0+SNAPSHOT.build.1571.sha.cf5fcd22e66957962c97dffc58b0393b7f368147 (64 Bit)'.
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'actions/runs' }.
	^ self getAll: endpoint withParams: parms
]

{ #category : 'as yet unclassified' }
GithubActions >> getAllRunsForRepo: aRepoName ofOwner: anOwnerName [
	"https://docs.github.com/en/rest/actions/workflow-runs?apiVersion=2022-11-28#list-workflow-runs-for-a-repository"

	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'actions/runs' }.
	^ self getAll: endpoint withParams: Dictionary new
]

{ #category : 'as yet unclassified' }
GithubActions >> getAllRunsForRepo: aRepoName ofOwner: anOwnerName withParms: parms [
	"https://docs.github.com/en/rest/actions/workflow-runs?apiVersion=2022-11-28#list-workflow-runs-for-a-repository"
	
	|endpoint|
	endpoint := '/' join: { '/repos' . anOwnerName  . aRepoName . 'actions/runs' }.
	^ self getAll: endpoint withParams: parms. 
]

{ #category : 'as yet unclassified' }
GithubActions >> getLatestForRepo: aRepoName ofOwner: anOwnerName [
	"https://docs.github.com/en/rest/actions/workflow-runs?apiVersion=2022-11-28#list-workflow-runs-for-a-repository"

	| endpoint |
	self
		deprecated:
		'Use getLatestsRunsForRepo:ofOwner: instead of current one'
		on: '25 September 2025'
		in:
		'Pharo-12.0.0+SNAPSHOT.build.1571.sha.cf5fcd22e66957962c97dffc58b0393b7f368147 (64 Bit)'.
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'actions/runs' }.
	^ self get: endpoint withParams: Dictionary new
]

{ #category : 'as yet unclassified' }
GithubActions >> getLatestsRunsForRepo: aRepoName ofOwner: anOwnerName [
	"https://docs.github.com/en/rest/actions/workflow-runs?apiVersion=2022-11-28#list-workflow-runs-for-a-repository"

	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'actions/runs' }.
	^ self get: endpoint withParams: Dictionary new
]

{ #category : 'get' }
GithubActions >> getRun: aRunId forRepo: aRepoName ofOwner: anOwnerName [
	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'actions/runs'.
			            aRunId asString }.
	^ self get: endpoint withParams: Dictionary new
]

{ #category : 'as yet unclassified' }
GithubActions >> getWorkflow: aWorkflowID forRepo: aRepoName ofOwner: anOwnerName [

	| endpoint |
	endpoint := '/' join: {
			            '/repos'.
			            anOwnerName.
			            aRepoName.
			            'actions/workflows'.
			            aWorkflowID asString }.
	^ self get: endpoint withParams: Dictionary new
]
