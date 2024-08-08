# minimal-reproducible-nuitka

This repository is a minimal reproducible example of a bug in Nuitka.

## Steps to reproduce through docker
- Clone this repository 
- Run `docker build .`
- Run `docker run <image_id>`
- Observe the error


Nuitka version, full Python version, flavor, OS, etc. as output by `python3 -m nuitka --version` command.
```text
2.4.5
Commercial: None
Python: 3.10.14 (main, Aug  2 2024, 02:22:57) [GCC 12.2.0]
Flavor: Unknown
Executable: /usr/local/bin/python3
OS: Linux
Arch: aarch64
Distribution: Debian 12
Version C compiler: /usr/bin/gcc (gcc 12).
```


How did you install Nuitka and Python
```text
Nuitka was installed using pip
Python was in the base image
```


The specific PyPI names and versions provided by `python3 -m pip list -v`:
```text
Package               Version Location                                Installer
--------------------- ------- --------------------------------------- ---------
lz4                   4.3.3   /usr/local/lib/python3.10/site-packages pip
mcap                  1.1.1   /usr/local/lib/python3.10/site-packages pip
mcap-protobuf-support 0.5.1   /usr/local/lib/python3.10/site-packages pip
Nuitka                2.4.5   /usr/local/lib/python3.10/site-packages pip
ordered-set           4.1.0   /usr/local/lib/python3.10/site-packages pip
pip                   23.0.1  /usr/local/lib/python3.10/site-packages pip
protobuf              5.27.3  /usr/local/lib/python3.10/site-packages pip
setuptools            65.5.1  /usr/local/lib/python3.10/site-packages pip
wheel                 0.43.0  /usr/local/lib/python3.10/site-packages pip
zstandard             0.23.0  /usr/local/lib/python3.10/site-packages pip
```


Provide in your issue the Nuitka options used
```bash
# The command used to build the standalone executable
python3 -m nuitka --debug --standalone --experimental=allow-c-warnings --static-libpython=no --output-filename=main --output-dir=dist main.py
```



## Steps to reproduce directly on macOS
- Clone this repository
- (Optional) Create a virtual environment
- Run `make install`
- Run `make onefile`
- Run `dist/main.dist/main`
- Observe the error


Nuitka version, full Python version, flavor, OS, etc. as output by `python3 -m nuitka --version` command.
```text
2.4.5
Commercial: None
Python: 3.11.4 (main, Jun  7 2023, 00:34:23) [Clang 14.0.0 (clang-1400.0.29.202)]
Flavor: Homebrew Python
Executable: /Users/shuhaoqing/repo/minimal-reproducible-nuitka/.venv/bin/python3
OS: Darwin
Arch: arm64
macOSRelease: 14.5
Version C compiler: /usr/bin/clang (clang 15.0.0).
```


How did you install Nuitka and Python
```text
Nuitka was installed using pip
Python was installed using Homebrew with version 3.10.12, and the virtual environment was created using `python3 -m venv .venv`
```


The specific PyPI names and versions provided by `python3 -m pip list -v`:
```text
Package               Version Location                                                                              Installer
--------------------- ------- ------------------------------------------------------------------------------------- ---------
lz4                   4.3.3   /Users/shuhaoqing/repo/minimal-reproducible-nuitka/.venv/lib/python3.10/site-packages pip
mcap                  1.1.1   /Users/shuhaoqing/repo/minimal-reproducible-nuitka/.venv/lib/python3.10/site-packages pip
mcap-protobuf-support 0.5.1   /Users/shuhaoqing/repo/minimal-reproducible-nuitka/.venv/lib/python3.10/site-packages pip
Nuitka                2.4.5   /Users/shuhaoqing/repo/minimal-reproducible-nuitka/.venv/lib/python3.10/site-packages pip
ordered-set           4.1.0   /Users/shuhaoqing/repo/minimal-reproducible-nuitka/.venv/lib/python3.10/site-packages pip
pip                   23.0.1  /Users/shuhaoqing/repo/minimal-reproducible-nuitka/.venv/lib/python3.10/site-packages pip
protobuf              5.27.3  /Users/shuhaoqing/repo/minimal-reproducible-nuitka/.venv/lib/python3.10/site-packages pip
setuptools            67.6.1  /Users/shuhaoqing/repo/minimal-reproducible-nuitka/.venv/lib/python3.10/site-packages pip
zstandard             0.23.0  /Users/shuhaoqing/repo/minimal-reproducible-nuitka/.venv/lib/python3.10/site-packages pip
```

Provide in your issue the Nuitka options used
```bash
# The command used to build the standalone executable
python3 -m nuitka --debug --standalone --experimental=allow-c-warnings --static-libpython=no --output-filename=main --output-dir=dist main.py
```

## Expected behavior for both cases
In either case, the program should run with the following error:
```
Start processing example...
Assertion failed: ((exception_value) != NULL), function EXCEPTION_MATCH_BOOL_SINGLE, file exceptions.h, line 1141.
```

And note that without Nuitka, the program runs without any errors.