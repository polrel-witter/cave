# %cave
swarm ascii art.

make shapes and distribute to `%pals`. ones we receive are writte to our wall if they don't overwrite any stones with an existing scratch.

there are a couple actions:
 - `%clear`: delete all shapes in our wall
 - `%carve`: commit a shape to our wall and distribute to %pals

it uses [gossip](https://github.com/Fang-/suite/blob/master/lib/gossip.hoon) to distribute shapes and [mast](https://github.com/R-JG/mast) as the frontend framework.
