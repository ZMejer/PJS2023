import mysql.connector
import ast
import re

def insert(filename):
    with open(filename, 'r', encoding='utf-8') as file:
        content = file.read()
    subjects = ast.literal_eval(content)
    for subject in subjects:
        subject_data = subject[0:4]
        terms_data = subject[5:]
        for term_data in terms_data:
            type = term_data[0]
            terms = []
            for i in range(1,len(term_data),2):
                terms.append(term_data[i:i+2])
            for term in terms:
                db_semester = re.findall("E[0-9]", subject_data[0])
                db_semester = db_semester[0].replace("E", "") if db_semester else ""
                db_field = (re.findall(r"(?<=-).*?(?=-)", subject_data[0]))[0] if re.findall(r"(?<=-).*?(?=-)", subject_data[0]) else ""
                if str(db_field) == "ISSP":
                    db_field = 9
                elif str(db_field) == "FZ":
                    db_field = 7
                elif str(db_field) == "AS":
                    db_field = 8
                else:
                    db_field = 0
                db_subject = subject_data[1]
                tmp = term[0].split(" ")
                db_day = tmp[1][0:-1] if len(tmp) > 1 else ""
                if db_day == "wtorek":
                    db_day = 2
                elif db_day == "środa":
                    db_day = 3
                elif db_day == "czwartek":
                    db_day = 4
                elif db_day == "piątek":
                    db_day = 5
                elif db_day == "poniedziałek":
                    db_day = 1
                else:
                    db_day = 0
                db_beginning = re.findall(r"(\d+:\d+)(?=\s-)", term[0])[0] if re.findall(r"(\d+:\d+)(?=\s-)", term[0]) else ""
                db_end = re.findall(r"(?<=-\s)(\d+:\d+)", term[0])[0] if re.findall(r"(?<=-\s)(\d+:\d+)", term[0]) else ""
                db_lecturer = term[1]
                db_type = type[1:-1]
                if db_type == "WYK" or db_type == "WYK-EGZ" or db_type == "WYK-MON":
                    db_type = "lecture"
                elif db_type == "LAB" or db_type == "LAB-KOMP":
                    db_type = "labolatories"
                elif db_type == "PRAC":
                    db_type = "labolatories"
                elif db_type == "KONW":
                    db_type = "seminar"
                elif db_type == "CW" or db_type == "SEM":
                    db_type = "seminar"
                else:
                    db_type = ""
                print("Semester: " + str(db_semester))
                print("Subject: " + db_subject)
                print("Field: " + str(db_field))
                print("Day: " + str(db_day))
                print("Beginning: " + str(db_beginning))
                print("End: " + str(db_end))
                print("Lecturer: " + db_lecturer)
                print("Type: " + db_type)
                print("--------------------")
                if (db_semester != "" and db_field != 0 and db_subject != "" and db_day != 0 and db_beginning != "" and db_end != "" and db_lecturer != "" and db_type != ""):
                    try:
                        connection = mysql.connector.connect(host='localhost', database='timetables', user='root', password='')
                        sql = "INSERT INTO schedules (subject, field_of_study_id, semester, day, beginning_time, end_time, lecturer, type) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
                        val = (db_subject, db_field, db_semester, db_day, db_beginning, db_end, db_lecturer, db_type)
                        cursor = connection.cursor()
                        cursor.execute(sql, val)
                        connection.commit()
                        print(cursor.rowcount, "record inserted.")
                    except mysql.connector.Error as error:
                        print("Failed to insert record into schedules table {}".format(error))



insert('subjects.txt')