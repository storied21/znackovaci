<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>  
    <xsl:template match="mobilni_pohotovost">
           {
            "owners": [
               <xsl:for-each select="//owner[position() != last()]"> {
               "Jmeno":"<xsl:value-of select="zakaznik/z_first_name"/>",
               "Prijmeni":"<xsl:value-of select="zakaznik/z_second_name"/>",
               "Adresa":"<xsl:value-of select="zakaznik/z_address"/>",
               "Zaver":
               <xsl:choose>
                   <xsl:when test="konecne_hodnoceni=1">"Vas telefon je v poradku"
                   },</xsl:when>
                   <xsl:otherwise>"Nutna vymena nekterych dilu"
                   },</xsl:otherwise>
               </xsl:choose> 
               
               </xsl:for-each>
               {
                "Jmeno":"<xsl:value-of select="owner[last()]/zakaznik/z_first_name"/>",
                "Prijmeni":"<xsl:value-of select="owner[last()]/zakaznik/z_second_name"/>",
                "Prijmeni":"<xsl:value-of select="owner[last()]/zakaznik/z_address"/>",
                "Zaver":
                 <xsl:choose>
                   <xsl:when test="owner[last()]/konecne_hodnoceni=1">"Vas telefon je v poradku"
                }</xsl:when>
                   <xsl:otherwise>"Nutna vymena nekterych dilu"
                }
                   </xsl:otherwise>
                 </xsl:choose>
             ]
            }
            
    </xsl:template>
</xsl:stylesheet>
