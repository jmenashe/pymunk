Pymunk
======

.. image::  https://raw.githubusercontent.com/viblo/pymunk/master/docs/src/_static/pymunk_logo_animation.gif

Pymunk is a easy-to-use pythonic 2d physics library that can be used whenever 
you need 2d rigid body physics from Python. Perfect when you need 2d physics 
in your game, demo or other application! It is built on top of the very 
capable 2d physics library `Chipmunk <http://chipmunk-physics.net>`_.

The first version was released in 2007 and Pymunk is still actively developed 
and maintained today. 

Pymunk has been used with success in many projects, big and small. For example: 
3 Pyweek game competition winners, more than a dozen published scientific 
papers and even in a self-driving car simulation! See the Showcases section on 
the Pymunk webpage for some examples.

2007 - 2019, Victor Blomqvist - vb@viblo.se, MIT License

This release is based on the latest Pymunk release (5.6.0), 
using Chipmunk 7.0.2 rev aef346fb8b (source included)


Installation
------------

In the normal case pymunk can be installed with pip::

    > pip install pymunk

It has one direct dependency, CFFI.

Pymunk can also be installed with conda, from the conda-forge channel::

    > conda install -c conda-forge pymunk


Example
-------

Quick code example::
    
    import pymunk               # Import pymunk..

    space = pymunk.Space()      # Create a Space which contain the simulation
    space.gravity = 0,-1000     # Set its gravity

    body = pymunk.Body(1,1666)  # Create a Body with mass and moment
    body.position = 50,100      # Set the position of the body

    poly = pymunk.Poly.create_box(body) # Create a box shape and attach to body
    space.add(body, poly)       # Add both body and shape to the simulation

    while True:                 # Infinite loop simulation
        space.step(0.02)        # Step the simulation one step forward
    
For more detailed and advanced examples, take a look at the included demos 
(in examples/).

Examples are not included if you install with `pip install pymunk`. Instead you
need to download the source archive (pymunk-x.y.z.zip). Download available from 
https://pypi.org/project/pymunk/#files


Documentation
-------------

The source distribution of Pymunk ships with a number of demos in the examples
directory, and it also contains the full documentation including API reference.

You can also find the full documentation including examples and API reference 
on the Pymunk homepage, http://www.pymunk.org


The Pymunk Vision
-----------------

    "*Make 2d physics easy to include in your game*"

It is (or is striving to be):

* **Easy to use** - It should be easy to use, no complicated stuff should be 
  needed to add physics to your game/program.
* **"Pythonic"** - It should not be visible that a c-library (chipmunk) is in 
  the bottom, it should feel like a Python library (no strange naming, OO, 
  no memory handling and more)
* **Simple to build & install** - You shouldn't need to have a zillion of 
  libraries installed to make it install, or do a lot of command line tricks.
* **Multi-platform** - Should work on both Windows, \*nix and OSX.
* **Non-intrusive** - It should not put restrictions on how you structure 
  your program and not force you to use a special game loop, it should be 
  possible to use with other libraries like Pygame and Pyglet. 

  
Contact & Support
-----------------
.. _contact-support:

**Homepage**
    http://www.pymunk.org/

**Stackoverflow**
    You can ask questions/browse old ones at Stackoverflow, just look for 
    the Pymunk tag. http://stackoverflow.com/questions/tagged/pymunk

**E-Mail**
    You can email me directly at vb@viblo.se

**Issue Tracker**
    Please use the issue tracker at github to report any issues you find:
    https://github.com/viblo/pymunk/issues
    
Regardless of the method you use I will try to answer your questions as soon 
as I see them. (And if you ask on SO or the forum other people might help as 
well!)


Dependencies / Requirements
---------------------------

Basically Pymunk have been made to be as easy to install and distribute as 
possible, usually `pip install` will take care of everything for you.

- Python (Runs on CPython 2.7 and 3.X. Pypy and Pypy3)
- Chipmunk (Compiled library already included on common platforms)
- CFFI (will be installed automatically by Pip)
- Setuptools (should be included with Pip)

* GCC and friends (optional, you need it to compile Chipmunk)
* Pygame (optional, you need it to run the Pygame based demos)
* Pyglet (optional, you need it to run the Pyglet based demos)
* Matplotlib & Jupyter Notebook (optional, you need it to run the Matplotlib 
  based demos)
* Sphinx (optional, you need it to build documentation)


Python 2 & Python 3
-------------------

Pymunk has been tested and runs fine on both Python 2 and Python 3. It has 
been tested on recent versions of CPython (2 and 3) and Pypy. For an exact 
list of tested versions see the Travis and Appveyor test configs.


Chipmunk Compilation
--------------------

This section is only required in case you dont install pymunk the normal way 
(`pip install` or `setup.py install`). Otherwise its handled automatically by 
the install command.

Pymunk is built on top of the c library Chipmunk. It uses CFFI to interface
with the Chipmunk library file. Because of this Chipmunk has to be compiled
before it can be used with Pymunk. Compilation has to be done with GCC or 
another compiler that uses the same flags. 

The source distribution does not include a pre-compiled Chipmunk library file, 
instead you need to build it yourself. 

There are basically two options, either building it automatically as part of 
installation using for example Pip::

    > pip install pymunk-source-dist.zip

Or if you have the source unpacked / you got Pymunk by cloning its git repo, 
you can explicitly tell Pymunk to compile it inplace::    

    > python setup.py build_ext --inplace

Note that chipmunk is actually not built as a python extension, but distutils /
setuptools doesn't currently handle pure native libraries that needs to be built 
in a good way if built with build_clib.

The compiled file goes into the /pymunk folder (same as space.py, 
body.py and others).
