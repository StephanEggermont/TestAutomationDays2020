Class {
	#name : #TutorialTestcase,
	#superclass : #TutorialExercise,
	#category : #'TAD2020-Tutorial'
}

{ #category : #accessing }
TutorialTestcase >> browser [
	| browser |
	browser := GLMTabulator new.
	browser column: [ :c | c row: #main; row: #source ].
	browser transmit to: #source; andShow: [ :b | |tag|
		tag := self showSourceOn: b.
		tag act: [:sel | self runTest: sel ] icon: GLMUIThemeExtraIcons glamorousInspect entitled: 'Run the test' ].
	browser transmit from: #source port: #acceptedCode; to: #main; andShow: [ :a | 
		a dynamic 
			with: [:some :selection | self parseCode: selection some: some ].
 ].
	browser transmit to: #main; andShow: [ :b |
		b text
		display: self assignment;
		format: [ :par | (Text string: title attribute: (TextFontChange font4)), (String crlf), 
			(self transformedText: par) ] ].
	browser startOn: self target.
	^browser
]

{ #category : #actions }
TutorialTestcase >> runTest: selection [
	smalltalkClass suite run
]
