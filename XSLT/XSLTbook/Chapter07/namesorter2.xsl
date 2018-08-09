<?xml version="1.0" encoding="UTF-8"?>
<!-- namesorter2.xsl -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="text" indent="no"/>
    
    <xsl:template match="/">
        <xsl:for-each select="addressbook/address[starts-with(planet, 'D')]">
            <!-- <xsl:sort select="place"/> -->
            <xsl:sort select="name/last-name"/>
            <xsl:sort select="name/first-name"/>
            <xsl:if test="name/title">
                <xsl:value-of select="name/title"/>
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:value-of select="name/first-name"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="name/last-name"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:value-of select="place"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:value-of select="planet"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
    
