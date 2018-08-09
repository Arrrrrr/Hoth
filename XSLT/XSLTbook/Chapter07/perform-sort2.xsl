<?xml version="1.0" encoding="UTF-8"?>
<!-- perform-sort2.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="/">
        <xsl:variable name="sortedCities" as="xs:string*">
            <xsl:perform-sort>
                <xsl:sort select="."/>
                <xsl:sequence select="addressbook/address/planet"></xsl:sequence>
            </xsl:perform-sort>
        </xsl:variable>
        <xsl:text>My best friends live on these planets:&#xA;&#xA;</xsl:text>
        <xsl:value-of select="$sortedCities" separator="&#xA;"/>
    </xsl:template>
    
</xsl:stylesheet>