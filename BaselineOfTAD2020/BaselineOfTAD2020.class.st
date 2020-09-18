Class {
	#name : #BaselineOfTAD2020,
	#superclass : #BaselineOf,
	#category : #BaselineOfTAD2020
}

{ #category : #private }
BaselineOfTAD2020 >> babyMock2: spec [ [
 	spec
 		project: 'BabyMock2'
 		with: [ spec
 				className: #ConfigurationOfBabyMock2;
 				versionString: #latest;
 				repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ]
 ]
]

{ #category : #baselines }
BaselineOfTAD2020 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self babyMock2: spec.
			spec
				package: 'TAD2020-Tutorial';
				package: 'TAD2020-Tests' ].

			spec
				group: 'default' with: #('TAD2020-Tutorial' 'TAD2020-Tests' 'BabyMock2')
]
