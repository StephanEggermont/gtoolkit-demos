Class {
	#name : #GtABAddressBookTest,
	#superclass : #TestCase,
	#category : #'GToolkit-Demo-AddressBook-Tests'
}

{ #category : #building }
GtABAddressBookTest >> createAddressTelephone [
	^ GtABTelephone new
		prefix: '41';
		number: '074574363'
]

{ #category : #building }
GtABAddressBookTest >> createContactAddress [
	^ GtABAddress new
		city: 'Bern';
		country: 'Switzerland';
		telephone: self createAddressTelephone
]

{ #category : #building }
GtABAddressBookTest >> createJaneDoeContact [
	^ GtABContact new
		firstName: 'Jane';
		lastName: 'Doe';
		description: GtABContact loremIpsum;
		avatar: GtABContact janeDoeAvatar;
		address: self createContactAddress
]

{ #category : #building }
GtABAddressBookTest >> createJohnDoeContact [
	^ GtABContact new
		firstName: 'John';
		lastName: 'Doe';
		description: GtABContact loremIpsum;
		avatar: GtABContact johnDoeAvatar;
		address: self createContactAddress
]

{ #category : #tests }
GtABAddressBookTest >> testAddressTelephone [
	| telephone |
	telephone := self createAddressTelephone.
	self assert: telephone prefix equals: '41'.
	self assert: telephone number equals: '074574363'.
	self assert: telephone fullNumber equals: '+41-074574363'
]

{ #category : #tests }
GtABAddressBookTest >> testContactAddress [
	| address |
	address := self createContactAddress.
	self assert: address city equals: 'Bern'.
	self assert: address country equals: 'Switzerland'.
	self assert: address telephone notNil
]

{ #category : #tests }
GtABAddressBookTest >> testJaneDoeContact [
	| contact |
	contact := self createJaneDoeContact.
	self assert: contact firstName equals: 'Jane'.
	self assert: contact lastName equals: 'Doe'.
	self
		assert: contact description
		equals: GtABContact loremIpsum.
	self assert: contact address notNil
]

{ #category : #tests }
GtABAddressBookTest >> testJohnDoeContact [
	| contact |
	contact := self createJohnDoeContact.
	self assert: contact firstName equals: 'John'.
	self assert: contact lastName equals: 'Doe'.
	self
		assert: contact description
		equals: GtABContact loremIpsum.
	self assert: contact address notNil
]

{ #category : #tests }
GtABAddressBookTest >> testMyContactsAddressBook [
	| addressBook |
	addressBook := GtABAddressBook new
		label: 'My contacts'.
	addressBook addContact: self createJohnDoeContact.
	addressBook addContact: self createJaneDoeContact.
	
	self assert: addressBook contacts size equals: 2.
	self assert: (addressBook includesContactWithName: 'John*').
	self assert: (addressBook includesContactWithName: 'Jane*')
]
