import time
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver import ActionChains
import requests
import csv
import json

list_of_products = []

driver = webdriver.Chrome()
url= "https://nrfdatabasen.no/produkter?varegruppe=12836&visningsmodus=1"
driver.maximize_window()
driver.get(url)

time.sleep(10)
content = driver.page_source.encode('utf-8').strip()
nrfData = driver.find_elements(By.CLASS_NAME, "text-secondary")
nameData = driver.find_elements(By.CLASS_NAME, "text-dark")

for nrfDatas, nameDatas in zip(nrfData,nameData):
    product_dict = {}
    product_dict['NRF'] = nrfDatas.text,
    product_dict['Navn'] = nameDatas.text,
    list_of_products.append(product_dict)

json_file = open('products.json', 'w')
json.dump(list_of_products,json_file)
json_file.close()

#page_to_scrape = requests.get("https://nrfdatabasen.no/produkter?varegruppe=12836&visningsmodus=1")
#soup = BeautifulSoup(page_to_scrape.text, "html.parser")
#time.sleep(10)
#a = soup.find("a", attrs={"class":"text-secondary"})

#print(a)    
