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
   <xsl:output indent="yes"/>
   <xsl:strip-space elements="*"/>
   <xsl:template match="node()|@*">
      <xsl:copy>
         <xsl:apply-templates select="node()|@*"/>
      </xsl:copy>
   </xsl:template>
   <!-- Rename Zib HealthcareProvider to HealthcareOrganization -->
   <xsl:template match="@value[contains(.,'healthcare_provider')]">
      <xsl:attribute name="value"
                     select="replace(., 'healthcare_provider', 'healthcare_organization')"/>
   </xsl:template>
   <xsl:template match="@value[contains(.,'HealthcareProvider')]">
      <xsl:attribute name="value"
                     select="replace(., 'HealthcareProvider', 'HealthcareOragnization')"/>
   </xsl:template>
   <xsl:template match="@value[contains(.,'Healthcare Provider')]">
      <xsl:attribute name="value"
                     select="replace(., 'Healthcare Provider', 'Healthcare Oragnization')"/>
   </xsl:template>
   <xsl:template match="@id[contains(.,'healthcare_provider')]">
      <xsl:attribute name="value"
                     select="replace(., 'healthcare_provider', 'healthcare_organization')"/>
   </xsl:template>
   <xsl:template match="@id[contains(.,'HealthcareProvider')]">
      <xsl:attribute name="value"
                     select="replace(., 'HealthcareOrganization', 'healthcare_organization')"/>
   </xsl:template>
</xsl:stylesheet>
