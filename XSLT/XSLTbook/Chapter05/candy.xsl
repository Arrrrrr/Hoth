<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html"/>
    
    <xsl:template match="candiesoftheworld">
        <xsl:for-each select="national-candy">
            <html>
            <body>
            <h1>
                <xsl:value-of select="title"/>
                <xsl:text> Candy</xsl:text>
            </h1>
            <ul>
                <xsl:for-each select="candy">
                    <li>
                        <xsl:value-of select="position()"/>
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="name"/>
                    </li>
                </xsl:for-each>
            </ul>
            </body>
            </html>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
