```
$ docker-compose build
$ docker-compose run --rm embulk

$ embulk example try1

$ find try1 -type f
try1/seed.yml
try1/csv/sample_01.csv.gz
```

seed.yml:

```yaml
in:
  type: file
  path_prefix: '/app/try1/csv/sample_'
out:
  type: stdout
```

```
$ gzip -cd try1/csv/sample_01.csv.gz
id,account,time,purchase,comment
1,32864,2015-01-27 19:23:49,20150127,embulk
2,14824,2015-01-27 19:01:23,20150127,embulk jruby
3,27559,2015-01-28 02:20:02,20150128,"Embulk ""csv"" parser plugin"
4,11270,2015-01-29 11:54:36,20150129,NULL

```

```
$ embulk guess try1/seed.yml -o config.yml
2022-03-24 06:49:12.837 +0000: Embulk v0.9.24
2022-03-24 06:49:13.708 +0000 [WARN] (main): DEPRECATION: JRuby org.jruby.embed.ScriptingContainer is directly injected.
2022-03-24 06:49:15.724 +0000 [INFO] (main): Gem's home and path are set by default: "/root/.embulk/lib/gems"
2022-03-24 06:49:16.696 +0000 [INFO] (main): Started Embulk v0.9.24
2022-03-24 06:49:16.894 +0000 [INFO] (0001:guess): Listing local files at directory '/app/try1/csv' filtering filename by prefix 'sample_'
2022-03-24 06:49:16.896 +0000 [INFO] (0001:guess): "follow_symlinks" is set false. Note that symbolic links to directories are skipped.
2022-03-24 06:49:16.899 +0000 [INFO] (0001:guess): Loading files [/app/try1/csv/sample_01.csv.gz]
2022-03-24 06:49:16.927 +0000 [INFO] (0001:guess): Try to read 32,768 bytes from input source
2022-03-24 06:49:17.038 +0000 [INFO] (0001:guess): Loaded plugin embulk (0.9.24)
2022-03-24 06:49:17.245 +0000 [INFO] (0001:guess): Loaded plugin embulk (0.9.24)
2022-03-24 06:49:17.266 +0000 [INFO] (0001:guess): Loaded plugin embulk (0.9.24)
2022-03-24 06:49:17.279 +0000 [INFO] (0001:guess): Loaded plugin embulk (0.9.24)
in:
  type: file
  path_prefix: /app/try1/csv/sample_
  decoders:
  - {type: gzip}
  parser:
    charset: UTF-8
    newline: LF
    type: csv
    delimiter: ','
    quote: '"'
    escape: '"'
    null_string: 'NULL'
    trim_if_not_quoted: false
    skip_header_lines: 1
    allow_extra_columns: false
    allow_optional_columns: false
    columns:
    - {name: id, type: long}
    - {name: account, type: long}
    - {name: time, type: timestamp, format: '%Y-%m-%d %H:%M:%S'}
    - {name: purchase, type: timestamp, format: '%Y%m%d'}
    - {name: comment, type: string}
out: {type: stdout}

Created 'config.yml' file.
```

config.yml:

```yaml
in:
  type: file
  path_prefix: /app/try1/csv/sample_
  decoders:
  - {type: gzip}
  parser:
    charset: UTF-8
    newline: LF
    type: csv
    delimiter: ','
    quote: '"'
    escape: '"'
    null_string: 'NULL'
    trim_if_not_quoted: false
    skip_header_lines: 1
    allow_extra_columns: false
    allow_optional_columns: false
    columns:
    - {name: id, type: long}
    - {name: account, type: long}
    - {name: time, type: timestamp, format: '%Y-%m-%d %H:%M:%S'}
    - {name: purchase, type: timestamp, format: '%Y%m%d'}
    - {name: comment, type: string}
out: {type: stdout}
```

```
$ embulk preview config.yml
2022-03-24 06:50:33.433 +0000: Embulk v0.9.24
2022-03-24 06:50:34.269 +0000 [WARN] (main): DEPRECATION: JRuby org.jruby.embed.ScriptingContainer is directly injected.
2022-03-24 06:50:36.231 +0000 [INFO] (main): Gem's home and path are set by default: "/root/.embulk/lib/gems"
2022-03-24 06:50:37.522 +0000 [INFO] (main): Started Embulk v0.9.24
2022-03-24 06:50:37.746 +0000 [INFO] (0001:preview): Listing local files at directory '/app/try1/csv' filtering filename by prefix 'sample_'
2022-03-24 06:50:37.749 +0000 [INFO] (0001:preview): "follow_symlinks" is set false. Note that symbolic links to directories are skipped.
2022-03-24 06:50:37.752 +0000 [INFO] (0001:preview): Loading files [/app/try1/csv/sample_01.csv.gz]
2022-03-24 06:50:37.768 +0000 [INFO] (0001:preview): Try to read 32,768 bytes from input source
+---------+--------------+-------------------------+-------------------------+----------------------------+
| id:long | account:long |          time:timestamp |      purchase:timestamp |             comment:string |
+---------+--------------+-------------------------+-------------------------+----------------------------+
|       1 |       32,864 | 2015-01-27 19:23:49 UTC | 2015-01-27 00:00:00 UTC |                     embulk |
|       2 |       14,824 | 2015-01-27 19:01:23 UTC | 2015-01-27 00:00:00 UTC |               embulk jruby |
|       3 |       27,559 | 2015-01-28 02:20:02 UTC | 2015-01-28 00:00:00 UTC | Embulk "csv" parser plugin |
|       4 |       11,270 | 2015-01-29 11:54:36 UTC | 2015-01-29 00:00:00 UTC |                            |
+---------+--------------+-------------------------+-------------------------+----------------------------+
```

```
$ embulk run config.yml
2022-03-24 06:51:17.621 +0000: Embulk v0.9.24
2022-03-24 06:51:18.759 +0000 [WARN] (main): DEPRECATION: JRuby org.jruby.embed.ScriptingContainer is directly injected.
2022-03-24 06:51:21.753 +0000 [INFO] (main): Gem's home and path are set by default: "/root/.embulk/lib/gems"
2022-03-24 06:51:23.209 +0000 [INFO] (main): Started Embulk v0.9.24
2022-03-24 06:51:23.357 +0000 [INFO] (0001:transaction): Listing local files at directory '/app/try1/csv' filtering filename by prefix 'sample_'
2022-03-24 06:51:23.358 +0000 [INFO] (0001:transaction): "follow_symlinks" is set false. Note that symbolic links to directories are skipped.
2022-03-24 06:51:23.361 +0000 [INFO] (0001:transaction): Loading files [/app/try1/csv/sample_01.csv.gz]
2022-03-24 06:51:23.431 +0000 [INFO] (0001:transaction): Using local thread executor with max_threads=8 / output tasks 4 = input tasks 1 * 4
2022-03-24 06:51:23.438 +0000 [INFO] (0001:transaction): {done:  0 / 1, running: 0}
1,32864,2015-01-27 19:23:49,20150127,embulk
2,14824,2015-01-27 19:01:23,20150127,embulk jruby
3,27559,2015-01-28 02:20:02,20150128,Embulk "csv" parser plugin
4,11270,2015-01-29 11:54:36,20150129,
2022-03-24 06:51:23.587 +0000 [INFO] (0001:transaction): {done:  1 / 1, running: 0}
2022-03-24 06:51:23.599 +0000 [INFO] (main): Committed.
2022-03-24 06:51:23.599 +0000 [INFO] (main): Next config diff: {"in":{"last_path":"/app/try1/csv/sample_01.csv.gz"},"out":{}}
```
