# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Added
- PDF bookmarks now support Unicode

### Fixed
- Fix PDF bookmark for `\Av`

## [0.12.7] - 2019-10-09

### Fixed
- Macro `\Av` had to be made robust to be used in section headings

## [0.12.6] - 2019-10-02

### Added
- New macro `\Link{}` for a link to an existing attestation
- New macro `\Sublemma*{}` for an "inline" variant of a sublemmata to be introduced by "|"
- New list `Subsublemmata` and corresponding macros `\Subsublemma{}` and `\Subsublemma*{}` for nested attestations

### Changed
- Verbatim usage of `~` now supported within complete `Sublemmata` environment
- Replaced `~` with `\nobreakspace` for macros to not interfere with verbatim usage in dictionary

### Fixed
- Indention for `Sublemmata` and `Subsublemmata` set to `\parindent` and `2\parindent` resp.

## [0.12.5] - 2019-09-16

### Changed
- Spacing after `\beforeblocktranslation{}` set to one blank line

## [0.12.4] - 2019-09-03

### Added
- All book macros like `\Y` and `\Par` automatically set the corresponding abbreviation internally

### Fixed
- Correct size for page number in header to 11bp (was 10bp)
- Correct prefix font for chapters to use lining proportional numbers

## [0.12.3] - 2019-08-29

### Fixed
- Correct definition of inline enumerations (bug introduced with v0.12)

## [0.12.2] - 2019-08-27

### Added
- New options `source` and `longsource` for environment `brillfigure`
- New macro `\beforeblocktranslation{}` for an indented text before a block translation
- New macro `\anklink{}{}` for links to Anklesaria. `\Ank` is automatically applied to second argument
- New macro `\addsubsec{}` analog to `\addsec` etc.: No numbering, but entry in TOC

### Fixed
- Use small caps for Roman numerals in TOC

## [0.12.1] - 2019-08-21

### Added
- New sorting order for "Index of Words" and "Index of Passages"

## [0.12.0] - 2019-08-16

### Added
- New environment `brillfigure` with various options (similar to brilltable)
- New macro `\Ank` for Anklesaria links

### Fixed
- Avoid hyphenation within title
- Avoid hyphenation within ancient languages
- Correct font for chapter page numbers in TOC
- Correct caption layout (`\captionformat` was not evaluated due to `french`)
- Correct output of running headers for indexes

## [0.11.2] - 2019-07-18

### Changed
- `\blocktranslation*` now _always_ evaluates optional argument

## [0.11.1] - 2019-07-18

### Added
- Environment `splittranslation*` as variant of `splittranslation` with a
spacing of one line between original text and translation

### Changed
- Macro `\blocktranslation*` now checks for surrounding `splittranslation`
environment in order to use inline enumerated list

## [0.11.0] - 2019-07-17

### Added
- Alternative macro `\blocktranslation*` with no indention
- New macros `\XVE` and `\NGVE`

### Changed
- Change language macros to use `\emph` instead of `\textit`
- Indexes are now set using `xindex`. Not yet finished.

### Fixed
- Minor fixes for the bibliography

## [0.10.1] - 2019-05-16

### Added
- Add option `landscape` to `brilltable` environment

## [0.10.0] - 2019-05-15

### Added
- Add new language and abbeviations for `OE` (#7999)
- Add options `long` and `booktabsstyle` to `brilltable` (#7998)

### Changed
- Switch to `tabu`package with `long` option for `brilltable` (#7998)
- Change expanded form of the abbreviation `ntr.` from 'neutre' to 'neuter' (#7999)

### Fixed
- Varaible layout of `List of Abbreviations` based on the Brill guidelines (#8000)

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
[0.12.7]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.12.7
[0.12.6]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.12.6
[0.12.5]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.12.5
[0.12.4]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.12.4
[0.12.3]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.12.3
[0.12.2]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.12.2
[0.12.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.12.1
[0.12.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.12.0
[0.11.2]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.11.2
[0.11.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.11.1
[0.11.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.11.0
[0.10.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.10.1
[0.10.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.10.0
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
