<?xml version="1.0"?>
<!-- id-html.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Look cool catalogue</title>
            </head>
            <body style="font-family: sans-serif;">
                <h1>Look cool catalogue</h1>
                <p>Want to look cool? Keep reading...</p>
                <h2 style="background: #66FF66;">Components</h2>
                <xsl:apply-templates select="/parts-list/component"/>
                <h2 style="background: #66FF66;">Parts</h2>
                <xsl:apply-templates select="/parts-list/part"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="component">
        <a name="{@component-id}"/>
        <h3>
            <xsl:value-of select="name"/>
        </h3>
        <p>
            <xsl:apply-templates select="description"/>
        </p>
        <p>
            <xsl:value-of select="name"/>
            <xsl:text> uses these parts</xsl:text>
        </p>
        <ul>
            <xsl:for-each select="partref">
                <li>
                    <xsl:apply-templates select="."></xsl:apply-templates>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
        
    <xsl:template match="description">
        <xsl:apply-templates select="*|text()"/>
    </xsl:template>
    
    <xsl:template match="partref">
        <a href="{concat('#', @refid)}">
            <xsl:value-of select="id(@refid)/name"/>
        </a>            
    </xsl:template>
    
    <xsl:template match="part">
        <a name="{@part-id}"/>
        <h3>
            <xsl:value-of select="name"/>
        </h3>
        <p>
            <xsl:apply-templates select="description"/>
        </p>
        <p>
            <xsl:value-of select="name"/>
            <xsl:text> is used in these components:</xsl:text>
        </p>
        <ul>
            <xsl:for-each select="/parts-list/component[partref/@refid=current()/@part-id]">
                <li>
                    <a href="{concat('#', @component-id)}">
                        <xsl:value-of select="name"/>
                    </a>
                </li>
            </xsl:for-each>                    
        </ul>
    </xsl:template>
    
</xsl:stylesheet>