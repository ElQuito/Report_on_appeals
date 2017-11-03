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
  <LastSaved>2017-03-24T08:15:29Z</LastSaved>
  <Company>ФОМС</Company>
  <Version>12.00</Version>
 </DocumentProperties>
 <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
  <AllowPNG/>
 </OfficeDocumentSettings>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <!--<SupBook>
   <Path></Path>
   <SheetName>Таблица 1.1 </SheetName>
   <SheetName>Таблица 1.2</SheetName>
   <Xct>
    <Count>2</Count>
    <SheetIndex>0</SheetIndex>
    <Crn>
     <Row>11</Row>
     <ColFirst>4</ColFirst>
     <ColLast>4</ColLast>
     <Number>0</Number>
    </Crn>
    <Crn>
     <Row>11</Row>
     <ColFirst>7</ColFirst>
     <ColLast>7</ColLast>
     <Number>0</Number>
    </Crn>
   </Xct>
   <Xct>
    <Count>0</Count>
    <SheetIndex>1</SheetIndex>
   </Xct>
   
  </SupBook>-->
  <WindowHeight>7650</WindowHeight>
  <WindowWidth>19320</WindowWidth>
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
  <Style ss:ID="s62" ss:Name="Гиперссылка">
   <Font ss:FontName="Arial" ss:Color="#0000FF" ss:Underline="Single"/>
  </Style>
  <Style ss:ID="m45552084">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552104">
   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552124">
   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:Indent="8" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552144">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552164">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552184">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552532">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552552">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552572">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552592">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552612">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552632">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="m45552652">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s63">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders/>
   <Font ss:FontName="Arial" x:CharSet="204" x:Family="Swiss"/>
   <Interior/>
   <NumberFormat/>
   <Protection ss:Protected="0"/>
  </Style>
  <Style ss:ID="s64">
   <Alignment ss:Vertical="Top"/>
   <Borders/>
   <Font ss:FontName="Arial"/>
   <Interior/>
   <NumberFormat/>
   <Protection ss:Protected="0"/>
  </Style>
  <Style ss:ID="s66" ss:Parent="s62">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders/>
   <Interior/>
   <NumberFormat/>
   <Protection ss:Protected="0"/>
  </Style>
  <Style ss:ID="s68">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders/>
   <Font ss:FontName="Arial" x:CharSet="204" x:Family="Swiss" ss:Bold="1"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s69">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders/>
   <Font ss:FontName="Arial" x:CharSet="204" x:Family="Swiss"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s70">
   <Alignment ss:Vertical="Top"/>
   <Borders/>
   <Font ss:FontName="Arial"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s71">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="Arial" ss:Bold="1" ss:Underline="Single"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s72">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s79">
   <Alignment ss:Horizontal="Left" ss:Vertical="Top" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s93">
   <Alignment ss:Horizontal="Center" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s103">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Arial" x:CharSet="204" x:Family="Swiss"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s104">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"
    ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection x:HideFormula="1"/>
  </Style>
  <Style ss:ID="s105">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"
    ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s106">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"
    ss:Size="11"/>
   <Interior ss:Color="#FFFFCC" ss:Pattern="Solid"/>
   <NumberFormat/>
   <Protection ss:Protected="0"/>
  </Style>
  <Style ss:ID="s107">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"
    ss:Size="11"/>
   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s108">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:Indent="1"
    ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s109">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="Arial" x:CharSet="204" x:Family="Swiss" ss:Bold="1"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s110">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders/>
   <Font ss:FontName="Arial"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s111">
   <Alignment ss:Vertical="Top"/>
   <Borders/>
   <Font ss:FontName="Arial" ss:Color="#0000FF" ss:Underline="Single"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s112">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s127">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" x:Family="Roman"
    ss:Size="11"/>
   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
   <NumberFormat/>
   <Protection x:HideFormula="1"/>
  </Style>
  <Style ss:ID="s128">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:Indent="2"
    ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Times New Roman" x:CharSet="204" ss:Size="11"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Таблица 1.1">
  <Table ss:ExpandedColumnCount="9" ss:ExpandedRowCount="150" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="15">
   <Column ss:AutoFitWidth="0" ss:Width="278.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="30"/>
   <Column ss:AutoFitWidth="0" ss:Width="44.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="45.75"/>
   <Column ss:Index="6" ss:AutoFitWidth="0" ss:Width="44.25" ss:Span="1"/>
   <Column ss:Index="9" ss:AutoFitWidth="0" ss:Width="54.75"/>
   <xsl:for-each select="//NewDataSet/Table">
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s63"><Data ss:Type="String"></Data></Cell>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s66"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:MergeAcross="8" ss:StyleID="s68"><Data ss:Type="String">Таблица 1.1.ОБРАЩЕНИЯ ЗАСТРАХОВАННЫХ ЛИЦ</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s69"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s70"/>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:MergeDown="2" ss:StyleID="m45552084"><Data ss:Type="String">Виды обращений</Data></Cell>
    <Cell ss:MergeDown="2" ss:StyleID="m45552104"><Data ss:Type="String">№ стр.</Data></Cell>
    <Cell ss:MergeAcross="6" ss:StyleID="m45552124"><Data ss:Type="String">Количество поступивших обращений за отчетный период</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:Index="3" ss:MergeAcross="2" ss:StyleID="m45552144"><Data
      ss:Type="String">ТФОМС</Data></Cell>
    <Cell ss:MergeAcross="2" ss:StyleID="m45552164"><Data ss:Type="String">СМО</Data></Cell>
    <Cell ss:MergeDown="1" ss:StyleID="m45552184"><Data ss:Type="String">итого</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:Index="3" ss:StyleID="s93"><Data ss:Type="String">устных</Data></Cell>
    <Cell ss:StyleID="s79"><Data ss:Type="String">письменных</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">всего</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">устных</Data></Cell>
    <Cell ss:StyleID="s79"><Data ss:Type="String">письменных</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">всего</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="Number">1</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">2</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">5</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">6</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">7</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">8</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">9</Data></Cell>
   </Row>   
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">Всего обращений, в том числе:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">1</Data></Cell>
    <Cell ss:StyleID="s104" ss:Formula="=R[3]C+R[16]C+R[34]C"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s104" ss:Formula="=R[3]C+R[4]C+R[16]C+R[33]C"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s104" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[3]C+R[16]C+R[34]C+R[4]C"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[3]C+R[4]C+R[16]C+R[33]C"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   
   
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">   по телефону «горячей линии»</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">1.1</Data></Cell>
	

	<Cell ss:StyleID="s106" ss:Formula="=R[15]C"><Data ss:Type="Number">0</Data></Cell>
	
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[15]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">   по сети «Интернет»</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">1.2</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">Жалобы</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">2</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Complaint"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Complaint_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">Заявлений, всего: в т.ч.:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="All_Zayavy"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="All_Zayavy_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="50.8125">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о выделении средств для оплаты медицинской помощи в рамках территориальной программы государственных гарантий оказания бесплатной медицинской помощи</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.1</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о выборе и замене СМО, в том числе:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.2</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">  о выборе СМО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.2.1</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">  о замене СМО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.2.2</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">ходатайства о регистрации в качестве застрахованного лица</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.3</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">ходатайства об идентификации в качестве застрахованного лица</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.4</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="39.9375">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о выдаче дубликата (переоформлении) полиса ОМС, в том числе:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.5</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">        о переоформлении полиса</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.5.1</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">       о выдаче дубликата полиса</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.5.2</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">другие</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.6</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">в том числе по вопросам, не относящимся к сфере ОМС</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3.6.1</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">X</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">Обращения за консультацией (разъяснением), в том числе:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=SUM(R[1]C,R[2]C:R[5]C,R[7]C:R[17]C)"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=SUM(R[1]C,R[3]C:R[16]C)"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=SUM(R[1]C,R[2]C:R[5]C,R[7]C:R[17]C)"><Data
      ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=SUM(R[1]C,R[2]C:R[5]C,R[7]C:R[17]C)"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=SUM(R[1]C,R[3]C:R[16]C)"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=SUM(R[1]C,R[2]C:R[5]C,R[7]C:R[17]C)"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">об обеспечении полисами ОМС, в т.ч.:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.1</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Policies"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Policies_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s108"><Data ss:Type="String">об обеспечении полисами ОМС иностранных граждан, беженцев</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.1.1</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="PoliciesForeign"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="PoliciesForeign_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о выборе МО в сфере ОМС</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.2</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceMO_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о выборе врача</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.3</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceDoctor"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceDoctor_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о выборе или замене СМО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.4</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceSMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceSMO_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>   
    <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">Об идентификации в качестве застрахованного лица</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.5</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="IdentifiactionInsured"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="IdentifiactionInsured_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">об организации работы МО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.6</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="WorkMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="WorkMO_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о санитарно-гигиеническом состоянии МО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.7</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="StateMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="StateMO_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">об этике и деонтологии медицинских работников</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.9</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="MedicalWorkers"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="MedicalWorkers_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о КМП</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.10</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="KMP"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="KMP_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о лекарственном обеспечении при оказании медицинской помощи</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.11</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="MedicalProvision"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="MedicalProvision_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">об отказе в оказании медицинской помощи по программам ОМС</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.12</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="DeniedMedicalHelp"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="DeniedMedicalHelp_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   
   
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о получении медицинской помощи по базовой программе ОМС вне территории страхования</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.13</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="MedicalCare"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="MedicalCare_SMO"/></Data></Cell>
	<Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о взимании денежных средств за медицинскую помощь по программам ОМС, в том числе:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.14</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="TakingMoney"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="TakingMoney_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s108"><Data ss:Type="String">о видах, качестве и условиях предоставления медицинской помощи по программам ОМС</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.14.1</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="KindQualityCondition"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="KindQualityCondition_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   
   
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">о платных медицинских услугах, оказываемых в МО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.15</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="PaidMedicalServices"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="PaidMedicalServices_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">другие</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.20</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Others"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Others_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">Предложения</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.21</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Offers"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Offers_SMO"/></Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-4]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
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
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>3</ActiveRow>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 
 
 
 <Worksheet ss:Name="Таблица 1.2">
  <Table ss:ExpandedColumnCount="14" ss:ExpandedRowCount="35" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="15">
   <Column ss:AutoFitWidth="0" ss:Width="186.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="32.25"/>
   <xsl:for-each select="//NewDataSet/Table">
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s63"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s109"/>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s63"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s109"/>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:MergeAcross="13" ss:StyleID="s68"><Data ss:Type="String">Таблица 1.2. ЖАЛОБЫ И ИХ ПРИЧИНЫ</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s110"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s111"/>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:MergeDown="2" ss:StyleID="m45552532"><Data ss:Type="String">Причины жалоб</Data></Cell>
    <Cell ss:MergeDown="2" ss:StyleID="m45552552"><Data ss:Type="String">№ стр.</Data></Cell>
    <Cell ss:MergeAcross="11" ss:StyleID="m45552572"><Data ss:Type="String">Количество жалоб за отчетный период, в том числе:</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:Index="3" ss:MergeAcross="2" ss:StyleID="m45552592"><Data
      ss:Type="String">письменных</Data></Cell>
    <Cell ss:MergeAcross="2" ss:StyleID="m45552612"><Data ss:Type="String">устных</Data></Cell>
    <Cell ss:MergeAcross="2" ss:StyleID="m45552632"><Data ss:Type="String">всего</Data></Cell>
    <Cell ss:MergeAcross="2" ss:StyleID="m45552652"><Data ss:Type="String">из них обоснованных</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:Index="3" ss:StyleID="s93"><Data ss:Type="String">ТФОМС</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">СМО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">всего</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">ТФОМС</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">СМО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">всего</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">ТФОМС</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">СМО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">всего</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">ТФОМС</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">СМО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">всего</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s112"><Data ss:Type="String">1</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">2</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">5</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">6</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">7</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">8</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">9</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">10</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">11</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">12</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">13</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">14</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">Поступило жалоб</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">1</Data></Cell>
    <Cell ss:StyleID="s127"
     ss:Formula="='Таблица 1.1'!R[3]C[1]"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s127"
     ss:Formula="='Таблица 1.1'!R[3]C[3]"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s107" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s127"
     ss:Formula="='Таблица 1.1'!R[3]C[-3]"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s127"
     ss:Formula="='Таблица 1.1'!R[3]C[-1]"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"
     ss:Formula="='Таблица 1.1'!R[3]C[-4]"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"
     ss:Formula="='Таблица 1.1'!R[3]C[-2]"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">Причин, указанных в жалобах, всего, в т.ч.:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">2</Data></Cell>
    <Cell ss:StyleID="s105"
     ss:Formula="=R[1]C+R[2]C+R[5]C+R[6]C+R[10]C+R[11]C+R[12]C+R[13]C+R[14]C+R[15]C+R[16]C+R[19]C+R[20]C+R[23]C+R[24]C"><Data
      ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105"
     ss:Formula="=R[1]C+R[2]C+R[5]C+R[6]C+R[10]C+R[11]C+R[12]C+R[13]C+R[14]C+R[15]C+R[16]C+R[19]C+R[20]C+R[23]C+R[24]C"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105"
     ss:Formula="=R[1]C+R[2]C+R[5]C+R[6]C+R[10]C+R[11]C+R[12]C+R[13]C+R[14]C+R[15]C+R[16]C+R[19]C+R[20]C+R[23]C+R[24]C"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"
     ss:Formula="=R[1]C+R[2]C+R[5]C+R[6]C+R[10]C+R[11]C+R[12]C+R[13]C+R[14]C+R[15]C+R[16]C+R[19]C+R[20]C+R[23]C+R[24]C"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105"
     ss:Formula="=R[1]C+R[2]C+R[5]C+R[6]C+R[10]C+R[11]C+R[12]C+R[13]C+R[14]C+R[15]C+R[16]C+R[19]C+R[20]C+R[23]C+R[24]C"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105"
     ss:Formula="=R[1]C+R[2]C+R[5]C+R[6]C+R[10]C+R[11]C+R[12]C+R[13]C+R[14]C+R[15]C+R[16]C+R[19]C+R[20]C+R[23]C+R[24]C"><Data
      ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">обеспечение полисами ОМС</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">3</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Policies_Complaint"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Policies_Complaint_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">выбор МО в сфере ОМС -всего, из них:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="String">на территории страхования</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.1</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceMO_InTerritory"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceMO_InTerritory_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="String">вне территории страхования</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">4.2</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceMO_BeyondTerritory"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceMO_BeyondTerritory_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">выбор врача</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">5</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceDoctor_Complaint"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceDoctor_Complaint_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">выбор или замена СМО, из них:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">6</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C+R[3]C"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C+R[3]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C+R[3]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C+R[3]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C+R[3]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C+R[3]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="String">по постоянному месту жительства</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">6.1</Data></Cell>
	<Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceSMO_Permanent"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceSMO_Permanent_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="String">вне постоянного места жительства</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">6.2</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceSMO_NotPermanent"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceSMO_NotPermanent_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s108"><Data ss:Type="String">без регистрации на территории Российской Федерации</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">6.3</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceSMO_WithoutReg"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="ChoiceSMO_WithoutReg_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">организация работы МО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">7</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="WorkMO_Complaint"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="WorkMO_Complaint_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">санитарно-гигиеническое состояние МО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">8</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="StateMO_Complaint"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="StateMO_Complaint_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">материально-техническое обеспечение МО</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">9</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="TechnicalSupport"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="TechnicalSupport_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">этика и деонтология медицинских работников</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">10</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="MedicalWorkers_Complaint"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="MedicalWorkers_Complaint_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">КМП</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">11</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="KMP_Complaint"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="KMP_Complaint_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">лекарственное обеспечение при оказании медицинской помощи</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">12</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="MedicalProvision_Complaint"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="MedicalProvision_Complaint_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">отказ в медицинской помощи по программам ОМС, всего, из них:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">13</Data></Cell>
    <Cell ss:StyleID="s107" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s107" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s107" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s107" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s107" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s107" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="String">на территории страхования</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">13.1</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="DeniedMedicalHelp_InTerritory"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="DeniedMedicalHelp_InTerritory_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="String">вне территории страхования</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">13.2</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="DeniedMedicalHelp_BeyondTerritory"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="DeniedMedicalHelp_BeyondTerritory_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">неисполнение СМО обязанностей по договору</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">14</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Unfulfilled_Duties"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="Unfulfilled_Duties_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">взимание денежных средств за медицинскую помощь по программам ОМС, всего, из них:</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">15</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=R[1]C+R[2]C"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="String">на территории страхования</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">15.1</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="TakingMoney_InTerritory"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="TakingMoney_InTerritory_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="String">вне территории страхования</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">15.2</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="TakingMoney_BeyondTerritory"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="TakingMoney_BeyondTerritory_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="30">
    <Cell ss:StyleID="s72"><Data ss:Type="String">неправомерное распространение персональных данных</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">16</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="PersonalData"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="PersonalData_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s72"><Data ss:Type="String">прочие причины</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">17</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="OtherResons"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="OtherResons_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s128"><Data ss:Type="String">в том числе по вопросам, не относящимся к сфере ОМС</Data></Cell>
    <Cell ss:StyleID="s93"><Data ss:Type="String">17.1</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="OtherReasons_NotRelated"/></Data></Cell>
	<Cell ss:StyleID="s106"><Data ss:Type="Number"><xsl:value-of select="OtherReasons_NotRelated_SMO"/></Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-6]+RC[-3]"><Data ss:Type="Number">0</Data></Cell>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Error">#VALUE!</Data></Cell>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s106"/>
    <Cell ss:StyleID="s105" ss:Formula="=RC[-2]+RC[-1]"><Data ss:Type="Number">0</Data></Cell>
   </Row>
   </xsl:for-each>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Header x:Margin="0.3"/>
    <Footer x:Margin="0.3"/>
    <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
   </PageSetup>
   <Unsynced/>
   <Print>
    <ValidPrinterInfo/>
    <PaperSizeIndex>9</PaperSizeIndex>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>600</VerticalResolution>
   </Print>
   <TopRowVisible>18</TopRowVisible>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>18</ActiveRow>
     <ActiveCol>3</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>

  </xsl:template>
</xsl:stylesheet>