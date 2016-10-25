<?xml version="1.0" encoding="UTF-8"?>
<!-- number-lotr-06.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

<xsl:output method="text"/>

<xsl:template match="/">
    <xsl:text>Middle Earth Residents&#xA;</xsl:text>
    <xsl:for-each select="middleearth/race">
        <xsl:value-of select="@name"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:for-each select="character">
            <xsl:text> Character </xsl:text>
            <xsl:number count="character" level="single" format="w" ordinal="yes"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>