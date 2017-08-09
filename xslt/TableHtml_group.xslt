<?xml version="1.0" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="no" omit-xml-declaration="yes" encoding="UTF-8"/>
  <xsl:key name="group1" match="rows" use="RefCategories_Categories_Name"/>
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
  <xsl:template match="rows">
        <tr><td colspan="14">
                <xsl:value-of select="RefCategories_Categories_Name"/>
                <xsl:choose>
                    <xsl:when test = "RefCategories_Categories_Name = '4.01. Об обеспечении полисами ОМС.'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.01. Об обеспечении полисами ОМС.'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.02. Выбор ЛПУ в системе ОМС'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.02. Выбор ЛПУ в системе ОМС'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.03. Выбор врача'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.03. Выбор врача'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.04. Выбор СМО'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.04. Выбор СМО'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.05. Организация работы ЛПУ'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.05. Организация работы ЛПУ'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.06. Санитарно -гигиеническое состояние ЛПУ'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.06. Санитарно -гигиеническое состояние ЛПУ'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.07. Этика и деонтология мед. работников'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.07. Этика и деонтология мед. работников'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.08. КМП'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.08. КМП'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.09. Лекарственное обеспечение'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.09. Лекарственное обеспечение'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.10. Отказ в медицинской помощи'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.10. Отказ в медицинской помощи'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.11. Получение мед. помощи по базовой программе ОМС вне территории страхования'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.11. Получение мед. помощи по базовой программе ОМС вне территории страхования'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.12. Взимание денежных средств за медицинскую помощь по программе ОМС'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.12. Взимание денежных средств за медицинскую помощь по программе ОМС'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.13. Платные медицинские услуги, оказываемые в МО'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.13. Платные медицинские услуги, оказываемые в МО'])"/>)
                    </xsl:when>
                    <xsl:when test = "RefCategories_Categories_Name = '4.14. Другие'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.14. Другие'])"/>)
                    </xsl:when>
					<xsl:when test = "RefCategories_Categories_Name = '4.01.1. Об обеспечении полисами ОМС иностранных граждан, беженцев'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.01.1. Об обеспечении полисами ОМС иностранных граждан, беженцев'])"/>)
                    </xsl:when>
					<xsl:when test = "RefCategories_Categories_Name = '4.12.1. О видах, кач-ве и условиях предосавления мед. помощи по программе ОМС'"> (Всего элементов: <xsl:value-of select="count(//rows[RefCategories_Categories_Name='4.12.1. О видах, кач-ве и условиях предосавления мед. помощи по программе ОМС'])"/>)
                    </xsl:when>
                    <xsl:otherwise>
                        
                    </xsl:otherwise>
                </xsl:choose></td>
        </tr>
        <xsl:for-each select="key('group1',RefCategories_Categories_Name)">
            
       <tr>
        <td style="text-align: center;"><xsl:if test="Reg_number"><xsl:value-of select="Reg_number"/></xsl:if></td>
        <td style="text-align: center;"><xsl:value-of select="Creation_Date_Time"/></td>
		<td style="text-align: center;"><xsl:value-of select="Date_end"/></td>
		<td style="text-align: center;"><xsl:value-of select="Applicant"/></td>
		<td style="text-align: center;"><xsl:if test="Polis_number"><xsl:value-of select="Polis_number"/></xsl:if></td>
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
        
    </xsl:template>
  
  
  
  <xsl:template match="Data">
    <div style="width: 135%">
      <table border="1" width="100%" align="center">
       <tr>
        <th width="4%" >Номер заявки</th>
        <th width="6%" >Дата создания</th>
        <th width="6%" >Дата закрытия</th>
		<th width="7%" >Заявитель</th>
        <th width="9%" >Номер полиса</th>
        <th width="7%" >Территория</th>
        <th width="5%" >Страховая организация</th>
		<th width="5%" >Медицинская организация</th>
		<th width="7%" >Доп. информация</th>
		<th width="7%" >Содержание</th>
		<th width="5%" >Вид обращения</th>
		<th width="5%" >Состояние</th>
		<th width="7%" >Исполнитель</th>
		<th width="7%" >Ход исполнения</th>
       </tr>
<xsl:apply-templates select="rows[generate-id(.) = generate-id(key('group1',RefCategories_Categories_Name))]" />
      </table>
    </div>
  </xsl:template>
</xsl:stylesheet>