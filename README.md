# Qwirkle
Thea bove files compute the exact probability of having a starting hand of a given score in a game of Qwirkle. This confirms theoretical results reported in the paper below.

> [Probabilities of Qwirkle Hand Values](https://www.tandfonline.com/doi/abs/10.1080/07468342.2018.1490592?journalCode=ucmj20), The College Mathematics Journal, 2018

## The Game of Qwirkle
[Qwirkle](https://en.wikipedia.org/wiki/Qwirkle) is a multiple award-winning tile game. Each tile is identified by a shape painted with a particular color. There are 6 possible shapes and 6 possibel colors, for a total of 36 possible color-shape combinations. There are three tiles that have any particular color-shape combination, for a total of 108 total tiles.

Points are gained by placing tiles in a grid so that each row/column has matching characteristic, i.e. each tile in a column is blue, or each tile in a row is a square. The maximum number of points the first play can make equals the largest set of tiles that all share one characteristic. We call the maximum number of tiles that all share a characteristic for a given hand the hands "score".

## Calculating Probabilities of a Starting Hand Score
The goal of [Probabilities of Qwirkle Hand Values](https://www.tandfonline.com/doi/abs/10.1080/07468342.2018.1490592?journalCode=ucmj20) is to calculate the probability that a starting hand has a particular "score".

### qwirkle_brute_force.m
This method calculates the exact probabilites by considering all (108 Choose 6) posssible starting hands. It takes approximately 30 min to run on a macbook PRO with an M1 chip.

### qwirkle_combo_eficient.m
This method calculates the exact probabiliites using a combinatorial short-cut. It takes advantage of the combinatorial multiplicity due to there being three tiles for each color-shapr combination. It runs very fast.
