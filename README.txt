This is a LaTeX 2e version of the thesis/dissertation style files
that have been floating around LPL, along with some basic
documentation/samples.  It uses BibTeX and the `natbib' referencing
format and the `graphicx' package for handling figures.  Most 
LaTeX distributions should have these packages already.

From what we understand, if you're doing a Ph.D. it's a Dissertation,
and if you're doing a Masters it's a Thesis, and if you are getting
a musical arts degree it is a Document.  There are some slight
differences in the formatting of the `Statement by Author', which
this template should handle correctly.  Otherwise, they are basically
the same.  You can specify what kind of document you want produced
by giving the \documentclass command the right option at the top
of the file.  The sample dissertation.tex file has all three examples.

In addition to the Dissertation (or Thesis or Document) itself, you
must also produce a `Special Abstract' for UMI.  An example
special_abstract.tex file is also provided for this short document.
N.B. As of 2006, the special_abstract file may be obsolete, if you 
are submitting your dissertation electronically.  We include it here 
in case you still have need for it.

To compile the sample dissertation into a .dvi file, run the following
sequence of commands, or use the accompanying GNU Make file.

latex dissertation
bibtex dissertation
latex dissertation
latex dissertation
latex dissertation

That's right, you need to run LaTeX three times after you run BibTeX
to make sure that all the page numbers in the Table of Contents and
the Lists of Figures and Tables are correct.

The Special Abstract isn't as complicated and can be made into a .dvi
file with a single run of LaTeX.

Once you have those .dvi files, make sure you use the "-t letter"
option to dvips so that letter-sized output gets created in your
PostScript file.

The GNU Makefile will do all of this transparently (and make correct
PostScript files) with a single call to the GNU make program, often
aliased as `gmake'; but check your system, your default make program
may already be GNU make.


Files:

Makefile                GNU make file for building your dissertation
Makefile_alternate	Uses "rubber" to implement the build process.
abstract.tex            Sample abstract
acknowledgements.tex    Sample acknowledgements
appendix_A.tex          Sample appendix
bibliography.bib        Sample bibliography file
chapter_1.tex           Sample chapter
chapter_2.tex           Sample chapter
dedication.tex          Sample dedication
dissertation.tex        The main file.
figure.eps              Sample figure
refs.sty                Abbreviations for common journals
special_abstract.tex	Sample special abstract file
uabibnat.bst            Bibliography style file
uathesis.cls            LaTeX 2e class file for the UA Thesis format
aastex_hack.sty		Style file to be able to use AASTEX macros
deluxetable.sty		Style file allowing AASTEX deluxetable environment


    WARNING! WARNING! WARNING!

DISCLAIMER:  These files are not perfect, but they are based on
older LaTeX style files that have produced acceptable dissertations
for numerous former grad students.  If you use this class file and
associated files and Grad College won't accept it, it's not our
fault.  Double-check the format that this template produces against
the Grad College requirements for yourself to make sure:

http://grad.admin.arizona.edu/degreecert/thesismanual/front.htm

These files will certainly change as we hear about problems with
the formatting, so be sure to check for newer versions.

Happy dissertating!

Curtis S. Cooper            &        David A. Minton
curtis@lpl.arizona.edu	    daminton@lpl.arizona.edu

Last modified March 20, 2006
