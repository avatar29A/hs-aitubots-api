all: build test

build:
	stack build

test:
	stack test

test-integration:
	stack test --test-arguments "--integration --token ${TOKEN} --chatid ${CHATID} --botName ${BOTNAME}"