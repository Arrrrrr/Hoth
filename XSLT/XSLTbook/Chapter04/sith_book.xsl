<?xml version="1.0" encoding="UTF-8"?>
<!-- sith_book.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        <html>
            <body>
                <h1>
                    <xsl:text>The Book of the Sith</xsl:text>
                </h1>
                <p>This document contains
                    <xsl:value-of select="count(/book/SithList/SithListEntry)"/> 
                    average Sith Lords and 
                    <xsl:value-of select="count(/book/SithList/BadSithListEntry)"/> 
                    exceptionally evil Sith Lords.</p>
                <xsl:apply-templates select="book"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="title">
        <h1>
            <xsl:value-of select="."/>
        </h1>
    </xsl:template>
    
    <xsl:template match="SithListEntry">
        <h2>
            <xsl:value-of select="."/>
        </h2>
    </xsl:template>
    
    <xsl:template match="BadSithListEntry">
        <h2>
            Exceptionally evil: <xsl:value-of select="."/>
        </h2>
    </xsl:template>


</xsl:stylesheet>
