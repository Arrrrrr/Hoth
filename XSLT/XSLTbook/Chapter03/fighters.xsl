<?xml version="1.0"?>
<!-- fighters.xsl -->
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="text"/>
        
        <xsl:template match="/">
            
            <xsl:for-each select="fighters/name">
                <xsl:text>&#xA;  Ship name and allegiance: </xsl:text>
                <xsl:value-of select="."/>
                <xsl:text> - </xsl:text>
                <xsl:value-of 
                    select="(: Loyal to the Rebellion :)
                            if (@allegiance = 'Rebellion') then
                              'Rebel Alliance'
                              
                            (: Loyal to no one :)
                            else if (@allegiance = 'Bounty') then
                               'Bounty Hunter'
                              
                            (: Loyal to the Empire :)
                            else if (@allegiance = 'Empire') then
                                'The Empire'
                              
                            (: unknown spacecraft :)
                            else
                                'We don''t know this ship.'"/>
                
            </xsl:for-each>
        </xsl:template>
    
</xsl:stylesheet>