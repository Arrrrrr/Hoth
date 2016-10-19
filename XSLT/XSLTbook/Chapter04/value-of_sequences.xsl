<?xml version="1.0" encoding="UTF-8"?>
<!-- value-of_sequences.xsl -->
<!-- because this is a sequence, it runs by itself. you do not have to put in an xml file -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:variable name="sevenelevenfood" as="xs:string*"
        select="'Pizza', 'French Fries', 'Tacos', 'Nachos', 'Slurpees', 'Donuts', 'Twinkies'"/>
    
    <xsl:template match="/">
        <xsl:value-of select="1 to 7" separator=", "/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="$sevenelevenfood" separator="&#xA;"/>
    </xsl:template>
    
</xsl:stylesheet>