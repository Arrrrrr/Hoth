<?xml version="1.0" encoding="UTF-8"?>
<!-- for-loop.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
    
    <xsl:output method="text"/>
    
    <xsl:param name="i" select="1"/>
    <xsl:param name="increment" select="1"/>
    <xsl:param name="operator" select="'&lt;='"/>
    <xsl:param name="testValue" select="10"/>
    
    <xsl:template match="/">
        <xsl:call-template name="for-loop">
            <xsl:with-param name="i" select="$i"/>
            <xsl:with-param name="increment" select="$increment"/>
            <xsl:with-param name="operator" select="$operator"/>
            <xsl:with-param name="testValue" select="$testValue"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="for-loop">
        <xsl:param name="i"/>
        <xsl:param name="increment"/>
        <xsl:param name="operator"/>
        <xsl:param name="testValue"/>
        
        <xsl:variable name="testPassed">
            <xsl:choose>
                <xsl:when test="$operator = '!='">
                    <xsl:if test="$i != $testValue">
                        <xsl:text>true</xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="$operator = '&lt;='">
                    <xsl:if test="$i &lt;= $testValue">
                        <xsl:text>true</xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="$operator = '&gt;='">
                    <xsl:if test="$i &gt;= $testValue">
                        <xsl:text>true</xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="$operator = '='">
                    <xsl:if test="$i = $testValue">
                        <xsl:text>true</xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="$operator = '&lt;'">
                    <xsl:if test="$i &lt; $testValue">
                        <xsl:text>true</xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="$operator = '&gt;'">
                    <xsl:if test="$i &gt; $testValue">
                        <xsl:text>true</xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message terminate="yes">
                        <xsl:text>i'm the terminanador</xsl:text>
                        <xsl:text>Sorry the for-loop emulator only handles six operators &#xA;</xsl:text>
                        <xsl:text>(&lt; | &gt; | = | &lt;= | &gt;= | !=). </xsl:text>
                        <xsl:text>The value </xsl:text>
                        <xsl:value-of select="$operator"/>
                        <xsl:text>is not allowed.&#xA;</xsl:text>
                    </xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:if test="$testPassed='true'">
            <!-- logic insert begin -->
            <xsl:text>Value of i=</xsl:text>
            <xsl:value-of select="$i"/>
            <xsl:text>&#xA;</xsl:text>
            <!-- logic insert end -->
            <!-- pass the incremented value -->
            <xsl:call-template name="for-loop">
                <xsl:with-param name="i" select="$i + $increment"/>
                <xsl:with-param name="increment" select="$increment"/>
                <xsl:with-param name="operator" select="$operator"/>
                <xsl:with-param name="testValue" select="$testValue"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>