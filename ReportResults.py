# подключаем нужные либы
import os
import pyodbc
import cgi
import lxml.etree as ET
from datetime import datetime, date, time, timedelta


print ('Content-type: text/html\n\n')
print ('<HTML><HEAD><TITLE>ТФОМС Отчёт</TITLE>')
print ('<link rel="stylesheet" href="folder_for_report/css/style.css">')
print ('</HEAD>')
print ('<BODY>')

# удаляем из темповой папки очёты старше одного дня
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
sorting_topics = form.getfirst("sorting_topics", "off")
date_max = datetime.strptime(calendar_max,"%Y-%m-%d").date() + timedelta(days=+1) # здесь я прибавляю один день для того что бы выборка работала по сегодняшнему дню включительно
# подлючаемся к базе данных
connect_db = pyodbc.connect('DRIVER={SQL Server};SERVER=SED1;DATABASE=DV;Trusted_Connection=yes;')
cursor = connect_db.cursor()

# выполняем хранимую процедуру
cursor.execute("EXEC [dbo].[ddm_report_on_applications] @CreationDateTimeMin = '"+calendar_min+"', @CreationDateTimeMax = '"+date_max.strftime("%Y-%m-%d")+"', @AccountName = '"+remote_user+"';")

# формируем xml по полученным данным
data = ET.Element("Data")
for row in cursor.fetchall():
	rows = ET.SubElement(data, "rows")
	Reg_number = ET.SubElement(rows, "Reg_number")
	Reg_number.text = row.Reg_number
	Creation_Date_Time = ET.SubElement(rows, "Creation_Date_Time")
	Creation_Date_Time.text = row.Creation_Date_Time
	Date_end = ET.SubElement(rows, "Date_end")
	Date_end.text = row.Date_end
	Applicant = ET.SubElement(rows, "Applicant")
	Applicant.text = row.Applicant
	RefCategories_Categories_Name = ET.SubElement(rows, "RefCategories_Categories_Name")
	RefCategories_Categories_Name.text = row.RefCategories_Categories_Name
	Polis_number = ET.SubElement(rows, "Polis_number")
	Polis_number.text = row.Polis_number
	Territory = ET.SubElement(rows, "Territory")
	Territory.text = row.Territory
	Insurance_agency = ET.SubElement(rows, "Insurance_agency")
	Insurance_agency.text = row.Insurance_agency
	Medical_organization = ET.SubElement(rows, "Medical_organization")
	Medical_organization.text = row.Medical_organization
	Additional_Information = ET.SubElement(rows, "Additional_Information")
	Additional_Information.text = row.Additional_Information
	Content = ET.SubElement(rows, "Content")
	Content.text = row.Content
	Kind_of_treatment = ET.SubElement(rows, "Kind_of_treatment")
	Kind_of_treatment.text = row.Kind_of_treatment
	Application_state = ET.SubElement(rows, "Application_state")
	Application_state.text = row.Application_state
	Executor = ET.SubElement(rows, "Executor")
	Executor.text = row.Executor
	Comment_user = ET.SubElement(rows, "Comment_user")
	Comment_user.text = row.Comment_user

tree = ET.ElementTree(data)

# выбор xslt с группировкой или нет
if sorting_topics == 'on':
	xslt = ET.parse('xslt\\OveralTableExcel_group.xslt')
else:
	xslt = ET.parse('xslt\\OveralTableExcel.xslt')
# формируем excel и сохраняем
transform = ET.XSLT(xslt)
newdom = transform(tree)
filename = 'report_'+datetime.now().strftime("%Y-%m-%d_%H_%M_%S.%f")
f = open('folder_for_report\\report_tmp\\'+filename+'.xls', 'w',encoding="utf-8")
f.write('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+ET.tounicode(newdom))		
f.flush()
f.close()

# можно раскомментировать блок и посмотреть какой xml формируется
"""
tt = open('xslt\\test.xml', 'w',encoding="utf-8")
tt.write('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+ET.tounicode(tree))		
tt.flush()
tt.close()
"""
# кнопка возврата что бы задать новые параметры
print('<input type="button" class="input test" value="Задать новые параметры" onclick="history.back()">')
# ссылка на скачивание файла
print('<a href="folder_for_report/report_tmp/'+filename+'.xls" type="application/file"><button class="test">Скачать отчёт</button></a><br/><br/>')

# выбор xslt с группировкой или нет для вывода html
if sorting_topics == 'on':
	xslt_html = ET.parse('xslt\\TableHtml_group.xslt')
else:
	xslt_html = ET.parse('xslt\\TableHtml.xslt')
# формируем таблицу html	
transform_html = ET.XSLT(xslt_html)
newdom_html = transform_html(tree)
print(ET.tounicode(newdom_html, pretty_print=True))


print ('</BODY></HTML>')

