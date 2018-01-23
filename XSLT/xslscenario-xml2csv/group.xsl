<?xml version="1.0" encoding="UTF-8"?>
<!-- listing_2_0.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="/">
    
        <xsl:for-each select="groups/contentgroup">
            <xsl:value-of select="@side"/>
            <xsl:text>,</xsl:text>
            <xsl:text>,</xsl:text>            
            <xsl:text>&#xa;</xsl:text>
            <xsl:for-each select="place">
                <xsl:text>,</xsl:text>
                <xsl:value-of select="@label"/>
                <xsl:text>,</xsl:text>            
                <xsl:text>&#xa;</xsl:text>
                <xsl:for-each select="team">
                    <xsl:text>,</xsl:text>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="@member"/>
                    <xsl:text>&#xa;</xsl:text>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>


    
    </xsl:template>
    
</xsl:stylesheet>