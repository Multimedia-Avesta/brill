# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Added
- Sorting orders for Avestan and Middle-Persian
- Ignore `.`, `()`, and `-` for sorting
- Macros for apparatus criticus

### Fixed
- Spacing in Glossary
- Output of "Sequence of letters" in special situations

## [0.32.1] - 2020-05-02

### Fixed
- Optional argument of `Lemma` is now correctly handled for the sorted dictionary

## [0.32.0] - 2020-04-30

### Changed
- Add optional argument to `\Lemma` (\#9115)
- Add optional argument to `dictionary` envrionment (\#9115)
- Modify `\attestation` to be language-dependent

## [0.31.0] - 2020-04-28

### Added
- Support for package `pdfx`
- New option `printversion` (no crop and `pdfx`)
- New macro `\RDTrans{text}` for ritual directions in translations
- Support for package `gitver` with output of git version in footer
- Class option `nogitver`
- Optional argument for `\attestation` and `\attestation*`. Empty to override counting. (\#7865)

### Fixed
- Title pages (Brill logo, spacing)

## [0.30.0] - 2020-04-05

### Changed
- Index of Passages is now reimplemented to use an additional file `passages-mod.idx`
- Index macros are patched to use the additional file for output

### Fixed
- Add more checks to `\blocktranslation` (\#8908)
- Fix font shape for translation in `\blocktranslation` (\#9057)
- Fix definition of `\Av` for the PDF bookmarks (\#9056)

## [0.29.0] - 2020-04-04

### Added
- New macro `\addblankline[NUM]` (\#8943)
- New macro `\insertion{text}` for English passages within other languages
- Support of an additional file for hyphenation exceptions

### Changed
- Suppress hyphenation for title pages (`\title`, `\subtitle`, `\dedication`)
- `θ` (U+03B8) is always substitued by `ϑ` (U+03D1) (\#8996)
- Increase `\brokenpenalty` from `2000` to `5000`
- Modify macro `\blocktranslation` to work with empty first and second arguments (\#8908)
- Reestablish the enhanced definition of biblatex' `\mknormpage` to get `\bibrangedash` for `postnote` fields
- Hyperlinks are no longer coloured by default (they are still clickable). Instead you can use the class option `colorlinks` to get the old behaviour

### Fixed
- Indention for `\subsubsection` in TOC increased (could also be calculated later)
- Correct sorting of indexes (bug introducesd when changing from ~ to fixed width space)
- Improved method to suppress hyphenation within language macros

## [0.28.0] - 2020-03-29

### Changed
- Make `series+number` output flexible (\#8984)
- Add `\nopagebreak` to `\blocktranslation` to (hopefully) improve page breaks
- Change non-breakable space between book names and numbers to have fixed width
- `PhD` mode only: All entries in the TOC are now set upright (\#8915)
- Suppress hyphenation in language macros and environments

### Fixed
- Correct indention for long headings (more than one line)

## [0.27.0] - 2020-03-11

### Added
- Support for title pages
- New macros for languages and book name (\#8774)

### Changed
- Empty `type` fields are automatically set to `Thesis` for `@thesis` entries (\#8966)

### Fixed
- Fix footnote indention for pages where the counter switches from 9 to 10 and 99 to 100 resp. (\#8919)

## [0.26.2] - 2020-02-26

### Fixed
- `\uncertain` was still in italics

## [0.26.1] - 2020-02-26

### Added
- Macro `\supth` as shortcut for `\textsuperscript{th}`
- Macro `\uncertain{text}` as shortcut for `text\textsuperscript{\textup{?}}` (\#8941)

### Fixed
- Remove development code

## [0.26.1] - 2020-02-25

### Changed
- Prefixes of names are no longer considered for sorting (\#8935)
- Deactivate option `headings=optiontohead` (\#8921)

### Fixed
- Add rule for splitting up date fields (\#8917)
- Bug in `brilltable` for option `long` together with `label` (\#8940)

## [0.25.0] - 2020-02-18

### Changed
- Definitions of `\addsubsec` and `\addsubsubsec` to match KOMA-Script definitions
- Layout of headings in PhD mode (\#8915)

### Fixed
- Remove spurious blank in front of `\Phl`, `\Bactr` and `\Sogd` (\#8912)

## [0.24.0] - 2020-02-17

### Added
- New macros for cwl file

### Changed
- All cite macros now respect a date range (\#8911)
- `\Bactr` and `\Sogd` understand a third argument for the phonemic analysis (\#8907)
- `\Phl` now uses the `xspace` package instead of custom lists of characters (\#8912)
- `\blocktranslation` now checks for empty third mandatory argument (\#8908)

### Fixed
- Empty argument for `\Phl` caused spurious blank (\#8908)

## [0.23.0] - 2020-02-11

### Added
- New book macros (\#8774)
- New option `countwords` to ba available to all outputs (not only to the PhDs) (\#8814)
- New macro `\logwordcount` to write information about the number of words into the log file rather than the document itself
- New macro `\declarationPhD` for adding a standard declaration in PhD mode

### Changed
- `PhD` option does no longer activate the counting of words by default (use option `countwords`)
- `\Phl` now supports a second optional argument (`r` for reverse) (\#8903)

## [0.22.1] - 2020-02-05

### Changed
- Footnote references are always set upright

## [0.22.0] - 2020-02-05

### Added
- `cleveref` definitions for `\subthreesection`, `\subfoursection` and `\subfivesection`
- Macros and methods for word count when in PhD mode

### Changed
- Options for `xindy` at `glossary` loading
- `\newtranslation` now supports an optional argument for a ritual direction
- `\gettranslation` now supports an optional argument for the position of the corresponding ritual direction (empty for no rd output) (Experimental!)

### Fixed
- `\Sequenceofletters` now works for multiple glossaries/dictionaries as well

## [0.21.0] - 2020-01-29

### Added
- Environment `multicols` from the `multicol` package

### Fixed
- Definition of `\Bactr` (\#8866)
- `\Sequenceofletters` is now defined in the lua file
- Sorting of glossary (not finished yet)

## [0.20.0] - 2020-01-15

### Added
- Macros `\Ifstr` and `\Ifisinteger` for older versions of KOMA-Script
- New entries for class-brill.cwl
- New column parameters `M{Number_of_columns}` and `x{Number_of_hsize_portion}`
- Alternative definitions for heading for PhD mode
- Macros for tracking (letter-spacing): `\texttracking{}` and variants
- New source map for field `location`
- Macro `\addsubsubsec[shorttitle]{title}`

### Fixed
- class-brill.cwl
- Sorting in glossary respects "sort ids" at the beginning: ¹, ² and ³.

## [0.19.0] - 2020-01-08

### Added
- Support for Arabic using `Noto Naskh Arabic` (regular and bold)
- Word count for `PhD` option (to be tested)
- Letter `z` for sorting of glossary
- Macros and environments for languages and book names (\#8774)
- Macro `\Phl*[]{}{}` for transliterated text (upright) and no angle brackets (\#8829)

### Changed
- Pahlavi transliterations are now put in angle brackets instead of square brackets
- Use `xindy` instead of `makeindex` for sorting abbreviations (TODO: sort order)

### Fixed
- Footnote indention for first footnote

## [0.18.0] - 2019-12-09

### Added
- Support for multiple dictionaries

## [0.17.1] - 2019-12-09

### Fixed
- Sorting of passages (bug introduced when changing output of `index`)

## [0.17.0] - 2019-12-06

### Added
- Sorting now works for the complete word on the all four levels (* handling still missing)
- `f` and `ṃ` are now considered for the Gujarati sort order
- Some languages

### Changed
- Sorting of languages for Index of Words now alphabetically

## [0.16.0] - 2019-11-27

### Added
- Option `PhD` for special thesis format (SOAS)
- Proof of concept of sorted dictionary
- New level `Subsubsublemmata` and macros `\Subsubsublemma` and `\Subsubsublemma*`

### Changed
- Increase indent of sublemmata entries

## [0.15.0] - 2019-10-31

### Added
- New fonts for Avestan, Gujarati and Pahlavi (requires new package `muyafonts`)
- Macros `\textavestan`, `\textgujarati` and `\textpahlavi`
- Macros for all Avestan characters (cf. https://de.wikipedia.org/wiki/Unicodeblock_Avestisch)

## [0.14.0] - 2019-10-15

### Added
- Environment `alphenumerate` for enumeration with letters
- Options `enumdot`, `enumspace`, `enumparen` and `enumenclparen` for fine-tuning
- Options `alphenumdot`, `alphenumspace`, `alphenumparen` and `alphenumenclparen` for fine-tuning

### Changed
- Remap from U+2329 to U+27E8 and from U+232A to U+27E9

## [0.13.1] - 2019-10-14

### Fixed
- Definition of `\textrangle` and `\textlangle`

## [0.13.0] - 2019-10-14

### Added
- Macros `\backcircle`, `\checkmark`, `\leftwardsarrow`,  `\rightwardsarrow`, `\sectionsign`, `\textlangle`, `\textrangle`
- Book name macros `\PY`, `\PVr`, `\PV`, `\SY`, `\SYt` and `\PYt`
- Load font `Gnu FreeFont` for additional symbols

## [0.12.8] - 2019-10-11

### Added
- PDF bookmarks now support Unicode

### Changed
- Macro `\G` had to be changed to `\Gah`, because it is used by `hyperref`

### Fixed
- Fix PDF bookmark for `\Av`
- Concrete width values led to errors due to a missing `\begin{figure}`

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
[0.32.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.32.1
[0.32.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.32.0
[0.31.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.31.0
[0.30.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.30.0
[0.29.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.29.0
[0.28.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.28.0
[0.27.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.27.0
[0.26.2]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.26.2
[0.26.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.26.1
[0.26.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.26.0
[0.25.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.25.0
[0.24.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.24.0
[0.23.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.23.0
[0.22.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.22.1
[0.22.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.22.0
[0.21.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.21.0
[0.20.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.20.0
[0.19.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.19.0
[0.18.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.18.0
[0.17.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.17.1
[0.17.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.17.0
[0.16.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.16.0
[0.15.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.15.0
[0.14.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.14.0
[0.13.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.13.1
[0.13.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.13.0
[0.12.8]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.12.8
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
