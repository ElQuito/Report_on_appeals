<?xml version="1.0" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="no" omit-xml-declaration="yes" encoding="UTF-8"/>
  <xsl:template name="replace" match="text()" mode="replace">
    <xsl:param name="str" select="."/>
    <!--xsl:param name="search-for" select="'&#xA;'"/-->
    <xsl:param name="search-for" select="'#TPFS#'"/>
    <xsl:param name="replace-with">
      <br />
    </xsl:param>
    <xsl:choose>
      <xsl:when test="contains($str, $search-for)">
        <xsl:value-of select="substring-before($str, $search-for)"/>
        <xsl:copy-of select="$replace-with"/>
        <xsl:call-template name="replace">
          <xsl:with-param name="str" select="substring-after($str, $search-for)"/>
          <xsl:with-param name="search-for" select="$search-for"/>
          <xsl:with-param name="replace-with" select="$replace-with"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$str"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="/">
    <div style="width: 135%">
      <table border="1" width="100%" align="center">
       <tr>
        <th width="4%" >Номер заявки</th>
        <th width="6%" >Дата создания</th>
        <th width="6%" >Дата закрытия</th>
		<th width="7%" >Заявитель</th>
        <th width="7%" >Тематика</th>
        <th width="9%">Номер полиса</th>
        <th width="5%" >Территория</th>
        <th width="5%" >Страховая организация</th>
		<th width="6%" >Медицинская организация</th>
		<th width="7%" >Доп. информация</th>
		<th width="7%" >Содержание</th>
		<th width="5%" >Вид обращения</th>
		<th width="5%" >Состояние</th>
		<th width="7%" >Исполнитель</th>
		<th width="7%" >Ход исполнения</th>
       </tr>
       <xsl:for-each select="//rows">
       <tr>
        <td style="text-align: center;"><xsl:value-of select="Reg_number"/></td>
        <td style="text-align: center;"><xsl:value-of select="Creation_Date_Time"/></td>
		<td style="text-align: center;"><xsl:value-of select="Date_end"/></td>
		<td style="text-align: center;"><xsl:value-of select="Applicant"/></td>
		<td style="text-align: center;"><xsl:value-of select="RefCategories_Categories_Name"/></td>
		<td style="text-align: center;"><xsl:value-of select="Polis_number"/></td>
		<td style="text-align: center;"><xsl:value-of select="Territory"/></td>
		<td style="text-align: center;"><xsl:value-of select="Insurance_agency"/></td>
		<td style="text-align: center;"><xsl:value-of select="Medical_organization"/></td>
		<td style="text-align: center;"><xsl:value-of select="Additional_Information"/></td>
		<td style="text-align: left;"><xsl:value-of select="Content"/></td>
		<td style="text-align: center;"><xsl:value-of select="Kind_of_treatment"/></td>
		<td style="text-align: center;"><xsl:value-of select="Application_state"/></td>
		<td style="text-align: center;"><xsl:value-of select="Executor"/></td>
		<td style="text-align: center;"><xsl:call-template name="replace"><xsl:with-param name="str" select="Comment_user"/></xsl:call-template></td>
       </tr>
       </xsl:for-each>
      </table>
    </div>
  </xsl:template>
</xsl:stylesheet>