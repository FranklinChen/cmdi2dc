# Reliable
SAXON = saxon
# TODO validate

# Unreliable
XSLTPROC = xsltproc

# $ wget http://www.openarchives.org/OAI/2.0/oai_dc.xsd
XMLLINT = xmllint
#XMLLINT_OPTIONS = --format --schema oai_dc.xsd --valid
XMLLINT_OPTIONS = --format


XSL = cmdi2dc.xsl

# Verify XSL does the right thing, at three levels.
test:	test-talkbank test-TBIBank test-01a

test-talkbank:	standard/expected/talkbank.xml standard/output/talkbank.xml
	diff -u $^

test-TBIBank:	standard/expected/TBIBank.xml standard/output/TBIBank.xml
	diff -u $^

test-01a:	standard/expected/01a.xml standard/output/01a.xml
	diff -u $^

output/%.xml:	input/%.cmdi $(XSL)
#	xsltproc -o $@ $(XSL) $<
	$(SAXON) -xsl:$(XSL) -s:$< -o:$@

# Hack for diffing XML as text files
standard/expected/%.xml:	expected/%.xml
	$(XMLLINT) $(XMLLINT_OPTIONS) --output $@ $<

standard/output/%.xml:	output/%.xml
	$(XMLLINT) $(XMLLINT_OPTIONS) --output $@ $<

clean:
	rm -rf output/* standard/output/*

.PHONY:	test test-talkbank test-TBIBank test-01a clean
