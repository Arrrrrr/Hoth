<?xml version="1.0" encoding="UTF-8"?>
<!-- for-each-group_group-by.xsl-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:output method="html" include-content-type="no"/>
        
        <xsl:template match="/">
            
            <html>
                <head>
                    <title>Grouped</title>
                </head>
                <body style="font-family: sans-serif;">
            <table border="1" cellpadding="5" style="font-family: sans-serif;">
                <xsl:for-each-group select="//address" group-by="place">
                    <xsl:sort select="current-grouping-key()"/>
                        <xsl:for-each select="current-group()">
                        <xsl:sort select="name/last-name"/>
                        <xsl:sort select="name/first-name"/>

                <tr>
                    <xsl:if test="position() = 1">
                        <td valign="center" bgcolor="#999999" rowspan="{count(current-group())}">
                            <b>
                                <xsl:text>
                                    Place:
                                </xsl:text>
                                <xsl:value-of select="current-grouping-key()"/>
                            </b>
                        </td>
                    </xsl:if>
                    
                    <td align="right">
                        <xsl:value-of select="name/title"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="name/first-name"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="name/last-name"/>
                    </td>
                    
                    <td>
                        <xsl:value-of select="planet"/>
                    </td>
                </tr>
                        </xsl:for-each>
                </xsl:for-each-group>
            </table>
                </body>
            </html>
        </xsl:template>
        
    
    
</xsl:stylesheet>