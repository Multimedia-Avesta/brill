# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).


## [Unreleased]

## [1.4.1] - 2023-02-24
### Fixed
- Wrong call of `\pdfstringdefDisableCommands`
- Diasable `titlecase` by default

## [1.4.0] - 2023-02-20
### Added
- Add glyph substitution

## Changed
- Adapt glyph for new font version v4

## [1.3.1] - 2022-09-01
### Fixed
- Add check for `microtype` package not general apply patch 

## [1.3.0] - 2022-09-01
### Added
- New environment `minoreditionsection` to mimic two column end note layout
- New macro `\rdlast` for ritual directions, which end a stanza
- Workaround for correct running headers for conclusion

### Changed
- `numwidth` for table of figures and tables is now set dynamically
 
### Fixed
- `\newlanguage` is now robust
- Improve sorting for Index of Passages

## [1.2.0] - 2022-07-24
### Added
- New macros `\GetstanzaWithtranslationWithRD`, `\GetstanzaWithtranslationWithoutRD`, `\GetstanzaWithtranslationNBWithRD`, `\GetstanzaWithtranslationNBWithoutRD` and `\SetDefaultGetstanzaWithtranslationWithRD{true|false}` 


## [1.1.0] - 2022-07-10
### Added
- Add babel shorthands to `nohypenation` language (\#9578)
- Add options to switch on/off `\printindex` calls (\#11531)
- Add macro for AitB (\#11508)

### Changed
- Add glue to horizontal spacing at attestation (\#11504)
- Add new Khurso font

### Fixed
- Add option for older version of `microtype` to work around an issue (#11214)
- Fix handling of name prefixes with latest (1.10) version of `unified.bbx` (\#11504)

## [1.0.1] - 2022-05-04
### Fixed
- Add missing patch for bibmacro `bbx:editor` (\#11294)

## [1.0.0] - 2022-04-30
### Added
- Add bibliography option for AY/SH era layout (\#11294)
- Add new macro \GetStanzewithtranslationNB (\#11214)
- Add new Brill fonts (Option `legacyfonts` for old fonts)
- Add environment splittranslationNumbered (\#11451)

## [0.99.1] - 2022-01-12
### Added
- Add book names (\#11293)

## [0.99.0] - 2022-01-11
### Added 
- Add new language and text names (\#11288)
- Add special \conclusion macro (\#11248)
- Add Dictionary* environment (\#11280)
- Add new macro \blocktranslationNoindent (\#11257)

### Changed
- Change figure and table number for appendix (\#11279)

### Fixed
- Fix nobreak call for indices (\#11276)

## [0.98.0] - 2021-11-30
### Added
- New macro `\introduction*[]{}` for introduction with extra chapter heading

## [0.97.0] - 2021-11-27
### Fixed
- Using `booktabsstyle=false` resulted in an error due to a `\begingroup...\endgroup` 

## [0.96.1] - 2021-11-02
### Fixed
- `xindex`  config file (\#11199)
  
## [0.96.0] - 2021-10-30
### Added
- Replace AY in postorigdatetext field with small caps (\#11167)

### Fixed
- Add new config options to `xindex` files (\#11199)


## [0.95.0] - 2021-09-11
### Fixed
- Sorting for numbers and sort order in Sanskrit (\#11130, \#11131)

## [0.94.0] - 2021-09-05
### Fixed
- Handling of table notes for tables without headers (\#11032)

## [0.93.0] - 2021-08-30
### Fixed
- Restrict font changes for stanza to a local scope (\#11088)
- Wrong number in definition of `\textellipsis`

## [0.92.0] - 2021-07-20
### Fixed
- Fix handling for missing height parameter for brillfigure"
- Revert changes for empty lines in input file
- Fix sorting in glossaries for ⁺ and \uncertain

## [0.91.0] - 2021-07-09
### Added
- Check for `abbreviated text` in edited text and set as one in recte (\#10959)

### Fixed
- Output of stanzas without using `\GetStanza...` now uses default heading
- Ignore empty lines when reading stanzas from file (\#10993)

## [0.90.0] - 2021-06-20

### Added
- Support for table notes (package `threeparttablex`) 
- New options for `brilltable`: `tablesrules`, `tablenotes`, `tablenotesauto`
- New option `height` for `brillfigure`

### Changed
- Smaller box for reading type in apparatus output
- Add small flexibility to apparatus output

### Fixed
- Fix definition of column parameters `E` and `B`
- Caption settings for `brilltable` and `brillfigure`
- No more additional empty pages before `\printabbreviations` and `printabbreviations_ac`
- Correct indention for footnotes with different number of digits (e.g. 9-->10)
- Correct vertical skip for `part` entries in TOC
- Patch width of `longtable` captions
- Make `\textellipsis` and `\ldots` use U+2026 of brill font
- Correct calculation for widest entry in abbreviations


## [0.81.2] - 2021-05-02
### Fixed
- Revert redefinition of column parameters `M{}` and `m{}`.
- New column parameters `E{}` and `B{}` to use `M{}` with additional `@{}` at the end or the beginning resp.


## [0.81.1] - 2021-05-02
### Fixed
- Arguments in `{...}` are no longer considered by title case function


## [0.81.0] - 2021-04-29
### Added
- Class option `titlecase` to automatically get headings in title case as requested by Brill
- New column parameter `m{NUMBER}` for multiple columns based on `X` columns in the middle of a table
- New macro `\qq{}` to wrap argument in straight quotes, e.g. for XML attributes: `hand=\qq{first}`

### Changed
- For forthcoming publications of the same author a dash is now used to separate the letter, e.g. `forthcoming-a`
- Column parameter `M{NUMBER}` now adds a `@{}` at the end, i.e. it is suited for multiple columns including the right-most one
- URLs in the bibliography are no longer hyphenated after `https:`, but `https://`
- Multiple locations can be split by `-` and (new) by `–` in Zotero in order to be correctly evaluated as a list by biblatex

### Fixed
- Layout of `part` heading
- `part` always starts on an right-hand (odd) page


## [0.80.0] - 2021-04-13
### Added
- Class option `numberstyle` with values `Monospaced` (default) and `Proportional`

### Fixed
- Correct calculation of width for first column of abbreviations


## [0.79.0] - 2021-03-25
### Added
- Options `debug` and `checkhyphens` to load packages `lua-typo` and `lua-check-hyphen` resp.

### Changed
- Deactivate `textandtranslation` for now as it has too problems (\#10592)

### Fixed
- Correct distance between heading and page reference in TOC
- Add definitions for `\addsecnum` and `addsubsecnum` for `PhD` mode as well (\#10617)


## [0.78.0] - 2021-03-23
### Added
- New macros `\addsecnum` and `addsecnum*` for headings consisting of a number or string of numbers only
- New environment `textandtranslation` for first version of side-by-side layout 
- New macro `\GetstanzasWithtranslations{stanzaA}{stanzaB}` puts stanza A together with its translation on an even page and stanza B with its translation on the facing (odd) page; needs to be called within `textandtranslation`
- Option `linenumbers` for `\GetstanzaTextonly` and `\Gettranslation` (currently for internal usage only)

### Changed
- `\GetstanzaWithtranslation` checks for environment `textandtranslation`


## [0.77.0] - 2021-03-20
### Added
- New book macro `\PS` (\#10413)
- New macro `\brillbottomrule` to be used together with `\\*` by the user
- Support for character `Danda` (U+0964) so that it works within Latin text (without using `\textsanskrit` explicitly) (\#10517)
- New macros `\addsubsecnum` and `addsubsecnum*` for headings consisting of a number or string of numbers only

### Changed
- Activate handling of extended optional argument of sectioning macros

### Fixed
- Add missing `z` to sorting of NP glossary (\#10290)
- Correct output for attestation in NP context (\#10290)
- Add running header for `\listoffigurestables`
- Fix handling of `isbn` information in `annotation` field

## [0.76.0] - 2021-01-26
### Added
- Support for `@Software` entries (\#10360)
  
### Fixed
- Support for ISBN in `annotation` field for `@unpublished` (manuscripts) (\#10363)

## [0.75.1] - 2021-01-21
### Added
- Sorting order for `NP` glossaries (\#10290)

## [0.75.0] - 2021-01-16
### Added
- Language `NP` is valid option to `dictionary` (\#10290)

## [0.74.1] - 2021-01-13
### Fixed
- Prevent loading of `soul` package by user
- Add workaround for issue with `biblatex` (see [issue on GitHub](https://github.com/plk/biblatex/issues/1090))

## [0.74.0] - 2021-01-13
### Fixed
- Remove spurious blank (\#10278)
- Fix indexing for `\passage*` and `\word*` (\#10280)

## [0.73.0] - 2021-01-12
### Added
- Package `lua-ul` to support underline and strike-through macros
- Macro `\shinthreedots` for a shin plus U+0745

## [0.72.0] - 2020-12-23
### Added
- Relax check for special date strings in edited text
  
## [0.71.3] - 2020-12-23
### Fixed
- Add check for empty lines when reading stanzas

## [0.71.2] - 2020-12-22
### Fixed
- Ignore spaces at the beginning of a stanza (\#10240)

## [0.71.1] - 2020-12-08
### Fixed
- Table counting for `brilltable` with `long=true` and no caption

## [0.71.0] - 2020-12-07
### Changed
- Update for Google Noto fonts

### Fixed
- `BrillTable` now works without caption and/or header

## [0.70.0] - 2020-11-30
### Changed
- Use real subs in body text (`v` and `x`)
- 
### Fixed
- Line spacing in LOF/LOT
- Captions are now set hanging

## [0.63.0] - 2020-11-27
### Added
- Support for manual Index of Words

### Changed
- Spacing before `\minisec` is now `1\baselineskip` (was 2)
- Allow line breaks at `|` in Glossary to improve result

### Fixed
- Sorting for Index of Passages
- Index spacing
- Layout of enumerations
- Use `\raggedbottom`
- Use Tabular numbers for TOC
- Layout for List of Figures and Tables
- `textsuperscript{th}` now uses `\realsuperscript`, add `nd`, `rd` and `st`
- Sorting of Glossary
- Spacing for `\multicol` set to `\normalbaselineskip`

## [0.62.0] - 2020-11-23
### Added
- Sorting for Avestan in Index of Words

### Changed
- Language header in Index of Passages with spacing and in bold
- Language header in Index of Words with spacing and in bold
- Parameters for inline tables without caption and header

### Fixed
- Fix problem with disappearing text in the sorted glossary (#8780)
- Fix handling of numberstyle; Brill font does not fully support 'Numbers' feature
- Fix bug for glossary sorting (#8770)

## [0.61.0] - 2020-11-10
### Added
- Options `bfheader=true|false`, `headerfontsize` (set to value of `fontsize` by default) and `numberstyle=Monospaced|Proportional` for `brilltable`
- Macros `blockquote*` and `\blockcquote*` for in-text citations
- Macro `\footnotetextsuperscript` for upright superscript numbers

### Changed
- Option `booktabsstyle` set to `true` by default
- Boolean options for `brilltable` can be set without explicit `=true`
- Citation argument of `\blockcquote` set as footnote using `footcite` (\#9974)
- No more indention at start and end of each row for `brilltable`
- Suppress indention after `blocktranslation`
- Set spacing before `minisec` to `2\baselineskip`
- Change some book names and remove book names `AJPz` and `AJPhl` and add `AJ` instead (\#10139)

### Fixed
- Output of `brilltable` very much improved (still not perfect)
- Numbers in `brilltable` set to `OldStyle`

## [0.60.0] - 2020-11-03
### Added
- Macro `\Comment`

### Changed
- Set kerning after `\XVE` and `\NGVE` to `-1pt` in italic context (experimentell)

### Fixed
- Sorting of passage index
- Sorting of lemmata containing macros (\#10095)

## [0.59.0] - 2020-10-26
### Added
- Macro `\appindent` (\#10067)

### Fixed
- Sorting for `\Sublemma*`, `\Subsublemma*` and `\Subsubsublemma*` in glossaries (Please note, that these macros have to start on a new line in the source file) (\#8770)
- Handling of language arguments to `\foreign` (\#10007)

## [0.58.0] - 2020-09-29
### Added
- Redefine `\mkccitation` for correct layout of citations after `\blockcquote` (\#9906)
- Macros `GetstanzaWithtranscription` and `\GetstanzaTextonlyWithtranscription` to substitute edited text by text from `transcriptions.tex` (\#9621)

### Changed
- Kerning of 0.05em after `\editedtext` (\#9215)


## [0.57.0] - 2020-09-13
### Added
- Book name `DNa` (\#9878)

### Changed
- More interword space for transliteration argument of `\Sogd` (\#9876)


## [0.56.2] - 2020-09-04
### Fixed
- Use `\xspace` for `\OP*` (\#9854)


## [0.56.1] - 2020-09-03
### Fixed
- Correct number of columns for Index of Passages (modified for testing)


## [0.56.0] - 2020-09-02
### Added
- Support for language settings for fields  `journaltitle`, `series` and `publisher` (in addition to some title fields)
- Support for float placement `H` to be used with `brillfigure` and `brilltable` (\#9805)
`
### Changed
- Automatic replacement of quotation marks is now a `biblatex` option `autoquotationmarks`. Will be set to `false` for one of the next releases.
- Each language header in the `Index of Passages` now starts after a vertical space (\#9779)
- Spacing between footnotes set to `\baselineskip` for PhD mode (\#9789)

### Fixed
- Handling of commentary text (`\editedcommentarytext`) spanning multiple logical lines (\#9755)
- Bug with `\blocktranslation`: Numbers at the beginning were taken as penalty values (\#9806)


## [0.55.0] - 2020-08-30
### Added
- Macros `\Newtranscription` and `\Gettranscription` to support common `transcriptions.tex` file
- Support for Sanskrit glossaries (\#9775)

### Changed
- Suppress usage of common ligatures for `\Getstanza` and `\GetstanzaTextonly` (\#9731)
- Update to latest version of style `biblatex-unified` (also on CTAN)
- More word space for `\Phl` and `\Phl*` (\#9777)

### Fixed
- Handling of `keywords` information regarding languages other than the one given in `langid`
- Remove empty lines from modified dictionary to correct layout of inline list `Meanings` (\#9758)
- Correct indentation for `\GetstanzaTextonly*[heading=none]` (\#9762)

## [0.54.0] - 2020-08-19
### Added
- Language `Phltlt` for Pahlavi transliterated text to be used e.g. in `\blocktranslation` to get more interword space (\#9715)
- New files `LICENSE`, `README.md`, `INSTALL.md` and `CONTRIBUTING.md`
- Macro `\Setbtvspace{LENGTH}` for changing vertical spacing in `blocktranslation` (\#9584)

### Changed
- Within `blocktranslation` the vertical spacing is changed to `@btvspace` which is `\baselineskip` by default (\#9584)
- `babel` shorthands are activated for input files `translations.tex`, `abbreviations.tex` and `abbreviations_ac.tex` (\#9732)

### Fixed
- Glossary sorting (\#9720,\#9723)
- Indentation for `\GetstanzaWithtranslation` (\#9612)

## [0.53.1] - 2020-08-14

### Fixed
- Spacing for glossary set to `0.5em` for `\Lemma`, `\Sublemma`, `\Subsublemma` and `\Subsubsublemma` (\#9712)

## [0.53.0] - 2020-08-12

### Added
- Macros `\Deactivatefootnotetext` and `\Activatefootnotetext` to temporaly turn off the output of footnote text and back on (\#9622)
- Support for languages `dutch`, `latin` and `russian` (\#9696)
- Support for `transcriptions.tex` (only reading, no macros yet)

### Changed
- No space after `\Lemma` when followed by a `,` (\#9663)

### Fixed
- `°` is now ignored when sorting the glossary (\#9695)

## [0.52.1] - 2020-08-08

### Fixed
- Restore table handling (accidentally added to master branch)

## [0.52.0] - 2020-08-07

### Added
- New macro `\GetstanzaWithtranslation` (\#9612)

### Changed
- Increase word spacing within `\Phltlt` (\#9577)

### Fixed
- Environment `nohyphens` did not work as expected. `\exhyphenpenalty=10000` is now set inside the `hyphenrules` environment (\#9578)

## [0.51.1] - 2020-08-07

### Changed
- Activate `appendixprefix` for PhD mode

## [0.51.0] - 2020-08-06

### Added
- Macro `\appendixend` to return to `backmatter` (\#9597)
- Macro `\appendixstart` as synoynm to `\appendix` (\#9597)
- Macro `\nosmallcaps` to avoid usage of small caps within language macros (\#9607)
- Environment `nohyphen` as extension to `babel`'s `nohyphenation` (`exhyphenpenalty` set to `10000`)
- Macro `abstract*` for Abstract witout TOC entry (\#9579)

### Changed
- Appendix handling in PhD mode (\#9597)

### Fixed
- Handling of empty fields for title page (\#9604)
- Right to left layout of Arabic text in macro `\textarabic` (\#9609)

## [0.50.0] - 2020-07-26

### Added
- New macros `\editedtranslationtext` and `\editedcommentarytext`

### Changed
- Non-Latin scripts are now set-up using the `Harfbuzz` renderer (`fontspec` option)

### Fixed
- Font set-up for part headings
- Spacing for part headings

## [0.49.0] - 2020-07-16

### Added
- Support for Devanagari Script by adding `Noto Serif Devanagari` in regular and bold face to the bundle (\#9527)
- `\textsanskrit{...}` for using new font

## [0.48.0] - 2020-07-15

### Added

### Changed
- `\@declarationPhD` is only printed when not empty -> `\declarationPhD{}` for removing it from the title pages (\#9379)

### Fixed
- Handling of quotation marks within bibliography (\#9521)

## [0.47.0] - 2020-07-13

### Added
- `babel` shorthands for `ngerman` now also work for `british` (e.g. `"~`, `""` `"=`) (\#9501)

### Fixed
- Remove indention from starred `add...sec` variants  (\#9497)

## [0.46.1] - 2020-07-09

### Fixed
- Spacing for consecutive `\blocktranslation` calls (\#9453)
- Avoid page break after title of `\blocktranslation` (\#9453)

## [0.46.0] - 2020-07-09

### Added
- New macros `\department` and `\degree` for title page (\#9379)

### Changed
- Layout of title page (\#9379)
- Add spacing before title of block translation (\#9453)

### Fixed
- Regular expressions in muya.lua
- Avoid page break after title of block translation (\#9453)

## [0.45.0] - 2020-07-07

### Added
- Optional argument of `\blocktranslation` is used for a title (\#9453)
- Title page(s) for PhD mode (\#9379)
- Support for language setting per field (title and booktitle) (\#9381)

### Fixed
- `\passage*` now works correctly (\#9454)

## [0.44.0] - 2020-06-23

### Added
- Support for `\rd*` (no newline) (\#9327)

### Changed
- Bibliography output (\#9380, \#9381, \#9382, \#9384)

### Fixed
- `\Getstanza` no longer writes TOC entries with index macros
- `Ligatures` option for `fontspec` modified to get rid of font warnings

## [0.43.0] - 2020-06-17

### Added
- Internal `@btquote` environment

### Changed
- Hanging text for `\Gettranslation` (\#9337)

### Fixed
- Hanging text for `\blocktranslation` was broken (\#8955)

## [0.42.0] - 2020-06-10

### Added
- Key-value options `add` and `remove` for `\printabbreviationsac` (\#9280)

### Changed
- Default heading for list of abbreviations in the apparatus criticus

## [0.41.0] - 2020-06-09

### Added
- Key-value options `heading` and `booktoindex` for `\Getstanza` (\#9311)
- Macros `\SetDefaultStanzaheading` and `\SetDefaultStanzabooktoindex` (\#9311)
- `\printabbreviationsac*` for list without header
- Optional argument for `\printabbreviationsac` for setting another title

### Changed
- `\printabbreviationsac` prints header again
- Set `\arraystretch` to 1.4 for `\printabbreviationsac` in PhD mode (\#9307)

### Fixed
- Spacing on title pages
- Chapters inside `backmatter` start on a left- or right-hand page, whichever is available (Brill, p. 20)
- Spacing within `Abbreviations` lists
- Set width of box for subreadings to `1.5\parindent` to have enough space for `opr.` (\#9323)

## [0.40.0] - 2020-06-03

### Added
- Class option `tocdepth` to set the corresponding counter
- Check, whether TOC consists of more than four pages

### Changed
- Rename `\Gah` to `\G` (\#9271)
- All class options are now key-value options; old options remain valid
- `nogitver` (`gitver=false`) is now the default

## [0.36.0] - 2020-06-02

### Added
- Book names `BUK`, `SA` and `SBM`(\#9271)

### Changed
- Remove title from `\printabbreviationsac`
- Adjust number width and indentions in TOC for PhD mode

### Fixed
- Bug in `\newline` redefinition for `\blocktranslation` caused problems with `\part` entries; made it local

## [0.35.0] - 2020-05-30

### Added
- New macro `\Importstanzas*{FILENAME}`: internal references get suffix `-transcript` (\#9233)

### Changed
- Macro `\Importstanzas` gets suffix `-translit` for internal references

## [0.34.0] - 2020-05-30

### Added
- Macro `\Importstanzas{FILENAME}` to read and store each stanza in a separate macro (\#9233)
- Each stanza is added to the Index of Passages (\#9234)

### Fixed
- Abbreviations for apparatus criticus are now set upright instead of italics (\#9147)
- No hyphenation at dashes in the apparatus criticus (\#9229)

## [0.33.2] - 2020-05-27

### Fixed
- All macros whioch use `\textsuperscript`

## [0.33.1] - 2020-05-25

### Fixed
- Change some `\textsuperscript` to `\realsuperscript` to get correct font

## [0.33.0] - 2020-05-22

### Added
- Sorting orders for Avestan and Middle-Persian
- Ignore `.`, `()`, and `-` for sorting the glossaries
- Macros for apparatus criticus (\#9188)
- Macros for hanging text within `\blocktranslation` (\#8955)
- Support for package `fixme`
- New language `Parth` for Parthian (\#9211)

### Changed
- Text in `\blocktranslation` is now set hanging when `\newline` is used (\#8955)
- Remove languages `IParth` and `MParth`
- Redefine `\textsuperscript` to avoid problems with diacritics and other glyphs (\#9212)

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

## [0.8.0] - 2019-04-03

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

### Added
- Add new file muya.dbx for data model
- Add field "iraniandate"
- Add rules for manipulating bibliography data

### Fixed
- Fix handling of "forthcoming". Same place as year and no more output at the end.

## [0.3.0] - 2018-07-17


[Unreleased]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=
[1.4.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v1.4.1
[1.4.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v1.4.0
[1.3.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v1.3.1
[1.3.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v1.3.0
[1.2.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v1.2.0
[1.1.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v1.1.0
[1.0.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v1.0.1
[1.0.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v1.0.0
[0.99.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.99.1
[0.99.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.99.0
[0.98.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.98.0
[0.97.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.97.0
[0.96.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.96.1
[0.96.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.96.0
[0.95.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.95.0
[0.94.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.94.0
[0.93.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.93.0
[0.92.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.92.0
[0.91.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.91.0
[0.90.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.90.0
[0.81.2]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.81.2
[0.81.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.81.1
[0.81.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.81.0
[0.80.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.80.0
[0.79.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.79.0
[0.78.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.78.0
[0.77.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.77.0
[0.76.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.76.0
[0.75.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.75.1
[0.75.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.75.0
[0.74.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.74.1
[0.74.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.74.0
[0.73.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.73.0
[0.72.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.72.0
[0.71.3]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.71.3
[0.71.2]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.71.2
[0.71.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.71.1
[0.71.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.71.0
[0.70.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.70.0
[0.63.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.63.0
[0.62.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.62.0
[0.61.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.61.0
[0.60.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.60.0
[0.59.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.59.0
[0.58.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.58.0
[0.57.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.57.0
[0.56.2]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.56.2
[0.56.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.56.1
[0.56.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.56.0
[0.55.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.55.0
[0.54.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.54.0
[0.53.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.53.1
[0.53.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.53.0
[0.52.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.52.1
[0.52.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.52.0
[0.51.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.51.1
[0.51.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.51.0
[0.50.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.50.0
[0.49.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.49.0
[0.48.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.48.0
[0.47.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.47.0
[0.46.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.46.1
[0.46.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.46.0
[0.45.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.45.0
[0.44.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.44.0
[0.43.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.43.0
[0.42.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.42.0
[0.41.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.41.0
[0.40.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.40.0
[0.36.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.36.0
[0.35.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.35.0
[0.34.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.34.0
[0.33.2]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.33.2
[0.33.1]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.33.1
[0.33.0]:
https://redmine.kompetenzzentrum.uni-trier.de/projects/muya/repository/latex?utf8=%E2%9C%93&rev=v0.33.0
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
