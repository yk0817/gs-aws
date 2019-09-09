## A3RTがどんなものか、動かしてみる

```
$ gem install a3rt_client
$ gem list | grep a3rt_client # a3rtがあればOK
$ irb
irb(main):001:0> require 'a3rt_client'
irb(main):002:0> apikey = "*****"
irb(main):003:0> response = A3rt::Client.talk_api(apikey: apikey, query: "おはようございます")
p resonse
```
