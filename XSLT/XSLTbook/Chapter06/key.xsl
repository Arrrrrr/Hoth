<?xml version="1.0"?>
<!-- key.xsl -->
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html"/>
    
    <xsl:param name="country-name" select="parts-list/supplier/@country"/>
    <xsl:key name="supplier-by-country" match="supplier" use="@country"/>
    <xsl:key name="part-by-supplier" match="part" use="@supplier"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:text>Parts from </xsl:text>
                    <xsl:for-each select="key('supplier-by-country', $country-name)">                                              
                                <xsl:value-of select="@country"/>
                                <xsl:text>&#160;</xsl:text> 
                    </xsl:for-each>                    
                </title>
            </head>
            <body style="font-family: sans-serif;">
                <p>These are our countries:</p>
                <xsl:for-each select="key('supplier-by-country', $country-name)">
                    <ul>
                        <li>
                            <xsl:text>&#xa;</xsl:text>                  
                            <xsl:value-of select="@country"/>
                        </li>
                    </ul>
                </xsl:for-each>
                <xsl:choose>
                    <xsl:when test="key('supplier-by-country', $country-name)">
                        <xsl:apply-templates select="key('supplier-by-country', $country-name)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>That's not even a country.</p>
                    </xsl:otherwise>
                </xsl:choose>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="supplier">
        <h2>
            <xsl:value-of select="name"/>
        </h2>
        <p>
            <xsl:value-of select="name"/>
            <xsl:text> supplies these parts:</xsl:text>
        </p>
        <ul>
            <xsl:for-each select="key('part-by-supplier', @vendor-id)">
                <li>
                    <b>
                        <xsl:value-of select="name"/>
                    </b>
                    <xsl:text>: </xsl:text>
                    <xsl:apply-templates select="description"/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
</xsl:stylesheet>