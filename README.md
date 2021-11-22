# glibc-build-tools

Just toy tools to build [The GNU C Libray](https://www.gnu.org/software/libc/libc.html).

## Usage

Here is an example using version 2.31 for x86_64.

```
$ git clone https://github.com/jueve/glibc-build-tools.git
$ cd glbc-build-tool
$ GLIBC_VERSION=2.31 CPU_ARCH=x86_64 ./init.sh
```

After putting logs, a woking directory is generated.
It's name convention is `[CPU_ARCH]-[GLIBC_VERSION]`(In this case, `x86_64-2.31`).

```
$ ls
README.md  conf_build.sh  download.sh  init.sh  x86_64-2.31
```

It's directory tree is here.

```
x86_64-2.31/
|
+--source  ... The glibc source code.
+--build   ... A working directory when buidling.
+--install ... When we succeed to build, we can use binary files from here.
```

`init.sh` just downloads source code. If you want to check dependencies, please read `INSTALL` file in `source` directory.

And now, let's build.

```
$ ./x86_64-2.31/build/build.sh
```

## Supporting architecture

- `x86_64`
- `i686`

