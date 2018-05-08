<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="parts-list">
        <xsl:for-each select="component">
            <xsl:text>&#xA;    </xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text> (component #</xsl:text>
            <xsl:value-of select="@component-id"/>
            <xsl:text>) uses these parts:&#xA;   </xsl:text>
            <xsl:for-each select="id(partref/@refid)">
                <xsl:value-of select="name"/>
                <xsl:text>&#xA;    </xsl:text>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
