# подключаем нужные либы
import os
import pyodbc
import cgi
import lxml.etree as ET
from lxml import etree
from datetime import datetime, date, time, timedelta
import time
from ConvertToXml import ConvertToXml

print ('Content-type: text/html\n\n')
print ('<HTML><HEAD><TITLE>ТФОМС Отчёт</TITLE>')
print ('<link rel="stylesheet" href="folder_for_report/css/style.css">')

print('<label><h3>Скачивание отчета...</h3></label>')
print('<label><h5>Вы будете перенаправлены на предыдущую страницу через несколько секунд</h5></label><br/>')
#удаляем из темповой папки очёты старше одного дня
fileList = []
for root, subFolders, files in os.walk('folder_for_report\\report_tmp'):
	for file in files:
		fileList.append(os.path.join(root,file))
for file in fileList:
	dmodify = datetime.fromtimestamp(os.path.getmtime(file))
	days_diff = (datetime.now()-dmodify).days
	if days_diff > 1 :
		os.remove(file)

# получаем post даныые
date_max_default = datetime.now() + timedelta(days=+1)
form = cgi.FieldStorage()
calendar_min = form.getfirst("calendar_min", '2016-01-01')
calendar_max = form.getfirst("calendar_max", date_max_default.strftime("%Y-%m-%d"))
# подлючаемся class конвертации из sql массива в xml
connect_db = pyodbc.connect('DRIVER={SQL Server};SERVER=SED1;DATABASE=DV;Trusted_Connection=yes;')
xml_result = ConvertToXml.sql_row_to_xml("EXEC [dbo].[ddm_report_on_applications_3] @calendar_min = '"+calendar_min+"', @calendar_max = '"+calendar_max+"';",connect_db)

tree = ET.ElementTree(xml_result)

excel_xslt = ET.parse('xslt\\OveralTableExcel_2.xslt')
# формируем excel и сохраняем
transform = ET.XSLT(excel_xslt)
newdom_excel = transform(tree)

filename = 'report_'+datetime.now().strftime("%Y-%m-%d_%H_%M_%S.%f")
f = open('folder_for_report\\report_tmp\\'+filename+'.xls', 'w',encoding="utf-8")
f.write('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+ET.tounicode(newdom_excel))		
f.flush()
f.close()

# можно раскомментировать блок и посмотреть какой xml формируется

#tt = open('xslt\\test.xml', 'w',encoding="utf-8")
#tt.write('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+ET.tounicode(tree))		
#tt.flush()
#tt.close()

# автоматическое скачивание файла
print('<meta http-equiv="refresh" content="0;url=folder_for_report/report_tmp/'+filename+'.xls"/>')
print ('</HEAD>')
print ('<BODY>')

#возвращаемся назад с задержкой
print ("""  
<script>
window.onload = function(){
	setTimeout('window.history.back()', 3000);
};
</script>
""")
print ('</BODY></HTML>')
