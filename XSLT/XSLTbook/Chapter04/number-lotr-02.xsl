<?xml version="1.0" encoding="UTF-8"?>
<!-- number-lotr-02.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
        
    <xsl:template match="/">
        <html>
            <head>
                <title>Middle Earth Residents</title>
            </head>
            <body>
                <xsl:for-each select="middleearth/race">
                    <p>
                       <xsl:text>Members of the </xsl:text>
                        <xsl:value-of select="@name"/>
                        <xsl:text>: </xsl:text>
                        <!-- can use different number / letter formats -->
                        <xsl:number value="count(character)" format="1"/>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>