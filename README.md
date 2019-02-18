A Phoenix app taking advantage of [Gigalixir](https://gigalixir.com)'s "Never sleeps" free tier to poke other sleepy services at various intervals.

Note: seems something like this:
```
2019-02-18T21:50:05.254407+00:00 monstrous-alert-nurseshark[gigalixir-run]: Shutting down 'monstrous-alert-nurseshark' on host 'monstrous-alert-nurseshark-2341805682-2mxdh'
2019-02-18T21:50:05+00:00 monstrous-alert-nurseshark[gigalixir]: Killing container with id docker://cdad07c451c368772aa28a0e0cf23e6c7d7454192f48854fb373056684655150:Need to kill Pod
```
is normal during a deploy to gigalixir. At least, it doesn't signal lack of desired functionality for this project.
