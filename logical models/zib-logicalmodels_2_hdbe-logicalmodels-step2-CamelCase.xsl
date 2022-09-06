<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:loc="urn:local:urn"
                xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
                xmlns:f="http://hl7.org/fhir"
                xmlns:str="http://exslt.org/strings"
                xmlns="http://hl7.org/fhir"
                extension-element-prefixes="str"
                exclude-result-prefixes="#all"
                version="2.0">
   <xsl:variable name="input" select="collection('../logical_models/?select=*.xml')"/>
   <xsl:param name="convertFileNames" select="true()" as="xs:boolean"/>
   <xsl:param name="modelName"
              select="substring(f:StructureDefinition/f:id/@value,6)"/>
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
         <xsl:attribute name="value"
                        select="concat('https://fhir.healthdata.be/StructureDefinition/LogicalModel/',$modelName)"/>
      </type>
   </xsl:template>
   <xsl:template match="f:differential/f:element">
      <xsl:param name="input" select="@id"/>
      <xsl:variable name="CamelCased"
                    select="string-join(             for $part in tokenize($input, '_')             return concat(             upper-case(substring($part, 1, 1)),             substring($part, 2)             )             , '')"/>
      <element>
         <xsl:attribute name="id"
                        select="string-join(                 for $part in tokenize($CamelCased, '\.')                 return concat(                 upper-case(substring($part, 1, 1)),                 substring($part, 2)                 )                 , '.') "/>
         <!-- REMOVE f:base because it is not used-->
         <xsl:apply-templates select="f:path | f:representation | f:sliceName | f:sliceIsConstraining | f:label | f:code | f:slicing | f:short | f:definition | f:comment | f:requirements | f:alias | f:min | f:max | f:contentReference| f:type | f:defaultValue[x] | f:meaningWhenMissing | f:meaningWhenMissing | f:fixed[x] | f:pattern[x]| f:example | f:minValue[x] | f:maxValue[x] | f:maxLenght | f:condition | f:constraint | f:mustSupport| f:isModifier| f:isModifierReason | f:isSummary | f:binding | f:mapping"/>
      </element>
   </xsl:template>
   <xsl:template match="f:differential/f:element/f:path">
      <xsl:param name="input" select="@value"/>
      <xsl:variable name="CamelCased"
                    select="string-join(             for $part in tokenize($input, '_')             return concat(             upper-case(substring($part, 1, 1)),             substring($part, 2)             )             , '')"/>
      <path>
         <xsl:attribute name="value"
                        select="string-join(                 for $part in tokenize($CamelCased, '\.')                 return concat(                 upper-case(substring($part, 1, 1)),                 substring($part, 2)                 )                 , '.') "/>
      </path>
   </xsl:template>
</xsl:stylesheet>
