# DDD Voting

export the session id, (a UUID)

```sh
export DDD_SESSION_ID=b2c...ef4

touch ddd_session_id.secrets

  # edit and add the following
  export DDD_SESSION_ID=b2c...ef4

ansible-vault encrypt ddd_session_id.secrets

ansible-vault decrypt --ask-vault-pass ddd_session_id.secrets
source ddd_session_id.secrets
git checkout . # to bring back encrypted file
```

to fetch 2 topics for comparison

```sh
curl 'https://dddmelb-2024.azurewebsites.net/api/EloVotingGetPair' \
    -H 'Origin: https://www.dddmelbourne.com' \
    -H 'User-Agent: Mozilla/5.0' \
    -H 'X-DDDPerth-VotingSessionId: '$DDD_SESSION_ID
```

or a bunch of times

```sh
repeat 300 { curl 'https://dddmelb-2024.azurewebsites.net/api/EloVotingGetPair' \
    -H 'Origin: https://www.dddmelbourne.com' \
    -H 'User-Agent: Mozilla/5.0' \
    -H 'X-DDDPerth-VotingSessionId: '$DDD_SESSION_ID ; \
    echo ""; \
    sleep 1 }
```

and to vote

```sh
curl 'https://dddmelb-2024.azurewebsites.net/api/EloVotingSubmitPair' \
  -H 'User-Agent: Mozilla/5.0' \
  --data-raw '{"WinnerSessionId":"9Uz3QOR1g2eqvpISESYHMB/UOjSYiE/2OPqeb5xdgxuqZF2ESh2XLBe5w6FJXYNdjPuC+OJ495rCP7Wivs8B4aiPhguHHQi8IdWHiznFcpOJaVflazQGhEwrxTyctbb2mwnqwIyk783jJjg1tRnfWuuLiJzRKvgD5riCClz/Yfg46VuzdOnMONdH5qXExagh","LoserSessionId":"tmdJU7xJZ/KzmAH75J1cPBBNG4GX5p+CGRpVB5FAA3WUSFFuH4m3PETKRAzm7MVk7sw3qFWWxJmWIji07uHKabA0Wn6DFn65t7kDAPb+ASRAe8dVu9L30T5G+SOQr5fgitIOF4reiTTtwBVH/2pIjK4mUclR+ZleLqhrkYlMhkMfPqrkFutgWn/SwtQrHXow","IsDraw":false,"VoterSessionId":"S/BGZ","VoterTicket":"","VoterLastname":""}'
```

## process the data

```sh
cat data_json_per_line.txt| jq '.SubmissionA | {Title, Abstract}'
```

but still with duplicates and no `SubmissionB`

```sh
ruby -e 'require "JSON"; \
lines = File.read("data_json_per_line.txt").split("\n"); \
lines.map{|l| JSON.parse(l, symbolize_names: true) rescue nil}. \
    compact.map{|l| [l[:SubmissionA], l[:SubmissionB]]}. \
    flatten.map{|sub| sub.slice(:Title, :Abstract) }. \
    each{|sub| puts "-------------\n", sub[:Title], "============\n", sub[:Abstract]}'
```

