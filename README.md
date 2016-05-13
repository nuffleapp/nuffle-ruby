[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE) [![Build Status](https://travis-ci.org/nuffleapp/nuffle-ruby.svg?branch=master)](https://travis-ci.org/nuffleapp/nuffle-ruby) [![codecov](https://codecov.io/gh/nuffleapp/nuffle-ruby/branch/master/graph/badge.svg)](https://codecov.io/gh/nuffleapp/nuffle-ruby)

# Nuffle, The Ruby Library

Nuffle, The Ruby Library, is a simple library that provides the functionality to roll one die with any number of sides.


## Installation

First, install Nuffle using [RubyGems](http://guides.rubygems.org/rubygems-basics/#installing-gems):

```
gem install nuffle
```

Then, require the library at the top of your script:

```
require 'nuffle'
```

## Usage

Nuffle is a simple dice roller, allowing you to roll a die of any number of sides. To do so, simply call the `roll()` method with the number sided die you want to roll:

```
Nuffle.roll(20)
```

That method will return a number between 1 and 20 (inclusive).


## Contributing

Please read through our [contributing guidelines](CONTRIBUTING.md). Included are directions for opening issues, coding standards, and notes on development.


## Versioning

For transparency into our release cycle and in striving to maintain backward compatibility, Nuffle is maintained under [the Semantic Versioning guidelines](http://semver.org/). Sometimes we screw up, but we'll adhere to those rules whenever possible.

See [the Releases section of our GitHub project](https://github.com/nuffleapp/nuffle-ruby/releases) for changelogs for each release version of Nuffle.


## Support

The [issue tracker](https://github.com/nuffleapp/nuffle-ruby/issues) is
the preferred channel for [bug reports](#bug-reports), [features requests](#feature-requests)
and [submitting pull requests](#pull-requests).

For personal support requests, please use [Gitter](https://gitter.im/nuffleapp/nuffle-ruby) to get help.


## Copyright and License

Code and documentation copyright 2016 nuffleapp. Code released under [the MIT license](LICENSE).