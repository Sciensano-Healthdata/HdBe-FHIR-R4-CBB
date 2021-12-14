<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:loc="urn:local:urn"
    xmlns:f="http://hl7.org/fhir"
    xmlns="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:param name="baseURLLogical" select="'https://fhir.healthdata.be/StructureDefinition/'"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="f:StructureDefinition">
        <xsl:copy>
            <xsl:variable name="id" select="replace(concat(substring(f:id/@value,1,1), substring(f:id/@value, 2)),'zib-','HdBe-')"/>
            <xsl:variable name="name" select="replace(concat(upper-case(substring(f:name/@value,1,1)), substring(f:name/@value, 2)),'Zib','Hd')"/>
            <xsl:variable name="title" select="replace($id,'HdBe-','HD ')"/>   
            <xsl:apply-templates select="f:meta | f:implicitRules | f:language | f:text | f:contained | f:extension | f:modifierExtension"/>
            <xsl:choose>
                <xsl:when test="f:id">
                    <id value="{$id}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="f:url or not(f:url)">
                    <url value="{$baseURLLogical}{$id}"/>
                </xsl:when>
            </xsl:choose>
            <!-- Remove identifier and version -->
            <!-- <xsl:apply-templates select="f:identifier | f:version"/> -->
            <xsl:choose>
                <xsl:when test="f:name">
                    <name value="{$name}">
                        <xsl:apply-templates select="f:name/f:extension"/>
                    </name>                 
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="f:title">
                    <title value="{$title}"/>
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
                    <publisher value="Healthdata.be"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test=" f:contact or not(f:contact)">
                    <contact>
                        <name value="Healthdata.be" />
                        <telecom>
                            <system value="email" />
                            <value value="info@healthdata.be" />
                            <use value="work" />
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
            <!-- For now, turn of snapshots, because diff and snapthots are the same. -->
            <xsl:apply-templates select="f:baseDefinition | f:derivation | f:differential"/>
        </xsl:copy>         
    </xsl:template>
    
    <!-- Replace profile urls with hd's profiles-->
    <xsl:template match="f:element/f:type/f:profile">
        <profile>
            <xsl:attribute name="value" select="replace(@value,'http://nictiz.nl/fhir/StructureDefinition/zib-','https://fhir.healthdata.be/StructureDefinition/HdBe-')"/>
        </profile>
    </xsl:template>
    <xsl:template match="f:element/f:type/f:targetProfile">
        <targetprofile>
            <xsl:attribute name="value" select="replace(@value,'http://nictiz.nl/fhir/StructureDefinition/zib-','https://fhir.healthdata.be/StructureDefinition/HdBe-')"/>
        </targetprofile>
    </xsl:template>
    <xsl:template match="f:element/f:fixedUri">
        <targetprofile>
            <xsl:attribute name="value" select="replace(@value,'http://nictiz.nl/fhir/StructureDefinition/ext-','https://fhir.healthdata.be/StructureDefinition/ext-')"/>
        </targetprofile>
    </xsl:template>   
</xsl:stylesheet>