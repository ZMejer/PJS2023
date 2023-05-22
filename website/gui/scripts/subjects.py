from selenium import webdriver
from selenium.webdriver.common.by import By

browser = webdriver.Chrome()
browser.get('https://usosweb.uni.wroc.pl/kontroler.php?_action=katalog2/przedmioty/szukajPrzedmiotu&cp_showDescriptions=0&cp_showGroupsColumn=0&cp_cdydsDisplayLevel=2&f_tylkoWRejestracji=0&f_obcojezyczne=0&method=faculty_organized&kierujNaPlanyGrupy=&pattern=&jed_org_kod=24&tab95b5_offset=0&tab95b5_limit=30&tab95b5_order=2a1a')

web_elements = browser.find_elements(By.XPATH, '//usos-link/a')

subject_links = []
for element in web_elements:
    link = element.get_attribute('href')
    subject_links.append(link)

print(subject_links)