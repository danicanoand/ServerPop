# Server pop

### AWS
* Hem d'obrir els ports 110(pop) i 995(pops) a una instancia per poder accedir.

### Creacio imatge
* Dintre del directori del Dockerfile fem **docker build -t danicano/m11serverpop .** per generar la imatge

### Crear network
* Creem una xarxa interna **docker network create popnet**

### Engegar container 
* Un cop tenim la imatge creada fem **docker run --rm --name spop -h spop -p 110:110 -p 995:995 --network popnet -d danicano/m11serverpop**
per engegar el container en deatach.  
* Els ports els posem perque quan ataquem al port de la maquina AWS  es redirigeixi al port del container. 
* Si volem accedir a aquest contenidor hem de fer **docker exec -it spop /bin/bash**
 
### Comprovació 

* Una vegada ja tenim el container engegat a AWS comprovem si podem accedir des de l'aula.  
	* Pere  
	
	```
	[isx53320079@i10 ~]$ telnet 35.178.41.215 110
		Trying 35.178.41.215...
		Connected to 35.178.41.215.
		Escape character is '^]'.
		+OK POP3 spop 2007f.104 server ready
		USER pere
		+OK User name accepted, password please
		PASS pere
		+OK Mailbox open, 0 messages
		LIST
		+OK Mailbox scan listing follows
		.
		QUIT
		+OK Sayonara
		Connection closed by foreign host.
	```  
	* Marta
	```
	[isx53320079@i10 ipop3]$ telnet 35.178.41.215 110
		Trying 35.178.41.215...
		Connected to 35.178.41.215.
		Escape character is '^]'.
		+OK POP3 spop 2007f.104 server ready
		USER marta
		+OK User name accepted, password please
		PASS marta
		+OK Mailbox open, 0 messages
		QUIT
		+OK Sayonara
		Connection closed by foreign host.
	```

### Pujar 
* Per pujar la imatge a docker hub primer hem d'iniciar sessió amb **docker login**.
* A continuació pujem la imatge que vulguem **docker push danicano/m11sererpop**
