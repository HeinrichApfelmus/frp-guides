FRP Guides
==========

This respository collects tutorials, guidelines, examples, patterns and half-baked ideas on functional reactive programming (FRP).

At the moment, it is organized a bit like a curated Wiki. If you've found a nice code pattern, or a cool link, don't hesitate to make a pull request.

The focus is on FRP libraries written in [Haskell][], using the style originally pioneered by Conal Elliott, and developed e.g. in the [reactive-banana][], [frpnow][] or [sodium][] libraries.

All written material here is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons BY-SA 4.0 License</a>. Any source code snippets or examples used here are released to the public domain.

  [haskell]: https://www.haskell.org/
  [reactive-banana]: https://github.com/HeinrichApfelmus/reactive-banana
  [frpnow]: https://github.com/atzeus/FRPNow
  [sodium]: https://github.com/SodiumFRP/sodium

Table of Contents
-----------------

* apfelmus/
    * [mvc.md](apfelmus/mvc.md) — Three useful principles for structuring GUI code.

External Resources
------------------

* FRP was pioneered by Conal Elliott and his writings are a good source on the topic.
  * ["Functional Reactive Animation"][2a] — This is the seminal paper that started the whole FRP thing. It's still a nice, though somewhat outdated overview of FRP.
  * ["Declarative event-oriented programming"][2b] — Practial example that demonstrates the utility of FRP for GUI programming. Excellent introduction to the general programming philosophy.
  * ["Push-pull functional reactive programming"][2c] — Good read for understanding how the model is mapped to an API in terms of applicative and other functors.

* Stephen Blackheath and Antony Jones have written a [book "Functional Reactive Programming"][blackheath]. It is an introduction to FRP using Java as the main language, but it also describes several patterns that occur in practice.

  [2a]: http://conal.net/papers/icfp97/
  [2b]: http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.31.1064
  [2c]: http://conal.net/papers/push-pull-frp/
  [blackheath]: https://www.manning.com/books/functional-reactive-programming
