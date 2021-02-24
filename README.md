# Brill

## About

This repository contains the necessary LaTeX files to typeset an edition
for the [“MUYA” project](https://multimediayasna.wixsite.com/muya).
Moreover it integrates features for a PhD thesis at SOAS, University of
London as well.

MUYA is a multi-disciplinary, international project and has as its focus
the Yasna – the core ritual of the Zoroastrian religion. The project is
funded by the [European Research Council (ERC)](https://erc.europa.eu/) with an Advanced Investigator Grant (2016–2021).

All files are

## Files

* `brill.cls`: The main document class implementing
the guidelines of [Brill](https://brill.com/) as found in the “Brill
Typographic Style” (BTS) v2.0. This file is meant as a general approach and
will later be published on its own.
* `CorpusAvesticum.tex`: Specific (re)definitions for the series `Corpus Avesticum`.
* `muya.bbx`, `muya.cbx`, `muya.dbx`: Style files for citations and bibliography output based on the [Unified Stylesheet for Linguistics Journals](https://www.linguisticsociety.org/resource/unified-style-sheet).
It uses `biblatex` and is based on the [`biblatex-unified` style](https://github.com/semprag/biblatex-sp-unified).
* `muya.lua`: File containing Lua functions to be called from LuaLaTeX
* `xindex-*.lua`: Configuration files for the indexing processor `xindex`
* `word_count.lua`: Lua functions to count words in sections of the text (thanks to [Philipp Gesang](https://gist.github.com/phi-gamma/2622252)).
* `ustring`: A pure-Lua library to handle UTF-8 strings (see [ustring/README](ustring/README) for more information)

## Installation

Please see [INSTALL.md](INSTALL.md) for details on the installation
requirements.

## Contributing

If you would like to contribute to the development you are very welcome.
Please see [CONTRIBUTING](CONTRIBUTING) for details.

## Changelog

If you are interested in the history of the code, please have a look at
[CHANGELOG.md](CHANGELOG.md).
