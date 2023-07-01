<?xml version="1.0" encoding="UTF-8"?>
<!--Transform the initial file into a new XML file that does not contain product categories (but for each product adds <category> tag).-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="xsi">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <products>
            <xsl:apply-templates select="categories/category/products/product" />
        </products>
    </xsl:template>
    <xsl:template match="product">
        <product>
            <xsl:copy-of select="*"/>
            <category>
                <xsl:value-of select="ancestor::category/@type"/>
            </category>
        </product>
    </xsl:template>
</xsl:stylesheet>