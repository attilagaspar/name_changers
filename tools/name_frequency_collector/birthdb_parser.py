# This Python file uses the following encoding: utf-8
import codecs
from BeautifulSoup import BeautifulSoup
import re

namefile=codecs.open("namelist_all.csv","r", encoding="utf-8")
namefile_updated=codecs.open("namelist_newnames_jews_updated.csv","w", encoding="utf-8")
for line in namefile.readlines():
	path="raw_newnames_jews/"+line.split(",")[0]+".htm"
	cont=""
	try:
		f=codecs.open(path,"r", encoding="utf-8")		
		cont=f.read()
		f.close()
		f=codecs.open(path,"r", encoding="utf-8")		
		lines=f.readlines()
		f.close()
	except:
		pass
	if cont!="":
		


		soup=BeautifulSoup(cont)
		tag1=soup.find(id="lblCrossQuery")
		if tag1!=None:
			nostr=tag1.string
		else:
			for l in lines:
				if "oldalon" in l:
					nostr=l.split(">")[2].split("<")[0]

		#nostr=""
		#for l in cont:
		#	if "Összesen".decode("utf-8") in l:
		#		nostr=l.strip()
		#		#nostr=l.split(u"Összesen: ")[1].split(u"találat")
		#	elif "Kérem".decode("utf-8") in l:
		#		nostr=l.strip()
		#		#nostr=l.split("<")[1].split(u"találat")[0]
		#	else:
		#		nostr="0"
	else:
		nostr="FNF"
	nostr=nostr.split("tal")[0]
	if "esen" in nostr:
		nostr=nostr.split("esen:")[1]
	if "Nincs" in nostr:
		nostr="0"
	nostr=nostr.strip()
	#nostr="".join(nostr.split(" "))
	nostr="".join(nostr.split())
	updated_line=line.strip()+","+nostr+"\n"
	namefile_updated.write(updated_line)
namefile_updated.close()



