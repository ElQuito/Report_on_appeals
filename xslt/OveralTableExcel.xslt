<?xml version="1.0" standalone="yes"?>
<xsl:stylesheet version="1.0" 
xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:u1="http://schemas.microsoft.com/office/word/2003/wordml" 
xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint" 
xmlns:wsp="http://schemas.microsoft.com/office/word/2003/wordml/sp2" 
xmlns="urn:schemas-microsoft-com:office:spreadsheet" 
xmlns:o="urn:schemas-microsoft-com:office:office" 
xmlns:x="urn:schemas-microsoft-com:office:excel" 
xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" 
xmlns:html="http://www.w3.org/TR/REC-html40">
  <xsl:output indent="no" omit-xml-declaration="yes" encoding="UTF-8"/>
  <xsl:template name="replace" match="text()" mode="replace">
    <xsl:param name="str" select="."/>
    <xsl:param name="search-for" select="'#TPFS#'"/>
    <xsl:param name="replace-with"><xsl:text disable-output-escaping="yes"><![CDATA[&#10;]]></xsl:text></xsl:param>
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
  <?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40"
 xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 xmlns:u1="http://schemas.microsoft.com/office/word/2003/wordml"
 xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint"
 xmlns:wsp="http://schemas.microsoft.com/office/word/2003/wordml/sp2">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Author>ФОМС</Author>
  <LastAuthor>ФОМС</LastAuthor>
  <LastPrinted>2015-08-24T14:57:17Z</LastPrinted>
  <Created>2015-08-24T14:48:56Z</Created>
  <LastSaved>2015-08-24T15:01:27Z</LastSaved>
  <Company>ФОМС</Company>
  <Version>16.00</Version>
 </DocumentProperties>
 <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
  <AllowPNG/>
 </OfficeDocumentSettings>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>6950</WindowHeight>
  <WindowWidth>19200</WindowWidth>
  <WindowTopX>0</WindowTopX>
  <WindowTopY>0</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Calibri" x:CharSet="204" x:Family="Swiss" ss:Size="11"
    ss:Color="#000000"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s62">
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"
    ss:Color="#000000"/>
  </Style>
  <Style ss:ID="s63">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:Indent="2"
    ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="2"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"
    ss:Color="#000000" ss:Bold="1"/>
   <Interior ss:Color="#D9D9D9" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s64">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="2"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"
    ss:Color="#000000" ss:Bold="1"/>
   <Interior ss:Color="#D9D9D9" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s65">
   <Font ss:FontName="Calibri" x:CharSet="204" x:Family="Swiss" ss:Color="#000000"/>
  </Style>
  <Style ss:ID="s66">
   <Alignment ss:Horizontal="Justify" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="2"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s67">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="2"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"/>
  </Style>  
  <Style ss:ID="s671">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="2"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"/>
  </Style>
    <Style ss:ID="s71">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="2"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"/>
  </Style>
  <Style ss:ID="s68">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="2"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"/>
   <NumberFormat ss:Format="#,##0"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Отчет по заявкам">
  <Table ss:ExpandedColumnCount="15"  x:FullColumns="1"   x:FullRows="1" ss:DefaultRowHeight="15">
   <Column ss:AutoFitWidth="0" ss:Width="65.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="72.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="75.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="81"/>
   <Column ss:AutoFitWidth="0" ss:Width="77"/>
   <Column ss:AutoFitWidth="0" ss:Width="108"/>
   <Column ss:AutoFitWidth="0" ss:Width="74"/>
   <Column ss:AutoFitWidth="0" ss:Width="74"/>
   <Column ss:AutoFitWidth="0" ss:Width="74"/>
   <Column ss:AutoFitWidth="0" ss:Width="74"/>
   <Column ss:AutoFitWidth="0" ss:Width="432"/>
   <Column ss:AutoFitWidth="0" ss:Width="71"/>
   <Column ss:AutoFitWidth="0" ss:Width="64.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="77"/>
   <Column ss:AutoFitWidth="0" ss:Width="560.25"/>
   <Row ss:AutoFitHeight="0" ss:Height="26.25" ss:StyleID="s62">
    <Cell ss:StyleID="s63"><Data ss:Type="String">Номер завки</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Дата создания</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Дата закрытия</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Тематика</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">ФИО заявителя</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Номер полиса</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Территория</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Страховая организация</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Медицинская организация</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Доп. Информация</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Содержание</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Вид обращения</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Состояние</Data></Cell>
	<Cell ss:StyleID="s64"><Data ss:Type="String">Исполнитель</Data></Cell>
    <Cell ss:StyleID="s64"><Data ss:Type="String">Ход исполнения</Data></Cell>
   </Row>
      <xsl:for-each select="//rows">
   <Row ss:AutoFitHeight="1" ss:Height="45" ss:StyleID="s65">
    <Cell ss:StyleID="s66"><Data ss:Type="String"><xsl:value-of select="Reg_number"/></Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="Creation_Date_Time"/></Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="Date_end"/></Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="RefCategories_Categories_Name"/></Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="Applicant"/></Data></Cell>
    <Cell ss:StyleID="s68"><Data ss:Type="String"><xsl:value-of select="Polis_number"/></Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="Territory"/></Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="Insurance_agency"/></Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="Medical_organization"/></Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="Additional_Information"/></Data></Cell>
    <Cell ss:StyleID="s671"><Data ss:Type="String"><xsl:value-of select="Content"/></Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="Kind_of_treatment"/></Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="Application_state"/></Data></Cell>
	<Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="Executor"/></Data></Cell>
    <Cell ss:StyleID="s71"><Data ss:Type="String"><xsl:call-template name="replace"><xsl:with-param name="str" select="Comment_user"/></xsl:call-template></Data></Cell>
   </Row>
   </xsl:for-each>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Layout x:Orientation="Landscape"/>
    <Header x:Margin="0.3"/>
    <Footer x:Margin="0.3"/>
    <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
   </PageSetup>
   <Unsynced/>
   <Print>
    <ValidPrinterInfo/>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>600</VerticalResolution>
   </Print>
   <Selected/>
   <LeftColumnVisible>3</LeftColumnVisible>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>2</ActiveRow>
     <ActiveCol>4</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>  
  </xsl:template>
</xsl:stylesheet>