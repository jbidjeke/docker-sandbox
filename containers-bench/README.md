Benchmark to mesure how much overload it takes to run a process (echo) in docker

One script to calculate all:
```shell
./bench
```

The detailed bench:

- ``bench-without-docker`` : run the echo command from the host
- ``bench-with-docker`` : run the echo command in a new docker container each time
- ``bench-with-docker-exec`` : run the echo command in the same docker container each time (exec)
- ``bench-running-the-bench-in-docker`` : run all the echo commands in the same docker container (sharing the bench-without-docker script)

The script ``time-taken-by-creating-a-docker-container`` will calculate the time taken to create a new docker container. This time can be substracted to the exec time of these bench ``bench-running-the-bench-in-docker`` and ``bench-with-docker-exec``


```bash
$ ./bench

Running 100 'echo' process.
0.00 ./bench-without-docker
0.00 ./bench-running-the-bench-in-docker  (possible negative value means 0.00)
15.39 ./bench-with-docker-exec
37.80 ./bench-with-docker
```