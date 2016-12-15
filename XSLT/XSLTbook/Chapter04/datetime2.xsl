<?xml version="1.0" encoding="UTF-8"?>
<!-- datetime2.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:template match="/">
    
        <xsl:text>More tests of formatting:&#xA;&#xA;</xsl:text>
        <xsl:text>Today is the </xsl:text>
        <xsl:value-of select="format-date(current-date(), '[Dwo] day of [MNn], [Y0001]')"/>
        <xsl:text>&#xA;Right now the time is </xsl:text>
        <xsl:value-of select="format-time(current-time(), '[m1o] minute of the [Hwo] hour of the day.')"/>
        <xsl:text>&#xA;The current time is </xsl:text>
        <xsl:value-of select="format-dateTime(current-dateTime(), '[h01]:[m01] [P] on [FNn] the [D10].')"/>
        <xsl:text>&#xA;Today is the </xsl:text>
        <xsl:value-of select="format-date(current-date(), '[dwo] day of the year.')"/>
        <xsl:text>&#xA;October 14, 1066 in French: </xsl:text>
        <xsl:value-of select="format-date(xs:date('1066-10-14'), '[D] [MNn,3-3] [Y0001]', 'fr', 'AD', 'FR')"/>        
        <xsl:text>&#xA;October 14, 1066 in French: </xsl:text>
        <xsl:value-of select="format-date(xs:date('1066-10-14'), '[D] [MNn] [Y0001]', 'fr', 'AD', 'FR')"/>        
        <xsl:text>&#xA;October 14, 1066 in German: </xsl:text>
        <xsl:value-of select="format-date(xs:date('1066-10-14'), '[D] [MNn,3-3] [Y0001]', 'de', 'AD', 'DE')"/>        
        <xsl:text>&#xA;October 14, 1066 in German: </xsl:text>
        <xsl:value-of select="format-date(xs:date('1066-10-14'), '[D] [MNn] [Y0001]', 'de', 'AD', 'DE')"/>        
        

    </xsl:template>
    
</xsl:stylesheet>