# подключаем нужные либы
import os
import pyodbc
import cgi
import lxml.etree as ET
from datetime import datetime, date, time, timedelta
from ConvertToXml import ConvertToXml


print ('Content-type: text/html\n\n')
print ('<HTML><HEAD><TITLE>ТФОМС Отчёт</TITLE>')
print ('<link rel="stylesheet" href="folder_for_report/css/style.css">')
print ('</HEAD>')
print ('<BODY>')

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
remote_user = os.environ['REMOTE_USER']
sorting_topics = form.getfirst("sorting_topics", "0")
# подлючаемся class конвертации из sql массива в xml
connect_db = pyodbc.connect('DRIVER={SQL Server};SERVER=SED1;DATABASE=DV;Trusted_Connection=yes;')
xml_result = ConvertToXml.sql_row_to_xml("EXEC [dbo].[ddm_report_on_applications_4] @CreationDateTimeMin = '"+calendar_min+"', @CreationDateTimeMax = '"+calendar_max+"', @AccountName = '"+remote_user+"', @sorting_topics = '"+sorting_topics+"';",connect_db)

tree = ET.ElementTree(xml_result)
# выбор xslt
excel_xslt = ET.parse('xslt\\OveralTableExcel.xslt')

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

# кнопка возврата что бы задать новые параметры
print('<input type="button" class="input test" value="Задать новые параметры" onclick="history.back()">')
# ссылка на скачивание файла
print('<a href="folder_for_report/report_tmp/'+filename+'.xls" type="application/file"><button class="test">Скачать отчёт</button></a><br/><br/>')

# выбор xslt
xslt_html = ET.parse('xslt\\TableHtml.xslt')
# формируем таблицу html	
transform_html = ET.XSLT(xslt_html)
newdom_html = transform_html(tree)
print(ET.tounicode(newdom_html, pretty_print=True))


print ('</BODY></HTML>')

