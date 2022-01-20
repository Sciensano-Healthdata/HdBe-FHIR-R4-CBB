<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:loc="urn:local:urn"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!-- This transformation script...
        * requires a name per model/resource    
        * removes .identifier and .version because they are zib specific
        * converts .type to a full url 
        * removes snapshot because diff and snap are similar
        * updates StructureDefinition referenes, by moving them from .profile to .targetProfile and by updating the reference
        * updates ValueSet URLs in StructureDefinitions 
        * removes invalid slicing
        * replaces inline partZibs ContactInformation, AddressInformation and NameInformation with a reference to the respective model
        * removes 'part' in zibs name for easier referencing.
        
        DOES NOT YET DO:
        *update codesystems URL/URI in ValueSets
    -->
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:param name="projectPrefix" select="'HdBe-'"/>
    <xsl:param name="urlBase" select="'https://fhir.healthdata.be/'"/>
        <xsl:param name="urlLogicalModel" select="'StructureDefinition/LogicalModel/'"/>
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
        <xsl:choose>
            <xsl:when test="f:kind/@value = 'logical'">
                <xsl:variable name="id" as="xs:string">
                    <xsl:choose>
                        <xsl:when test="starts-with(f:name/@value, 'Nlzorgpart')">
                            <xsl:value-of select="
                                replace(concat(upper-case(substring(f:name/@value, 1, 1)),
                                substring(f:name/@value, 2)),
                                'Nlzorgpart', $projectPrefix)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="
                                replace(concat(upper-case(substring(f:name/@value, 1, 1)),
                                substring(f:name/@value, 2)),
                                'Nlzorg', $projectPrefix)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>               
                
                <!-- No projectPrefix variable here because it needs to be witouth a '-'. -->
                <xsl:variable name="name" as="xs:string">
                    <xsl:choose>
                        <xsl:when test="starts-with(f:name/@value, 'Nlzorgpart')">
                            <xsl:value-of select=" replace(concat(upper-case(substring(f:name/@value, 1, 1)),
                                substring(f:name/@value, 2)),
                                'Nlzorgpart', 'HdBe')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="
                                replace(concat(upper-case(substring(f:name/@value, 1, 1)),
                                substring(f:name/@value, 2)),
                                'Nlzorg', 'HdBe')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="title" select="replace($id, '-', ' ')" as="xs:string"/>
                <xsl:copy>
                    <xsl:choose>
                        <xsl:when test="f:id or not(f:id)">
                            <id value="{$id}"/>
                        </xsl:when>
                    </xsl:choose>

                    <xsl:apply-templates
                        select="f:meta | f:implicitRules | f:language | f:text | f:contained | f:extension | f:modifierExtension"/>

                    <xsl:choose>
                        <xsl:when test="f:url or not(f:url)">
                            <url value="{$urlBase}{$urlLogicalModel}{$id}"/>
                        </xsl:when>
                    </xsl:choose>
                    <!-- remove zib identifier and version -->
                    <!--<xsl:apply-templates select="f:identifier | f:version"/> -->
                    <xsl:choose>
                        <xsl:when test="starts-with(f:name/@value, 'Nlzorgpart')">
                            <name value="{$name}">
                                <xsl:call-template name="translatationExtension">
                                    <xsl:with-param name="translation"
                                        select="replace(f:name/f:extension/f:extension/f:valueMarkdown/@value, 'nl.zorg.part.', $projectPrefix)"/>
                                </xsl:call-template>
                            </name>
                        </xsl:when>
                        <xsl:otherwise>
                            <name value="{$name}">
                                <xsl:call-template name="translatationExtension">
                                    <xsl:with-param name="translation"
                                        select="replace(f:name/f:extension/f:extension/f:valueMarkdown/@value, 'nl.zorg.', $projectPrefix) "
                                    />
                                </xsl:call-template>
                            </name>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="f:title or not(f:title)">
                            <title value="{$title}"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="f:status or not(f:status)">
                            <status value="draft"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates select="f:experimental | f:date"/>
                    <!-- Add publisher, contact-->
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
                    <xsl:choose>
                        <xsl:when
                            test="f:description and f:description/f:extension/f:extension/f:valueMarkdown">
                            <description>
                                <xsl:attribute name="value"
                                    select="replace(f:description/@value, '&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;', '&#xD;&#xA;')"/>
                                <xsl:call-template name="translatationExtension">
                                    <xsl:with-param name="translation"
                                        select="replace(f:description/f:extension/f:extension/f:valueMarkdown/@value, '&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;', '&#xD;&#xA;')"
                                    />
                                </xsl:call-template>
                            </description>
                        </xsl:when>
                        <xsl:when test="f:description">
                            <description>
                                <xsl:attribute name="value"
                                    select="replace(f:description/@value, '&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;&#xD;&#xA;', '&#xD;&#xA;')"/>
                                <xsl:apply-templates select="f:description/f:extension"/>
                            </description>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="f:copyright or not(f:copyright)">
                            <copyright
                                value="Copyright and related rights waived via CC0, https://creativecommons.org/publicdomain/zero/1.0/. This does not apply to information from third parties, for example a medical terminology system. The implementer alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize third party IP in connection with the specification or otherwise."
                            />
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates select="f:keyword | f:fhirVersion | f:mapping | f:kind"/>
                    <xsl:choose>
                        <xsl:when test="f:abstract or not(f:abstract)">
                            <abstract value="true"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates select="f:context | f:contextInvariant"/>
                    <!-- type needs to be an full URL, so convert it to a full URL. -->
                    <xsl:choose>
                        <xsl:when test="f:type">
                            <xsl:variable name="type" select="f:type/@value"/>
                            <type value="{$urlBase}{$urlLogicalModel}{$type}"/>
                        </xsl:when>
                    </xsl:choose>
                    <!-- For now, turn of snapshots, because diff and snapthots are the same. -->
                    <xsl:apply-templates select="f:baseDefinition | f:derivation | f:differential"/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="no" select="'no logical models found'"></xsl:message>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Remove invalid slicing and inline NameInformation, ContactInformation, AddressInformation and InstructionsForUse.</xd:desc>
    </xd:doc>
    <xsl:template match="f:differential/f:element[f:path[ends-with(@value,'.coding')]] |
        f:differential/f:element[f:path[starts-with(@value,'patient.name_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'patient.contact_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'patient.address_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'contact.name_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'contact.contact_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'contact.address_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'healthcare_provider.contact_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'healthcare_provider.address_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'health_professional.name_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'health_professional.contact_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'health_professional.address_information.')]] |
        f:differential/f:element[f:path[starts-with(@value,'medication_agreement.instructions_for_use.')]] |
        f:differential/f:element[f:path[starts-with(@value,'administration_agreement.instructions_for_use.')]] |
        f:differential/f:element[f:path[starts-with(@value,'medication_use.instructions_for_use.')]] |
        f:differential/f:element[f:path[starts-with(@value,'medication_agreement.instructions_for_use.')]] "> 
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Remove zib definition codes in element.code.</xd:desc>
    </xd:doc>
    <xsl:template match="f:differential/f:element/f:code"> 
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Replace inline BackboneElement of NameInformation with a reference</xd:desc>
    </xd:doc>
    <xsl:template match="f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.0.1.6--20200901000000'] | 
        f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.3.1.4--20200901000000'] |
        f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.17.1.3--20200901000000']">
        <xsl:call-template name="replaceBackBoneElementWithReference">
            <xsl:with-param name="code" select="'HumanName'"/>
        </xsl:call-template>
    </xsl:template>
    <xd:doc>
        <xd:desc>Replace inline BackboneElement of AddressInformation with a reference</xd:desc>
    </xd:doc>
    <xsl:template match="f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.0.1.4--20200901000000'] |
        f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.3.1.5--20200901000000'] |
        f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.17.2.5--20200901000000'] |
        f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.17.1.7--20200901000000']">
        <xsl:call-template name="replaceBackBoneElementWithReference">
            <xsl:with-param name="code" select="'Address'"/>
        </xsl:call-template>
    </xsl:template>
    <xd:doc>
        <xd:desc>Replace inline BackboneElement of ContactInformation with a reference</xd:desc>
    </xd:doc>
    <xsl:template match="f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.0.1.5--20200901000000'] |
        f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.3.1.6--20200901000000'] |
        f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.17.2.6--20200901000000'] |
        f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.17.1.8--20200901000000']">
        <xsl:call-template name="replaceBackBoneElementWithReference">
            <xsl:with-param name="code" select="'ContactPoint'"/>
        </xsl:call-template>
    </xsl:template>    
    <xd:doc>
        <xd:desc>Replace inline BackboneElement of InsturctionForUse with a reference</xd:desc>
    </xd:doc>
    <xsl:template match="f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.9.6.23240--20200901000000'] |
        f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.9.8.22098--20200901000000'] |
        f:differential/f:element[@id = '2.16.840.1.113883.2.4.3.11.60.40.1.9.11.22504--20200901000000'] ">
        <xsl:call-template name="replaceBackBoneElementWithReference">
            <xsl:with-param name="code" select="'Dosage'"/>
        </xsl:call-template>
    </xsl:template>  
    
    
    
    
    <xsl:template name="replaceBackBoneElementWithReference">
        <xsl:param name="code" as="xs:string"/>
        <xsl:copy>
            <xsl:apply-templates select="@*" />
            <xsl:apply-templates select="f:path | f:short | f:definition | f:min | f:max"/>
            <xsl:variable name="zibname" select="f:short/@value"/>
            <type>
                <code value="{$code}"/>
                <profile value="{$urlBase}{$urlLogicalModel}{$projectPrefix}{$zibname}" />
            </type>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Convert ValueSets to HdBe metadata</xd:desc>
    </xd:doc>
    <xsl:template match="f:ValueSet">
        <xsl:copy>
            <xsl:variable name="name" select="replace(concat(upper-case(substring(f:name/@value,1,1)), substring(f:name/@value, 2)),'Codelijst','')"/>   
            
            <xsl:choose>
                <xsl:when test="(f:id or not(f:id)) and ends-with(f:name/@value, 'Codelijst')">
                    <id>
                        <xsl:attribute name="value" select="replace($name,'_','-')"/>
                    </id>
                </xsl:when>
                <xsl:otherwise>
                    <id>
                        <xsl:attribute name="value" select="f:name/@value"/>
                    </id>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="f:meta | f:implicitRules | f:language | f:text | f:contained | f:extension | f:modifierExtension"/>
            <xsl:choose>
                <xsl:when test="f:url or not(f:url)">
                    <url>
                        <xsl:attribute name="value" select="concat($urlBase,$urlValueSet,replace($name,'_','-'))"/>
                    </url>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:identifier | f:version"/> 
            <xsl:choose>
                <xsl:when test="f:name">
                    <name value="{$name}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="f:title or not(f:title)">
                    <title value="{$name}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="f:status or not(f:status)">
                    <status value="draft"/>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:experimental | f:date"/>
            <xsl:choose>
                <xsl:when test="f:publisher or not(f:publisher)">
                    <publisher value="{$publisher}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test=" f:contact or not(f:contact)">
                    <contact>
                        <name value="{$publisher}" />
                        <telecom>
                            <system value="email" />
                            <value value="{$contactEmail}" />
                            <use value="work" />
                        </telecom>
                    </contact>  
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:description | f:immutable"/>
            <xsl:choose>
                <xsl:when test="not(f:copyright)">
                    <copyright value="Copyright and related rights waived via CC0, https://creativecommons.org/publicdomain/zero/1.0/. This does not apply to information from third parties, for example a medical terminology system. The implementer alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize third party IP in connection with the specification or otherwise."/>
                </xsl:when>
                <!-- Sometimes a relevant copyright is stated in the ValueSet. So if a Copyright is present, use the orginal one.-->
                <xsl:otherwise>
                    <xsl:apply-templates select="f:copyright"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="f:compose | f:expansion"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Convert CodeSystems to HdBe metadata.</xd:desc>
    </xd:doc>
    <xsl:template match="f:CodeSystem">
        <xsl:copy>
            <xsl:variable name="name" select="concat(upper-case(substring(f:name/@value,1,1)), substring(f:name/@value, 2))"/>   
            <xsl:choose>
                <xsl:when test="f:id or not(f:id)">
                    <id>
                        <xsl:attribute name="value" select="replace($name,'_','-')"/>
                    </id>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:meta | f:implicitRules | f:language | f:text | f:contained | f:extension | f:modifierExtension"/>
            <xsl:choose>
                <xsl:when test="f:url or not(f:url)">
                    <url>
                        <xsl:attribute name="value" select="concat($urlBase,$urlCodeSystem,replace($name,'_','-'))"/>
                    </url>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:identifier | f:version"/> 
            <xsl:choose>
                <xsl:when test="f:name">
                    <name value="{$name}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="f:title or not(f:title)">
                    <title value="{$name}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="f:status or not(f:status)">
                    <status value="draft"/>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:experimental | f:date"/>
            <xsl:choose>
                <xsl:when test="f:publisher or not(f:publisher)">
                    <publisher value="{$publisher}"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test=" f:contact or not(f:contact)">
                    <contact>
                        <name value="{$publisher}" />
                        <telecom>
                            <system value="email" />
                            <value value="{$contactEmail}" />
                            <use value="work" />
                        </telecom>
                    </contact>  
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:description | f:useContext |f:jurisdiction | f:purpose "/>
            <xsl:choose>
                <xsl:when test="not(f:copyright)">
                    <copyright value="Copyright and related rights waived via CC0, https://creativecommons.org/publicdomain/zero/1.0/. This does not apply to information from third parties, for example a medical terminology system. The implementer alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize third party IP in connection with the specification or otherwise."/>
                </xsl:when>
                <!-- Sometimes a relevant copyright is stated in the ValueSet. So if a Copyright is present, use the orginal one.-->
                <xsl:otherwise>
                    <xsl:apply-templates select="f:copyright"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="f:caseSensitive | f:valueSet | f:hierachyMeaning | f:compositional | f:versionNeeded | f:content | f:supplements | f:count | f:filter | f:property | f:concept"/>
        </xsl:copy>
    </xsl:template>
      
    <xd:doc>
        <xd:desc>Insert the FHIR translation extension that is configured by two parameters.</xd:desc>
        <xd:param name="language">The language, coded conform FHIR, of the translation. Defaults to 'nl-NL'.</xd:param>
        <xd:param name="translation">The translated value.</xd:param>
    </xd:doc>
    <xsl:template name="translatationExtension">
        <xsl:param name="language" as="xs:string" select="'nl-NL'"/>
        <xsl:param name="translation" as="xs:string" select="''"/>
        <extension url="http://hl7.org/fhir/StructureDefinition/translation">
            <extension url="lang">
                <valueCode value="{$language}"/>
            </extension>
            <extension url="content">
                <valueMarkdown value="{$translation}"/>
            </extension>
        </extension>
    </xsl:template> 

    <xd:doc>
        <xd:desc>Template improves .binding.description by using the English name in stead of Dutch based on a hack of using the .short value. Template also converts the valueSet URL to newly assigned URL based on the Dutch ValueSet name.</xd:desc>
    </xd:doc>
    <xsl:template match="f:differential/f:element/f:binding">
                <xsl:variable name="valueSetNameEN" select="replace(../f:short/@value, '_','-')" as="xs:string"/>
                <xsl:variable name="valueSetNameNL" select="replace(f:description/@value,'Codelijst', '')" as="xs:string"/>
                <xsl:copy>
                    <xsl:apply-templates select="f:strength"/>
                    <xsl:choose>
                        <xsl:when test="f:description">
                            <description>
                                <xsl:attribute name="value" select="concat($valueSetNameEN, ' codes')"/>
                            </description>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="f:valueSet">
                            <!-- ValueSet URLs are build based on the Dutch name. There is no EN translation available in ArtDecor and therefore it is also not in in the exprot. -->
                            <valueSet value="{$urlBase}{$urlValueSet}{$valueSetNameNL}"/>
                        </xsl:when>
                    </xsl:choose>            
                </xsl:copy>
            <!--</xsl:for-each>-->    
        <!--</xsl:if>-->
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to move profile reference from .profile to .targetProfile and to convert the reference URL to newly assigned URL based on a hack (the value located in .short is used).</xd:desc>
    </xd:doc>
    <xsl:template match="f:differential/f:element/f:type[f:code[@value='Reference']]"> 
        <xsl:variable name="zibName" select="replace(../f:short/@value, '_','-')"/>
        <xsl:copy>
            <xsl:apply-templates select="f:code"/>
            <xsl:choose>
                <xsl:when test="f:profile">
                    <targetProfile>
                        <xsl:attribute name="value" select="concat($urlBase,$urlLogicalModel,$projectPrefix,$zibName)"/>
                    </targetProfile>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="f:targetProfile"/>
            <xsl:apply-templates select="f:aggregation"/>
            <xsl:apply-templates select="f:versioning"/>
        </xsl:copy>
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
                <xsl:for-each select="$output/f:ValueSet">
                    <xsl:choose>
                        <xsl:when test="string-length(f:id/@value) gt 0">
                            <xsl:result-document href="ValueSet-{./f:id/@value}.xml" indent="yes">
                                <xsl:copy-of select="."/>
                            </xsl:result-document>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="$output/f:CodeSystem">
                    <xsl:choose>
                        <xsl:when test="string-length(f:id/@value) gt 0">
                            <xsl:result-document href="CodeSystem-{./f:id/@value}.xml">
                                <xsl:copy-of select="."/>
                            </xsl:result-document>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>