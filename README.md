
Nendo project
=============

This is an experiment in creating a **high-level programming language for artistic creation** and visual design. The ultimate focus is squarely on its design and psychology of use, above any technical and otherwise practical considerations. It is a _laboratory language,_ looking for new approaches to digital creation.

Currently being developed as a domain-specific language in [Racket][racket], it is in its very early stages, with different approaches being prototyped. Right now it is being conceived as a plain text programming language, but it may develop into a visual language (visual interface standard?), or some other format that would help better achieve its goals.

The **first milestone** is to create a language that facilitates static (non-animated, non-interactive) image creation.

[racket]: http://racket-lang.org/


## The language sketches


### Sketch 1

Took aim on non-programmers by way of humanistic design that tried to remove many of the 'computery' parts of programming. Focused only on (non-animated) drawing functionality.

The first observation was that programming in the modern age, artistically-oriented programming included, is in great part much like it has been since the inception of computing, that is, tailoring the practice of programming to the computer more than to the user. The imperative paradigm of programming, that in which we describe step by step what tasks need to be done to accomplish what we want, is the norm. As an alternative stands the declarative paradigm, which introduces the powerful notion that the computer can (and should) figure out by itself the detailed steps to carry out, given something closer to a description of that which needs to be done. This is not a new paradigm, but its adoption is dwarfed by the earlier, more established imperative way of programming. A declarative way of programming needs not be attached to the actual processing of the machine, and can be thus tailored to human needs more freely.

That is why it was deemed appropriate to use a functional language, which is a programming language that uses functions and the exchange of values in order to describe a _system_ (as opposed to a _process_). With it, we could create something closer to the description of a picture, rather than a process to create one. So the [Racket][racket] language (of the Lisp family of languages) was chosen, for deeming it powerful for the construction of _domain-specific languages_ (essentially sub-languages). Its included [**pict**][pict] library and its **functional, value-based** approach to picture drawing was leveraged, albeit with slight modifications. In general, what the pict library allows for is to upgrade a picture from just a _result_ to a _value,_ which can be combined in different fashions with other such picture values (**composability,**) can be transformed, etc.

The concept of **draw modes** was introduced. They are a way to offer different approaches to the idea of drawing a picture, while maintaining composability among their results.

**Turtle mode** was implemented. With this mode, you can draw [turtle graphics][turtle-graphics] and use the output value as a regular `pict`, and modify it as with any in the pict library. You can use turtle picts within a turtle mode to draw them contextually (relative to current orientation and position).

Although the main code is in English, a Japanese **translation** is also offered (even translates `define` and `if`/`when`).


### Sketch 2 (current)

Takes base on the previous sketch. Japanese translation has been removed, and efforts to humanise code writing are being reduced, in order to bring focus into the core ideas.

**Function mode** has been outright ripped (though reduced in scope) from [Conal Elliott's][elliott] [Pan][pan] language as described in his 2001 paper [_Functional image synthesis._][http://conal.net/papers/bridges2001/] It allows the description of pictures with functions that take x and y coordinates as arguments.

[racket]: http://racket-lang.org/
[pict]: http://docs.racket-lang.org/pict/index.html
[turtle-graphics]: https://en.wikipedia.org/wiki/Turtle_graphics
[elliott]: http://conal.net/
[pan]: http://conal.net/Pan/Gallery/default.htm


## Examples of current sketch

Below is just a peek. To see more, check the 'examples' folder. It is recommended to use [Dr. Racket][racket] to execute them.

```lisp
(define (spiral length)
  (when (> length 0)
    (draw-turtle
     (forward 10)
     (right (* 0.5 length))
     (spiral (- length 1)))))

(spiral 1000)
```

```lisp
(define (coolify n thing)
  (frame-resize 10
    (transparency 0.5
      (colorize "pink"
        (line-width 10
          (rotate (* n 10)
            (scale 2 thing)))))))

(define boring-square (square 40))


boring-square

(hor-align -75
           (coolify 1 boring-square)
           (coolify 2 boring-square)
           (coolify 3 boring-square)
           (coolify 4 boring-square)
           (coolify 5 boring-square))
```


## About the author

This project is being developed by [Ale Grilli][agj] at Tokyo University of the Arts' [New Media][new-media] Master's program, with guidance from professor Takashi Kiriyama.

[agj]: http://agj.cl/
[new-media]: http://www.fm.geidai.ac.jp/newmedia/newmedia-about-en

