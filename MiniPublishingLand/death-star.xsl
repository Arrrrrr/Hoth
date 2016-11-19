<?xml version="1.0" encoding="UTF-8"?>
<!-- number-lotr-01.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="deathstar">
        <html>
            <head>
                <title>Death star information</title>
            </head>
            <body>
                    <h1>
                        <xsl:value-of select="name"/>
                    </h1>
                    <p>
                        <xsl:value-of select="summary"/>
                    </p>
                    <h2>Weapons</h2>
                    <ul>
                        <xsl:for-each select="assets/weapons/weapon">
                            <li>
                                <xsl:value-of select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
                    <h2>Sith Lords</h2>
                    <ul>
                        <xsl:for-each select="assets/sithlords/master">
                            <li>The Master: <xsl:value-of select="."/></li>
                        </xsl:for-each>
                        <xsl:for-each select="assets/sithlords/apprentice">
                            <li>The Apprentice: <xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                    <h2>Admirals</h2>
                    <ul>
                        <xsl:for-each select="assets/admirals/admiral">
                            <li>
                                <xsl:value-of select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>
              </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>