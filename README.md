# The Little Elpier — companion code

Code for *The Little Elpier: Higher-Order Logic, Types and λProlog, One Question at a Time*
by Volodymyr Pavlyshyn. Every program in the book is cut from this repository, and every
output printed in the book is a golden file here that the test checks.
The book: [Leanpub](https://leanpub.com/littleelpier) (PDF, EPUB) ·
[Amazon](https://www.amazon.de/dp/B0HQ13QZ2H) (Kindle) ·
[site](https://little-elpier.org/) ·
DOI [10.5281/zenodo.23864702](https://doi.org/10.5281/zenodo.23864702).
The book is open access under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/):
download the [PDF](https://github.com/Volland/little-elpier/releases/latest/download/little-elpier.pdf) or the
[EPUB](https://github.com/Volland/little-elpier/releases/latest/download/little-elpier.epub) free. If it helps you,
please buy a copy on Leanpub or Amazon: it pays for the work, and for the next book.

| Path | What |
|---|---|
| `lib/pond.elpi` | the running example: eight critters and who eats whom |
| `ch01/` … `ch09/` | examples per chapter; `FILE.out` is the expected output of `FILE.elpi`, `FILE.WHAT.repl.out` of the prompt session `FILE.WHAT.repl` |
| `solutions/` | solutions to every exercise, `chNN.elpi` with its output `chNN.out` |
| `elpier.py` | runs every example on the `leanelpi` wheel, with the `lean-elpi` program's arguments and output |
| `tests/run_elpi.py` | the golden-file test |
| `Dockerfile` | Python, the wheel, and `elpier` (also as `lean-elpi`) in one image |

## Run

**Python only.** Python 3.10+:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -e .
cd ch01 && elpier hello.elpi -I ../lib -test   # one example
cd .. && python3 tests/run_elpi.py             # every example
```

**Docker.**

```bash
docker build -t little-elpier .
docker run --rm -it -v "$PWD":/book little-elpier
```

**From source.** Build [lean-elpi](https://github.com/Volland/lean-elpi) v0.4.1 with
`lake build`, put `lean-elpi` on your PATH (or set `LEAN_ELPI`), then
`python3 tests/run_elpi.py`.

Licensed under Apache-2.0.
