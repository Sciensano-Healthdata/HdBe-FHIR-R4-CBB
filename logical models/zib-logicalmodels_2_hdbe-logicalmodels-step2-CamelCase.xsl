<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:loc="urn:local:urn"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns:str="http://exslt.org/strings"
    extension-element-prefixes="str"
    xmlns="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
   
    <xsl:param name="convertFileNames" select="true()" as="xs:boolean"/>
   <xsl:param name="modelName" select="substring(f:StructureDefinition/f:id/@value,6)"/>
   
   
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>   
   <!-- needs a filter or in a seperate file for logical models, type of resources should not be changed. -->
   <xsl:template match="f:StructureDefinition/f:type[1]">
      <type>
         <xsl:attribute name="value" select="concat('https://fhir.healthdata.be/StructureDefinition/LogicalModel/',$modelName)"/>        
      </type>  
   </xsl:template>
   
    <xsl:template match="f:differential/f:element">
        <xsl:param name="input" select="@id"/>
        <element>
      
            <xsl:attribute name="id" select="string-join(
                for $part in tokenize($input, '_')
                return concat(
                upper-case(substring($part, 1, 1)),
                substring($part, 2)
                )
                , '')" /> 
            
            <!-- REMOVE f:base because it is not used-->
            <xsl:apply-templates select="f:path | f:short | f:definition | f:alias | f:min | f:max  | f:type | f:binding"/>
        </element>
    </xsl:template>
   
    <xsl:template match="f:differential/f:element/f:path">
        <xsl:param name="input" select="@value"/>
        <path>
            <xsl:attribute name="value" select="string-join(
                for $part in tokenize($input, '_')
                return concat(
                upper-case(substring($part, 1, 1)),
                substring($part, 2)
                )
                , '')" />          
        </path>  
    </xsl:template>
    
    <!-- Needs to get to a seperate file for profiles. -->
<!--   <xsl:template match="f:differential/f:element/f:mapping/f:map">
      <xsl:param name="input" select="@value"/>
      <map>
         <xsl:attribute name="value" select="string-join(
            for $part in tokenize($input, '_')
            return concat(
            upper-case(substring($part, 1, 1)),
            substring($part, 2)
            )
            , '')" />          
      </map>  
   </xsl:template>
-->
</xsl:stylesheet>    
    
    