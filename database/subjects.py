from selenium import webdriver
from selenium.webdriver.common.by import By

def get_subjects(year): # year - year in which academic year starts
    browser = webdriver.Chrome()
    subjects_lists = ['https://usosweb.uni.wroc.pl/kontroler.php?_action=katalog2/przedmioty/szukajPrzedmiotu&cp_showDescriptions=0&cp_showGroupsColumn=0&cp_cdydsDisplayLevel=2&f_tylkoWRejestracji=0&f_obcojezyczne=0&method=faculty_organized&kierujNaPlanyGrupy=&pattern=&jed_org_kod=24&tab95b5_offset=0&tab95b5_limit=30&tab95b5_order=2a1a']
    i = 30
    while i <= 360:
        subjects_lists.append('https://usosweb.uni.wroc.pl/kontroler.php?_action=katalog2/przedmioty/szukajPrzedmiotu&cp_showDescriptions=0&cp_showGroupsColumn=0&cp_cdydsDisplayLevel=2&f_tylkoWRejestracji=0&f_obcojezyczne=0&method=faculty_organized&kierujNaPlanyGrupy=&pattern=&jed_org_kod=24&tab95b5_offset=0&tab95b5_limit=30&tab95b5_order=2a1a&tabe9ae_offset='+str(i)+'&tabe9ae_limit=30&tabe9ae_order=2a1a')
        i += 30

    links = []
    for list in subjects_lists:
        browser.get(list)
        web_elements = browser.find_elements(By.XPATH, '//usos-link/a')
        for element in web_elements:
            link = element.get_attribute('href')
            links.append(link)
    subjects = []

    for link in links:
        browser.get(link)
        subject = []
        data = browser.find_elements(
            By.XPATH, '//usos-frame[contains(@style,"clear: right; width: fit-content;")]/div[@class="hide-borders"]/table/tbody[@class="autostrong"]/tr/td[not(@class="strong")]')
        for i, element in enumerate(data):
            if i < 6:
                if i == 1 or i == 4:
                    pass
                elif i == 5:
                    subject.append(element.text.split('\n')[0])
                else:
                    subject.append(element.text)
            else:
                break
        tmp = browser.find_elements(
            By.XPATH, '//usos-frame/div/table/tbody/tr/td/div/usos-link/a')
        classes_links = []
        for element in tmp:
            link = element.get_attribute('href')
            classes_links.append(link)
        classes_links = classes_links[-3:]
        usos_year = ''
        current_year = str(year) + '/' + str(year + 1)[-2:]
        for class_link in classes_links:
            browser.get(class_link)
            year_data = browser.find_elements(By.XPATH, '//main/div/div/h1/span')
            usos_year = year_data[1].text

            class_data = []
            if usos_year[-7:] == current_year:
                if usos_year not in subject:
                    subject.append(usos_year)
                class_type = browser.find_elements(By.XPATH, '//main/div/div/h1')
                class_type = class_type[0].text.split(' ')[-4]
                class_data.append(class_type)
                class_term = browser.find_elements(By.XPATH, '//div[@class="usos-ui"]/table[@class="grey"]/tbody/tr/td')

                for i in range(0,len(class_term)):
                    if not i % 5 == 0 and not i % 5 == 4 and not i % 5 == 3:
                        class_term_text = class_term[i].text
                        class_term_text = class_term_text.split('\n')[0]
                        class_data.append(class_term_text)
                subject.append(class_data)

        if len(subject) >= 6:
            subjects.append(subject)


    return subjects

"""
subject:
    [0] - USOS code
    [1] - name
    [2] - faculty
    [3] - ECTS
    [4] - semester (winter/summer) and year
    [5] - classes

class:
    [0] - type
    [1] - term (day, time) + room + lecturer
"""

f = open("subjects.txt", "w", encoding="utf-8")
f.write(str(get_subjects(2022)))
f.close()