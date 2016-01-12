
Nendo project
=============

This is an experiment in creating a **high-level programming language for artistic creation** and visual design. The ultimate focus is squarely on its design and psychology of use, above any technical and otherwise practical considerations. It is a _laboratory language,_ looking for new approaches to digital creation.

Currently being developed as a domain-specific language in [Racket][racket], it is in its very early stages, with different approaches being prototyped. Right now it is being conceived as a plain text programming language, but it may develop into a visual language (visual interface standard?), or some other format that would help better achieve its goals.

The **first milestone** is to create a language that facilitates static (non-animated, non-interactive) image creation.

[racket]: http://racket-lang.org/


## The sketches


### Sketch 1

Using Lisp syntax and leveraging the entire [Racket][racket] language. Only featured (non-animated) drawing functionality.

The [**pict**][pict] library and its **functional, value-based** approach to picture drawing was also leveraged, albeit with some modifications. These are mostly renaming some functions, and making sure that they take the picture as the _last_ argument, which allows for clearer, more composable code. Some extra utilities were also included.

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

