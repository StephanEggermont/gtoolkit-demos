Class {
	#name : #BaselineOfGToolkitObjectNeuralNetworkDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitObjectNeuralNetworkDemo
}

{ #category : #baselines }
BaselineOfGToolkitObjectNeuralNetworkDemo >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'Bloc' with: [
				spec repository: 'github://feenkcom/Bloc/src' ].
		spec package: 'GToolkit-Demo-ObjectNeuralNetwork'. ].

]
