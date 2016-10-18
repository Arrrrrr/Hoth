<?xml version="1.0" encoding="UTF-8"?>
<!-- value-of_2_0.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

<xsl:output method="text"/>

<xsl:template match="/">
    <xsl:value-of select="characters/story/@name" separator=", "/>
</xsl:template>

</xsl:stylesheet>