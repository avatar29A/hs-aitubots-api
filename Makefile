all: build test

build:
	stack build

test:
	stack test

test-integration:
	stack test --test-arguments "--integration -t ${TOKEN} -c ${CHATID} -u ${BOTNAME}"