# kicad-in-a-bottle

KiCAD related tools and experiments

## KiCAD tools in Docker and Python

Inspired by

[GH:KiCad/demos/python_scripts_examples](https://github.com/KiCad/kicad-source-mirror/tree/master/demos/python_scripts_examples)

https://github.com/INTI-CMNB/KiBot.git does not work in KiCAD 7.x

## Containers

| script                | purpose                      |
|-----------------------|------------------------------|
| 10_build_rdp.sh       | builds the `u2004rdp` image  |
| 11_run_rdp.sh         | runs the above               |
| 12_run_nohome.sh      | no mapped `/home/kicad` dir  |
| 20_build_kicad_gui.sh | build the `u2004kicad` image |
| 21_run_kicad_gui.sh   | runs the above               |
| 30_build_cli.sh       | build the `kicli` image      |
| 31_run_batch.sh       | runs the above               |

The image `kicli` is used primarily for exporting the manufacturing data.
While the `u2004rdp` is an image for running x11 via `MSRDP` protocol.
And finally `u2004kicad` adds full-blown KiCAD with all deps and recommends
into the mix accessible via `MSRDP` uses the `u2004rdp` as a base image.
