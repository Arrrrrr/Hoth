<?xml version="1.0" encoding="UTF-8"?>
<!-- number-lotr-01.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>XSL count styles</title>
            </head>
            <body>
                <h1>XSL count styles</h1>
                <h3><xsl:text>Numbers</xsl:text></h3>
                <xsl:for-each select="middleearth/race">
                    <p>
                        <xsl:number format="1. "/>
                        <xsl:value-of select="@name"/>
                    </p>
                </xsl:for-each>  
                <h3><xsl:text>Lowercase letters</xsl:text></h3>
                <xsl:for-each select="middleearth/race">
                    <p>
                        <xsl:number format="a. "/>
                        <xsl:value-of select="@name"/>
                    </p>
                </xsl:for-each>
                <h3><xsl:text>Uppercase letters</xsl:text></h3>
                <xsl:for-each select="middleearth/race">
                    <p>
                        <xsl:number format="A. "/>
                        <xsl:value-of select="@name"/>
                    </p>
                </xsl:for-each>
                <h3><xsl:text>Roman numerals lowercase</xsl:text></h3>
                <xsl:for-each select="middleearth/race">
                    <p>
                        <xsl:number format="i. "/>
                        <xsl:value-of select="@name"/>
                    </p>
                </xsl:for-each>
                <h3><xsl:text>Roman numerals uppercase</xsl:text></h3>
                <xsl:for-each select="middleearth/race">
                    <p>
                        <xsl:number format="I. "/>
                        <xsl:value-of select="@name"/>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>