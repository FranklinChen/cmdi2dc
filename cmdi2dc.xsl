<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xpath-default-namespace="http://www.clarin.eu/cmd/"
    exclude-result-prefixes="fn"
    >

    <xsl:output
        method="xml"
        omit-xml-declaration="no"
        encoding="UTF-8"
        indent="yes"/>

    <xsl:template match="/CMD">
        <oaidc:dc xmlns="http://purl.org/dc/elements/1.1/"
                  xmlns:oaidc="http://www.openarchives.org/OAI/2.0/oai_dc/"
                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                  xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd"
                  >
            <!-- For corpus level, expect 1 -->
            <xsl:for-each select="/CMD//Corpus/Title">
                <title><xsl:value-of select="."/></title>
            </xsl:for-each>

            <!-- For transcript level, expect 1 -->
            <xsl:for-each select="/CMD//Session/Title">
                <title><xsl:value-of select="."/></title>
            </xsl:for-each>

            <!-- Is this right? -->
            <identifier><xsl:value-of select="/CMD/Header/MdProfile"/></identifier>

            <creator><xsl:value-of select="/CMD/Header/MdCreator"/></creator>

            <xsl:for-each select="/CMD//Subject[fn:normalize-space(.) and fn:normalize-space(.) != 'Unspecified']">
                <subject><xsl:value-of select="."/></subject>
            </xsl:for-each>

            <!--
                Many, for different levels
                Skip empty.
            -->
            <xsl:for-each select="/CMD//Description[fn:normalize-space(.)]">
                <description><xsl:value-of select="."/></description>
            </xsl:for-each>

            <xsl:for-each select="/CMD//Publisher[fn:normalize-space(.)]">
                <publisher><xsl:value-of select="."/></publisher>
            </xsl:for-each>

            <xsl:for-each select="/CMD//Owner[fn:normalize-space(.)]">
                <contributor><xsl:value-of select="."/></contributor>
            </xsl:for-each>

            <!-- Creation date as well as other dates -->
            <date><xsl:value-of select="/CMD/Header/MdCreationDate"/></date>

            <xsl:for-each select="/CMD//Date[fn:normalize-space(.) and fn:normalize-space(.) != 'Unspecified']">
                <date><xsl:value-of select="."/></date>
            </xsl:for-each>

            <xsl:for-each select="/CMD//Genre">
                <type><xsl:value-of select="."/></type>
            </xsl:for-each>

            <format>CHAT</format>

            <!-- TODO
            <source>TODO</source>
            -->

            <xsl:for-each select="/CMD//Content_Language/Id">
                <language><xsl:value-of select="."/></language>
            </xsl:for-each>

            <xsl:for-each select="/CMD//Actor_Language/Id">
                <language><xsl:value-of select="."/></language>
            </xsl:for-each>

            <!--
            <relation>TODO</relation>
            <coverage>TODO</coverage>
            <rights>TODO</rights>
            -->
            </oaidc:dc>
    </xsl:template>
</xsl:stylesheet>
