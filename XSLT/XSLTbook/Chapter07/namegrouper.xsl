<?xml version="1.0" encoding="UTF-8"?>
<!-- namegrouper.xsl-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="html"/>
    
    <xsl:key name="places" match="address" use="place"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Grouped</title>
            </head>
            <body style="font-family: sans-serif;">
                <table border="1" cellpadding="5">
                    <xsl:for-each select="//address[generate-id(.)=generate-id(key('places', place)[1])]">
                        <xsl:sort select="place"/>
                        <xsl:for-each select="key('places', place)">
                            <xsl:sort select="name/last-name"/>
                            <xsl:sort select="name/last-name"/>
                            <tr>
                                <xsl:if test="position() = 1">
                                    <td style="background: #66FF66; text-align: center; vertical-align: middle; font-weight:bold;" rowspan="{count(key('places', place))}">
                                    <xsl:text>Place:</xsl:text>
                                    <br/>
                                    <span style="font-size: 150%;">
                                        <xsl:value-of select="place"/>
                                    </span>
                                    <br/>
                                    <xsl:value-of select="planet"/>
                                    </td>
                                </xsl:if>
                                <td style="text-align: right; vertical-align: middle;">
                                    <xsl:value-of select="name/first-name"/>
                                    <xsl:text> </xsl:text>
                                    <span style="font-weight: bold; font-size: 125%;">
                                        <xsl:value-of select="name/last-name"/>
                                    </span>
                                </td>
                                <td>
                                    <xsl:value-of select="name/title"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>                    
                </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>