<?xml version="1.0" encoding="UTF-8"?>
<!-- helga.weapons.xsl -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" include-content-type="no"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Helga has lotsa weapons</title>
            </head>
            <body style="font-family: sans-serif;">
                <h1>Helga and her awesome weaponry</h1>
                <xsl:for-each-group select="html/body/*" group-adjacent="boolean(self::p)">
                    <xsl:choose>
                        <xsl:when test="current-grouping-key()">
                            <ul>
                                <xsl:for-each select="current-group()">
                                    <li>
                                        <xsl:copy-of select="@*"/>
                                        <xsl:copy-of select="*|text()"/>                               
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:for-each select="current-group()">
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each-group>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>        
    </xsl:template>
    
</xsl:stylesheet>