# This Python file uses the following encoding: utf-8
import codecs
from BeautifulSoup import BeautifulSoup
import re

namefile=codecs.open("namelist_all.csv","r", encoding="utf-8")
namefile_updated=codecs.open("namelist_births_updated.csv","w", encoding="utf-8")
for line in namefile.readlines():
	path="raw_bith_counts/"+line.split(",")[0]+".htm"
	cont=""
	lines=[]
	nostr=""
	try:
		f=codecs.open(path,"r", encoding="utf-8")		
		cont=f.read()
		f.close()
		f=codecs.open(path,"r", encoding="utf-8")		
		lines=f.readlines()
		f.close()
	except:
		raise KeyError(path)
	if cont!="":			
		soup=BeautifulSoup(cont)		
		tag1=soup.find(id="lblCrossQuery")
		if tag1!=None:
			if tag1.string!=None:
				nostr=tag1.string
		if nostr=="":
			for l in lines:
				if "oldalon" in l:
					nostr=l.split(">")[2].split("<")[0]

	else:
		nostr="FNF"
	nostr=nostr.split("tal")[0]
	if "esen" in nostr:
		nostr=nostr.split("esen:")[1]
	if "Nincs" in nostr:
		nostr="0"
#	nostr=nostr.strip()
	nostr="".join(nostr.split())
	updated_line=line.strip()+","+nostr+"\n"
	namefile_updated.write(updated_line)
namefile_updated.close()