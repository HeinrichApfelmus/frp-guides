These examples are written using the [Threepenny-GUI](http://wiki.haskell.org/Threepenny-gui) library.

The examples use `stack.yml` file to specify package dependency versions. First, install the relevant libraries by running the command

    $ stack install threepenny-gui

Then, try, say, the first example by executing the command    

    $ stack runghc 01-behavior.hs

This will start a webserver on a certain port, which is displayed in the output, e.g.

    Listening on http://127.0.0.1:8001/
    [06/Mar/2016:20:08:17 +0100] Server.httpServe: START, binding to [http://127.0.0.1:8001/]

To see the result, point your reasonably modern browser to the corresponding address, as presented below.

1. [http://127.0.0.1:8001/](http://127.0.0.1:8001/)
2. [http://127.0.0.1:8002/](http://127.0.0.1:8002/)
3. [http://127.0.0.1:8003/](http://127.0.0.1:8003/)
4. [http://127.0.0.1:8004/](http://127.0.0.1:8004/)