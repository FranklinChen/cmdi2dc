# cmdi2dc

(Note: this whole thing was a temporary hack and no longer used for anything!)

Some XSLT to convert from a CMDI XML file to a DC XML file.

## Running

### Saxon

I use [Saxon](http://www.saxonica.com/welcome/welcome.xml) as the XSLT processor. It requires Java to be installed.

On Mac OS X, Saxon can be installed with [Homebrew](http://brew.sh/) using

```
$ brew install saxon
```

To transform `input.cmdi` to `output.xml`:

```
$ saxon -xsl:cmdi2dc.xsl -s:input.cmdi -o:output.xml
```
