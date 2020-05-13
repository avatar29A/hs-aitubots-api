all: build test

build:
	stack build

test:
	stack test

test-integration:
	stack test --test-arguments "--integration -t ${AITU_BOT_TOKEN} -c ${AITU_CHAT_ID}"