# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import NoAlertPresentException
import unittest, time, re
import codecs
import time

class Macse(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        self.driver.implicitly_wait(30)
        self.base_url = "http://www.macse.org/"
        self.verificationErrors = []
        self.accept_next_alert = True
    
    def test_macse(self):
        only_jews=True
        driver = self.driver
        driver.get(self.base_url + "/databases/login.aspx?v=log&ReturnUrl=/databases/names/names.aspx")
        driver.find_element_by_id("txtPasswordLogin").clear()
        driver.find_element_by_id("txtPasswordLogin").send_keys("mittanulunkebbol222")
        driver.find_element_by_id("txtEmailLogin").clear()
        driver.find_element_by_id("txtEmailLogin").send_keys("gaspar_attila@ceu-budapest.edu")
        driver.find_element_by_id("btnLogin").click()
        driver.find_element_by_link_text(u"Tovább az adatbázishoz...").click()
        driver.find_element_by_id("rbSpecial").click()

        #read input file
        namefile=codecs.open("missing.csv","r", encoding="utf-8")
        for line in namefile.readlines():
            filename=line.strip().split(",")[0]+".htm"
            name=line.strip().split(",")[1]
            print(filename)
            driver.find_element_by_id("txtNewLastName").clear()
            driver.find_element_by_id("txtNewLastName").send_keys(name)
            if only_jews==True:
                Select(driver.find_element_by_id("ddlReligion")).select_by_visible_text("izraelita")
            driver.find_element_by_id("txtChangeyear1").clear()
            driver.find_element_by_id("txtChangeyear1").send_keys("1867")
            driver.find_element_by_id("txtChangeyear2").clear()
            driver.find_element_by_id("txtChangeyear2").send_keys("1918")
            driver.find_element_by_id("btnSearch").click()
            f=codecs.open(filename, "w", encoding="utf-8")
            f.write(driver.page_source)
            #try:
            #    f.write(driver.find_element_by_css_selector("#dgNames > tbody > tr > td > span").text)
            #except:
            #    f.write(driver.find_element_by_id("lblCrossQuery").text)
            f.close()
            time.sleep(3)
        driver.find_element_by_link_text(u"Kijelentkezéshez kattintson erre a sorra.").click()
    
    def is_element_present(self, how, what):
        try: self.driver.find_element(by=how, value=what)
        except NoSuchElementException, e: return False
        return True
    
    def is_alert_present(self):
        try: self.driver.switch_to_alert()
        except NoAlertPresentException, e: return False
        return True
    
    def close_alert_and_get_its_text(self):
        try:
            alert = self.driver.switch_to_alert()
            alert_text = alert.text
            if self.accept_next_alert:
                alert.accept()
            else:
                alert.dismiss()
            return alert_text
        finally: self.accept_next_alert = True
    
    def tearDown(self):
        self.driver.quit()
        self.assertEqual([], self.verificationErrors)

if __name__ == "__main__":
    unittest.main()
