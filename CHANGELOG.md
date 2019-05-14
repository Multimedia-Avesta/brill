# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Added
- Add new language and abbeviations for `OE`

### Changed
- Switch to `tabu`package with `long` option for Brilltable

## [0.9.1] - 2019-05-09

### Added
- Add new langauge macros `\OHG`, `\PGmc` and `\ZD` and the corresponding blocks

### Changed
- Passages are not language-dependent
- Use Muya index style for Index of Passages

### Fixed
- Fixed layout of Table of Contents (spacing before backmatter, indexes)

## [0.9.0] - 2019-05-06

### Added

- Add new macro `\translation{LANGUAGE}{ORIGINALTEXT}{TRANSLATION}`
- Add font `GNU FreeFont` for later usage

### Changed
- Map names of language macros and environments to abbreviations (old macro names kept for compatibility)
- Map names of macros for book names to abbreviations (old macro names kept for compatibility)
- `\OP` can now handle two or three arguments (as `\Phlv` already could) (#7980)
- Internal modification of the `blockquote` macro to match Brill's guidelines (#7977,#7981)

### Removed

- Remove `\Ved` as macro within the glossary/dictionary -> new name needed?

## [0.8.1] - 2019-04-09

### Added
- Optional argument for translations to all language macros (#7755)
- Macro `\Phlv` to support two or three arguments (#7755)
- Macro `\Avst*` to mark a word as Avestan and write it directly to the index (#7935)

## {0.8.0] - 2019-04-03

### Added
- Support for language-dependent indexes
- New macro `\printindexes` to keep all necessary steps internal
- New file `muya-british.lbx` for later usage to (re)define specific terms
- New files `muya.ist` and `brill.ist`: style files for makeindex

### Fixed
- Spacing within dictionary (meanings)


## [0.7.0] - 2019-03-01

### Added
- Package `todo` for adding Todo notes with `\todo{...}`
- Support for new languages (#7755)
- New macros for dictionaries (see How-To in the wiki)


## [0.6.1] - 2019-02-18

### Changed
- Bibliography: replace ` - ` in lists `publisher` and `location` by ` and `

### Fixed
- Handling of footnotes
- Metacomment
- Font selection

## [0.6.0] - 2018-11-14

### Added
- New macros `\chapterref`, `\gettranslation`

### Changed
- Restructuring of the bundle according to meeting in London

### Fixed
- Missing argument number for `\chapterref`
- Bibliography style


## [0.5.0] - 2018-11-14

### Added
- Source maps to improve data handling (quotes, note field, title/subtitle)
- `biblatex` option `isbn=false` and `doi=false`
- Mapping to ignore all pagetotal information

### Changed
- Reintegrate note field for unpublished work with ISBN (`Manuscript` in Zotero)
- Bib macro `date+extrayear` to remove parentheses (accidentally overwritten)
- Bib macro `series+number` to use non-breakable space

### Fixed
- Redefinition of macro for `addendum+pubstate`
- Running headers for non-numbered chapters



## [0.4.0] - 2018-08-31

    Add new file muya.dbx for data model
    Add field "iraniandate"
    Add rules for manipulating bibliography data
Fix handling of "forthcoming". Same place as year and no more output at the end.

## [0.3.0] - 2018-07-17


[Unreleased]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=
[0.9.1]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.9.1
[0.9.0]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.9.0
[0.8.1]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.8.1
[0.8.0]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.8.0
[0.7.0]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.7.0
[0.6.1]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.6.1
[0.6.0]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.6
[0.5.0]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.5
[0.4.0]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.4
[0.3.0]: 
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.3



\usepackage[marginpar]{todo}.