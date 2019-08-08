# XCSV's Exile Scripts Mods & Tools Collection
> Credits Will Be Given When Credits Can Be Gathered.

[![NPM Version][npm-image]][npm-url]
[![Build Status][travis-image]][travis-url]
[![Downloads Stats][npm-downloads]][npm-url]

One to two paragraph statement about your product and what it does.

![](header.png)

## Installation

Instructions For Most Inside Folders :

<a href="https://github.com/XCSVs/Scripts-Mods/blob/master/INSTRUCTIONS/Exile%20Server%20Owner%20Guide%20v1.7.pdf
">Full Server Install Instructions Here</a>

BACKING UP MYSQL: HOW TO AUTOMATICALLY BACKUP ALL MYSQL DATABASES ON WINDOWS WITH A BATCH FILE.

```sh
 Typically we have used the backup facility built into MySQL administrator, which unfortunately has now reached end of life. While it worked well it had some major shortcomings. For example once you created a scheduled backup it would only include the databases you told it to at the time of creation. Well, if you are like us and you constantly add new databases the new ones simply wouldn’t be backed up, Annoying. What replaced MySQL administrator? Enter the new MySQL Workbench. Great tool save one missing feature, they decided to no longer support scheduled MySQL backups.

Obviously there are lots of scripts out there and easier solutions for linux based systems. The only windows solutions seemed to use php which seemed overly complex, relied on unnecessary systems that could fail, and introduced security concerns when you could use a simple batch file with a few lines of code to accomplish the same task. I had little luck Googling solutions on how to backup all the databases individually, zip them into one file, and delete the older archives so I sat down and wrote my own batch file. It was so useful to us that I feel compelled to share it with others. It should work on any version of windows x86 or x64 and any version of MySQL.
```

## Usage example

A few motivating and useful examples of how your product can be used. Spice this up with code blocks and potentially more screenshots.

_For more examples and usage, please refer to the [Wiki][wiki]._

## Development setup

Describe how to install all development dependencies and how to run an automated test-suite of some kind. Potentially do this for multiple platforms.

```sh
make install
npm test
```

## Release History

* 0.2.1
    * CHANGE: Update docs (module code remains unchanged)
* 0.2.0
    * CHANGE: Remove `setDefaultXYZ()`
    * ADD: Add `init()`
* 0.1.1
    * FIX: Crash when calling `baz()` (Thanks @GenerousContributorName!)
* 0.1.0
    * The first proper release
    * CHANGE: Rename `foo()` to `bar()`
* 0.0.1
    * Work in progress

## Meta

Your Name – [@YourTwitter](https://twitter.com/dbader_org) – YourEmail@example.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

## Contributing

1. Fork it (<https://github.com/yourname/yourproject/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

<!-- Markdown link & img dfn's -->
[npm-image]: https://img.shields.io/npm/v/datadog-metrics.svg?style=flat-square
[npm-url]: https://npmjs.org/package/datadog-metrics
[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/yourname/yourproject/wiki
