<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:loc="urn:local:urn"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
   
    <xsl:param name="projectPrefix" select="'HdBe-'"/>
    <xsl:param name="urlBase" select="'https://fhir.healthdata.be/'"/>
    <xsl:param name="urlSD" select="'StructureDefinition/'"/>
    <xsl:param name="urlValueSet" select="'ValueSet/'"/>
    <xsl:param name="urlCodeSystem" select="'CodeSystem/'"/>
    <xsl:param name="publisher" select="'Healthdata.be (Sciensano)'"/>
    <xsl:param name="contactEmail" select="'fhir.healthdata@sciensano.be'"/>
    <xsl:param name="convertFileNames" select="true()" as="xs:boolean"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="f:StructureDefinition">
        <xsl:copy>
            <xsl:variable name="id" select="replace(concat(substring(f:id/@value,1,1), substring(f:id/@value, 2)),'zib-',$projectPrefix)"/>
            <xsl:variable name="name" select="replace(concat(upper-case(substring(f:name/@value,1,1)), substring(f:name/@value, 2)),'Zib','HdBe')"/>
            <xsl:choose>
                <xsl:when test="f:id">
                    <id value="{$id}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:meta | f:implicitRules | f:language | f:text | f:contained | f:extension | f:modifierExtension"/>
            <xsl:choose>
                <xsl:when test="f:url or not(f:url)">
                    <url value="{$urlBase}{$urlSD}{$id}"/>
                </xsl:when>
            </xsl:choose>
            <!-- Remove identifier and version -->
            <!-- <xsl:apply-templates select="f:identifier | f:version"/> -->
            <xsl:choose>
                <xsl:when test="f:name">
                    <name value="{$name}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="f:title or not(f:url)">
                    <title value="{$name}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="f:status or not(f:status)">
                    <status value="draft"/>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:experimental | f:date"/>
            <!-- Add publisher, contact, description-->
            <xsl:choose>
                <xsl:when test="f:publisher or not(f:publisher)">
                    <publisher value="{$publisher}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="f:contact or not(f:contact)">
                    <contact>
                        <name value="{$publisher}"/>
                        <telecom>
                            <system value="email"/>
                            <value value="{$contactEmail}"/>
                            <use value="work"/>
                        </telecom>
                    </contact>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:description"/>
            <xsl:choose>
                <xsl:when test="f:copyright or not(f:copyright)">
                    <copyright value="Copyright and related rights waived via CC0, https://creativecommons.org/publicdomain/zero/1.0/. This does not apply to information from third parties, for example a medical terminology system. The implementer alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize third party IP in connection with the specification or otherwise."/>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:keyword | f:fhirVersion | f:mapping | f:kind"/>
            <xsl:choose>
                <xsl:when test="f:abstract or not(f:abstract)">
                    <abstract value="false"/>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:type | f:context | f:contextInvariant"/>
            <!-- For now, turn of snapshots because they will not be in the profiles. -->
            <xsl:choose>
                <xsl:when test="starts-with(f:baseDefinition/@value, 'http://nictiz.nl/fhir/')">
                    <baseDefinition>
                        <xsl:attribute name="value" select="replace(f:baseDefinition/@value,'http://nictiz.nl/fhir/StructureDefinition/',concat($urlBase,$urlSD))"/>
                    </baseDefinition>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:baseDefinition"/>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:apply-templates select="f:derivation | f:differential"/>
        </xsl:copy>         
    </xsl:template>
    
    <!-- Replace profile urls with hd's profiles-->
    <xsl:template match="f:element/f:type/f:profile">
        <profile>
            <xsl:attribute name="value" select="replace(@value,'http://nictiz.nl/fhir/StructureDefinition/zib-','https://fhir.healthdata.be/StructureDefinition/HdBe-')"/>
            <xsl:attribute name="value" select="replace(@value,'http://nictiz.nl/fhir/StructureDefinition/ext-','https://fhir.healthdata.be/StructureDefinition/ext-')"/>            
        </profile>
    </xsl:template>
    <xsl:template match="f:element/f:type/f:targetProfile">
        <targetProfile>
            <xsl:attribute name="value" select="replace(@value,'http://nictiz.nl/fhir/StructureDefinition/zib-','https://fhir.healthdata.be/StructureDefinition/HdBe-')"/>
        </targetProfile>
    </xsl:template>
    <xsl:template match="f:element/f:fixedUri">
        <targetProfile>
            <xsl:attribute name="value" select="replace(@value,'http://nictiz.nl/fhir/StructureDefinition/ext-','https://fhir.healthdata.be/StructureDefinition/ext-')"/>
        </targetProfile>
    </xsl:template>   
    
    <xsl:template match="f:element/f:binding/f:valueSet[starts-with(@value, 'http://decor.nictiz.nl/fhir/ValueSet')]">
        <xsl:variable name="valueSetName" select="../../f:alias[1]/@value"/>
        <valueSet>
            <xsl:attribute name="value" select="concat('https://fhir.healthdata.be/ValueSet/',$valueSetName)"/>
        </valueSet>
    </xsl:template>  
    
    <xd:doc>
        <xd:desc>Perform the transformation on input and convert files names, depending on the convertFileNames parameter.</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="output">
            <xsl:apply-templates select="node()"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$convertFileNames">
                <xsl:for-each select="$output/f:StructureDefinition">
                    <xsl:choose>
                        <xsl:when test="string-length(f:id/@value) gt 0">
                            <xsl:result-document href="{./f:id/@value}.xml" indent="yes">
                                <xsl:copy-of select="."/>
                            </xsl:result-document>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    
</xsl:stylesheet>