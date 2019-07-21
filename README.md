# Canary Helper

This is a shell file for you to generate [warrant canaries](https://en.wikipedia.org/wiki/Warrant_canary) easily.

Templates derived from [canaries of BLUG (Beijing LUG)](https://beijinglug.club/wiki/doku.php?id=blug-canary-1). Changing it in `run.sh` if you want to.

## Requirements
* date
* gpg
* [rsstail](https://github.com/flok99/rsstail)
  * Also on [AUR](https://aur.archlinux.org/packages/rsstail)
  * You can also use [rsstail from PyPi](https://pypi.org/project/rsstail/). In this case, use `run-py.sh` instead of `run.sh` since they accept different parameters.

## Usage

Remember to fill in `signers.txt` and `special.txt` with whatever you want to.

* `signers.txt`: Signers of the canaries.
* `special.txt`: Special notes contained in the canaries.

``` shell
$ ./run.sh     # if you use rsstail of flok9
# ./run.py.sh  # if you use rsstail from PyPi
```

It will generate these files for you:
* canary-YYYYMM.txt
* canary-YYYYMM.txt.asc

## Known Issues
* Some Telegraph (telegraph.co.uk) entries may contain non-breaking space (\xa0). It won't affect the verification of this file itself, but could be problematic when republishing the file in text without proper transformation.

## License

MIT License
