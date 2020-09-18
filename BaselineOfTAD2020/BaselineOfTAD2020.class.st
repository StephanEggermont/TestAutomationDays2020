Class {
	#name : #BaselineOfTAD2020,
	#superclass : #BaselineOf,
	#category : #BaselineOfTAD2020
}

{ #category : #baselines }
BaselineOfTAD2020 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
 				configuration: 'BabyMock2'
 					with: [ spec 
						loads: 'BabyMock2';
						repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ].	
			spec
				package: 'TAD2020-Tutorial' with: [spec requires: #( 'BabyMock2')];
				package: 'TAD2020-Tests' ].

			spec
				group: 'default' with: #('TAD2020-Tutorial' 'TAD2020-Tests') 			

]
