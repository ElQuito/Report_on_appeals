# -*- coding: utf-8 -*-
print ('Content-type: text/html\n\n')
print ('<HTML><HEAD><TITLE>ТФОМС Отчёт</TITLE>')
print ('<link rel="stylesheet" href="folder_for_report/css/style.css">')
print ('</HEAD>')
print ('<BODY>')
print ('<H2><label style="margin-left:27px; font-size: 25px;">Отчёт по заявкам</label></H2>')
print ("""   <form action="ReportResults.py">
		<label><h3>Укажите период, за который необходимо построить отчет</h3></label><br/>
		<label>C:</label>
		<input class="input" type="date" name="calendar_min">
		<label>ПО:</label>
		<input class="input" type="date" name="calendar_max"><br/><br/>
		<input type="checkbox" name="sorting_topics">
		<label>Группировать по тематикам</label><br/><br/>
        <input style="margin-left:25px;" class="input" type="submit" value="Сформировать">
    </form>""")
print ('</BODY></HTML>')

