#!/usr/bin/env bash

# git push github
git remote | xargs -L1 git push --all
npm publish

#RELAY="ws://nostr.rocks:1617"
RELAY=$(git config gitmark.relay)
GENESIS="gitmark:5e504164ad198ebd714c4d5f876c4d73def801d1b4dc7bd44d5ce083f6e78b08:0"
CREATED=1657921139


git-mark-list $(git config gitmark.secret) --genesis "${GENESIS}" --created "${CREATED}" -g $(cat package.json | jq -r '.repository.url')  | websocat $RELAY
