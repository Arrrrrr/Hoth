<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html"/>
<!-- figure out: how to add spans for the codeph and filename tags in their proper locations. is there some kind of thing in xsl that goes back over text already printed and replaces it?  -->
    <xsl:template match="/">
        
        <html>
            <head>
                <link rel="stylesheet" href="test-report.css"/>
                <title>Test performed <xsl:value-of select="testreport/date"/></title>
            </head>
            <body>
                <h1><xsl:value-of select="testreport/question"/></h1>
                <p><xsl:value-of select="testreport/date"/></p>
                <h2><xsl:value-of select="testreport/summary"/></h2>               
                <h3>Test scenario data</h3>
                <p>Source data location: <xsl:value-of select="testreport/scenario/sourcedata/sourcedatalocation"/></p>
                <xsl:for-each select="testreport/scenario/sourcedata/sourcedatadescription">
                <p><xsl:value-of select="para"/></p>
                <p class="code"><xsl:value-of select="code"/></p>
                </xsl:for-each>
                <h3>Run tests</h3>
                <xsl:for-each select="testreport/scenario/transform">
                <p><xsl:value-of select="transformlocation"/></p>
                <p><xsl:value-of select="transformoutput"/></p>
                </xsl:for-each>
                <h3>Test results</h3>
                <xsl:for-each select="testreport/results/result">
                <p><xsl:value-of select="resultdescription"/></p>
                    <xsl:for-each select="resultimage">                       
                        <xsl:variable name="imagepath">
                            <xsl:value-of select="resultimagelink"/>
                        </xsl:variable>
                        <p>
                            <figure>
                                <figcaption><xsl:value-of select="resultimagetitle"/></figcaption>
                                <img src="{$imagepath}"></img>
                            </figure>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    
</xsl:stylesheet>