<?xml version="1.0" encoding="UTF-8"?>
<!-- number-lotr-05.xsl -->
<!-- only counts even numbers -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="/">
        <xsl:text>Even numbered Middle Earth Residents&#xA;</xsl:text>
        <xsl:for-each select="middleearth/race">
            <xsl:value-of select="@name"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:for-each select="character">
              <xsl:text>  </xsl:text>
              <xsl:if test="(position() mod 2) = 0">
                  <xsl:number count="race|character" level="multiple" format="1.1. "/>
              </xsl:if>
              <xsl:value-of select="."/>
              <xsl:text>&#xA;</xsl:text>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>