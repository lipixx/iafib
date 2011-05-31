;;Sistema expert per a la recomanació de televisió


;;****************
;;*   CLASSES    *
;;****************


; Tue May 31 20:30:36 CEST 2011
; 
;+ (version "3.4.6")
;+ (build "Build 613")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(multislot idioma
;+		(comment "Idioma en que s'emet el contingut.")
		(type SYMBOL)
		(allowed-values Espanyol Angles Catala Frances Italia Japones)
		(create-accessor read-write))
	(single-slot tema
;+		(comment "Tema  dintre de la naturalesa.")
		(type SYMBOL)
		(allowed-values Geologia Mamifers Peixos Insectes Clima Aus Reptils AnimalsGeneral)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot actors
;+		(comment "Actors del contingut de tipus Cine.")
		(type INSTANCE)
;+		(allowed-classes Persona)
		(create-accessor read-write))
	(single-slot ambit
;+		(comment "Ambit del que tracta aquest documental.")
		(type SYMBOL)
		(allowed-values Informatica Telecomunicacions Aviacio Nautica Construccio Mecanica)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot rol
;+		(comment "Rol que tindra la persona en un contingut determinat.")
		(type SYMBOL)
		(allowed-values actor director)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nacionalitat
;+		(comment "Defineix el pais de produccio de la pel·licula. Pot ser Espanyola, Francesa, EEUU, etc.")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot tematica
;+		(comment "Tematica del documental.")
		(type INSTANCE)
;+		(allowed-classes)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot resum
;+		(comment "Resum del capitol en concret. Es diferencia de la descripcio (parametre heretat), en que l'altre es la descripcio en general de la serie.")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot director
;+		(comment "Relacio que indica que una Persona te com a rol director per un Contingut determinat.")
		(type INSTANCE)
;+		(allowed-classes Persona)
		(create-accessor read-write))
	(single-slot nom
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot estatCivil
;+		(comment "La persona esta casada, divorciada, etc?")
		(type SYMBOL)
		(allowed-values casada divorciada soltera separada)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nivellEconomic
;+		(comment "Sou que guanya aquesta persona per fer-se una idea del nivell economic.")
		(type FLOAT)
		(range 0.0 1.0E12)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot format
;+		(comment "Descriu el format en que s'emet la pel·licula. Pot ser en color, blanc i negre o en 3D.")
		(type SYMBOL)
		(allowed-values 3D BiN COLOR)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot descripcio
;+		(comment "Descripcio, resum o sinopsis del contingut del programa.")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot num_temporada
;+		(comment "Temporada de la serie.")
		(type INTEGER)
		(range 1 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot num_capitol
;+		(comment "Nombre del capitol de la serie.")
		(type INTEGER)
		(range 1 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot duracio
;+		(comment "Duracio en minuts del contingut. Ex. 60', 90', 120', etc.")
		(type INTEGER)
		(range 0 600)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot sexe
;+		(comment "Sexe de la persona")
		(type SYMBOL)
		(allowed-values home dona)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot genere_serie
;+		(comment "Genere del contingut de tipus Serie.")
		(type INSTANCE)
;+		(allowed-classes Genere)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot subtitols
;+		(comment "Es poden seleccionar subtitols per aquest contingut?")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot epoca
;+		(comment "Epoca en que esta enfocat el documental.")
		(type SYMBOL)
		(allowed-values Moderna Medieval Prehist%C3%B2ria Classica SegleXX Romanticisme SegleXIX Actual Futur)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot ferirSensibilitat
;+		(comment "Aquest contingut pot ferir la sensibilitat de les persones. Basats en criteris mes o menys de la etica de la nostra societat.")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot idiomes
;+		(comment "Idiomes que enten la persona.")
		(type SYMBOL)
		(allowed-values Angles Frances Catala Espanyol Italia)
		(create-accessor read-write))
	(single-slot nomGenere
;+		(comment "Nom del genere al que fa referencia la classe.")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot genere
;+		(comment "Genere del contingut de tipus Cine.")
		(type INSTANCE)
;+		(allowed-classes Genere)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot any
;+		(comment "Any en que el contingut s'ha realitzat. P.ex. correspondria a la data de filmacio d'una pel·licula.")
		(type INTEGER)
		(range 1895 2012)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot TVornoTV_Class7
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot orientacioSexual
;+		(comment "Orientacio sexual de la persona.")
		(type SYMBOL)
		(allowed-values heterosexual homosexual bisexual)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot actorsS
;+		(comment "Actors de la serie.")
		(type INSTANCE)
;+		(allowed-classes Persona)
		(create-accessor read-write))
	(single-slot edatRecomanada
;+		(comment "Edat recomanada per veure aquest contingut.")
		(type INTEGER)
		(range 0 18)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot versioOriginal
;+		(comment "Indica si aquesta pel·licula pot ser emesa en versio original. (Si inclou l'idioma original en que es grava).")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot titol
;+		(comment "Nom o titol del contingut, per exemple \"Terminator 3\" o \"Doraemon\"")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edat
;+		(comment "Edat de la persona")
		(type INTEGER)
		(range 0 120)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nomTema
;+		(comment "Nom del tema a la que fa referencia la instancia.")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Contingut "Classe que representa un programa televisiu, tambe anomenat \"Contingut\"."
	(is-a USER)
	(role concrete)
	(multislot idioma
;+		(comment "Idioma en que s'emet el contingut.")
		(type SYMBOL)
		(allowed-values Espanyol Angles Catala Frances Italia Japones)
		(create-accessor read-write))
	(single-slot ferirSensibilitat
;+		(comment "Aquest contingut pot ferir la sensibilitat de les persones. Basats en criteris mes o menys de la etica de la nostra societat.")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot descripcio
;+		(comment "Descripcio, resum o sinopsis del contingut del programa.")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot any
;+		(comment "Any en que el contingut s'ha realitzat. P.ex. correspondria a la data de filmacio d'una pel·licula.")
		(type INTEGER)
		(range 1895 2012)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot director
;+		(comment "Relacio que indica que una Persona te com a rol director per un Contingut determinat.")
		(type INSTANCE)
;+		(allowed-classes Persona)
		(create-accessor read-write))
	(single-slot titol
;+		(comment "Nom o titol del contingut, per exemple \"Terminator 3\" o \"Doraemon\"")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot duracio
;+		(comment "Duracio en minuts del contingut. Ex. 60', 90', 120', etc.")
		(type INTEGER)
		(range 0 600)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot subtitols
;+		(comment "Es poden seleccionar subtitols per aquest contingut?")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edatRecomanada
;+		(comment "Edat recomanada per veure aquest contingut.")
		(type INTEGER)
		(range 0 18)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Cine "Representa el conjunt de pel·licules cinematografiques."
	(is-a Contingut)
	(role concrete)
	(multislot genere
;+		(comment "Genere del contingut de tipus Cine.")
		(type INSTANCE)
;+		(allowed-classes Genere)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(multislot actors
;+		(comment "Actors del contingut de tipus Cine.")
		(type INSTANCE)
;+		(allowed-classes Persona)
		(create-accessor read-write))
	(single-slot versioOriginal
;+		(comment "Indica si aquesta pel·licula pot ser emesa en versio original. (Si inclou l'idioma original en que es grava).")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
		(default FALSE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nacionalitat
;+		(comment "Defineix el pais de produccio de la pel·licula. Pot ser Espanyola, Francesa, EEUU, etc.")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot format
;+		(comment "Descriu el format en que s'emet la pel·licula. Pot ser en color, blanc i negre o en 3D.")
		(type SYMBOL)
		(allowed-values 3D BiN COLOR)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Serie "Representa una serie de televisio."
	(is-a Contingut)
	(role concrete)
	(single-slot resum
;+		(comment "Resum del capitol en concret. Es diferencia de la descripcio (parametre heretat), en que l'altre es la descripcio en general de la serie.")
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot num_temporada
;+		(comment "Temporada de la serie.")
		(type INTEGER)
		(range 1 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot genere_serie
;+		(comment "Genere del contingut de tipus Serie.")
		(type INSTANCE)
;+		(allowed-classes Genere)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot num_capitol
;+		(comment "Nombre del capitol de la serie.")
		(type INTEGER)
		(range 1 1000)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot actorsS
;+		(comment "Actors de la serie.")
		(type INSTANCE)
;+		(allowed-classes Persona)
		(create-accessor read-write)))

(defclass Documental "Representa els continguts de tipus documental, ja siguin d'animals, telediaris, etc."
	(is-a Contingut)
	(role concrete))

(defclass Historia "Documentals històrics, que expliquen tant la prehistòria, com el succés de la societat humana."
	(is-a Documental)
	(role concrete)
	(single-slot epoca
;+		(comment "Epoca en que esta enfocat el documental.")
		(type SYMBOL)
		(allowed-values Moderna Medieval Prehist%C3%B2ria Classica SegleXX Romanticisme SegleXIX Actual Futur)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Naturalesa "Els documentals de naturalesa són els més habituals en televisió. Mostren el món animal, o simplement el món geològic, entre altres."
	(is-a Documental)
	(role concrete)
	(single-slot tema
;+		(comment "Tema  dintre de la naturalesa.")
		(type SYMBOL)
		(allowed-values Geologia Mamifers Peixos Insectes Clima Aus Reptils AnimalsGeneral)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Ciencia "Els documentals de ciència comporten tots aquells relacionats amb el coneixement científic que ja sabem."
	(is-a Documental)
	(role concrete))

(defclass Actualitat "Els documentals d'actualitat són tots aquells referents a l'època actual i que anuncien fets actuals. Podríen ser sociològics o informatius."
	(is-a Documental)
	(role concrete))

(defclass Art "Com bé diu el seu títol els documentals d'art estan relacionats amb el tema artístic. Poden ser de pintura, escultures, etc."
	(is-a Documental)
	(role concrete))

(defclass Politica "Els documentals de política fan referència a tots els que analitzin la política de qualsevol època de la humanitat."
	(is-a Documental)
	(role concrete))

(defclass Economia "Documentals relacionats amb el mon de les finànces, la borsa, i l'economía en general."
	(is-a Documental)
	(role concrete))

(defclass Tecnologia "La tecnología està lligada a la ciència però es diferència en que són les eines que en sorgeixen d'ella, o les que permeten avançar a la ciència. Té diferents àmbits, com la informàtica, les telecomunicacions, etc."
	(is-a Documental)
	(role concrete)
	(single-slot ambit
;+		(comment "Ambit del que tracta aquest documental.")
		(type SYMBOL)
		(allowed-values Informatica Telecomunicacions Aviacio Nautica Construccio Mecanica)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Esports
	(is-a Documental)
	(role concrete))

(defclass Persona "Clase persona. Ens servira tant per definir els usuaris del nostre sistema, com per definir els actors, directors dels continguts."
	(is-a USER)
	(role concrete)
	(multislot idiomes
;+		(comment "Idiomes que enten la persona.")
		(type SYMBOL)
		(allowed-values Angles Frances Catala Espanyol Italia)
		(create-accessor read-write))
	(single-slot orientacioSexual
;+		(comment "Orientacio sexual de la persona.")
		(type SYMBOL)
		(allowed-values heterosexual homosexual bisexual)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nom
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot estatCivil
;+		(comment "La persona esta casada, divorciada, etc?")
		(type SYMBOL)
		(allowed-values casada divorciada soltera separada)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot sexe
;+		(comment "Sexe de la persona")
		(type SYMBOL)
		(allowed-values home dona)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot edat
;+		(comment "Edat de la persona")
		(type INTEGER)
		(range 0 120)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nivellEconomic
;+		(comment "Sou que guanya aquesta persona per fer-se una idea del nivell economic.")
		(type FLOAT)
		(range 0.0 1.0E12)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Genere "Representa el genere del contingut i es fa servir tant per cine com per series.\n\nLos géneros cinematográficos se clasifican según los elementos comunes de las películas que abarquen, originalmente según sus aspectos formales (ritmo, estilo o tono y, sobre todo, el sentimiento que busquen provocar en el espectador, ajuste). Alternativamente, los géneros cinematográficos se definen por su ambientación, estilo o por su formato. Los géneros son a menudo concretados para formar subgéneros, y también pueden ser combinados para formar géneros híbridos.\n\nActualmente no existe un consenso en cuanto a géneros cinematográficos se refiere y se da una compleja serie de clasificaciones."
	(is-a USER)
	(role concrete)
	(single-slot nomGenere
;+		(comment "Nom del genere al que fa referencia la classe.")
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Estil "El tipus de gènere \"Estil\" determina la sensació que es vol fer sentir a l'espectador. Per exemple terror, romanticisme o adrenalina (acció)."
	(is-a Genere)
	(role concrete))

(defclass Ambientacio "L'ambientació caracterítza el programa segons els elements que hi apareixen. Una ambientació típica seria la de l'oest, on els elements són comuns: vaquers, sorra, cavalls, etc. Un altre exemple seria els de l'espai exterior, on hi ha estrelles, planetes, i l'acció esdevé a l'espai i amb naus espacials."
	(is-a Genere)
	(role concrete))

(defclass Format "El format representa com s'emet el programa o com es porta a terme. Per exemple el show de Buenafuente es caracteritza com a show ja que té una sèrie d'etapes ben definides, on hi prima la comèdia i es fan exhibicions. Un altre seria l'animació, que correspondrien als dibuixos animats."
	(is-a Genere)
	(role concrete))

;;****************
;;*  INSTÀNCIES  *
;;****************

(definstances instancies
; Tue May 31 20:30:36 CEST 2011
; 
;+ (version "3.4.6")
;+ (build "Build 613")

([TVornoTV_Class0] of  Cine

	(actors [TVornoTV_Class2])
	(any 2007)
	(descripcio "Laura regresa con su familia al orfanato en el que crecio de niña con la intencion de abrir una residencia para niños discapacitados.")
	(director [TVornoTV_Class3])
	(duracio 120)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class27])
	(idioma Espanyol Angles)
	(nacionalitat "Espanyola")
	(subtitols TRUE)
	(titol "El orfanato"))

([TVornoTV_Class10] of  Persona

	(edat 40)
	(idiomes Angles)
	(nom "Stephen Rea")
	(sexe home))

([TVornoTV_Class10000] of  Naturalesa

	(any 2004)
	(descripcio "Las Rocosas, que se extienden desde Alaska a Nuevo México, son una de las grandes cadenas montañosas del planeta.")
	(director [TVornoTV_Class10001])
	(duracio 44)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(tema Geologia)
	(titol "Asi se hizo la tierra - Las montañas rocosas"))

([TVornoTV_Class10001] of  Persona

	(nom "Stefanie Kern")
	(sexe home))

([TVornoTV_Class10003] of  Naturalesa

	(any 2003)
	(descripcio "Los insectos nos producen pesadillas. Son criaturas que se esconden al acecho en la oscuridad, más allá de nuestra visión. Tienen el poder de engañar, matar, desmembrar, esclavizar e incluso de lavar el cerebro de otros para que cumplan sus órdenes.")
	(director [TVornoTV_Class10001])
	(duracio 47)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(tema Insectes)
	(titol "Insectos mortales"))

([TVornoTV_Class10004] of  Cine

	(actors
		[TVornoTV_Class10007]
		[TVornoTV_Class10008]
		[TVornoTV_Class10009])
	(any 2007)
	(descripcio "Una reportera y su camara estan haciendo un reportaje en una estacion de bomberos con la intencion de retratar la profesion de estos, su modo de vida y sus situaciones de riesgo.")
	(director [TVornoTV_Class10006])
	(duracio 100)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(genere [TVornoTV_Class27])
	(idioma Espanyol Angles)
	(nacionalitat "Espanyola")
	(subtitols TRUE)
	(titol "REC"))

([TVornoTV_Class10006] of  Persona

	(nom "Jaume Balaguero")
	(sexe home))

([TVornoTV_Class10007] of  Persona

	(nom "Marta Carbonell")
	(sexe dona))

([TVornoTV_Class10008] of  Persona

	(nom "Vicente Gil")
	(sexe home))

([TVornoTV_Class10009] of  Persona

	(nom "Manuela Velasco")
	(sexe dona))

([TVornoTV_Class10011] of  Cine

	(actors [TVornoTV_Class10013])
	(any 2001)
	(descripcio "Isla de Jersey, 1945. La II Guerra Mundial ha terminado, pero el marido de Grace no vuelve. Sola en un aislado caseron victoriano, educa a sus hijos dentro de las estrictas normas religiosas. Los niños sufren una extraña enfermedad: no pueden recibir directamente la luz del dia. Los 3 nuevos sirvientes que se incorporan a la vida familiar deben aprender una regla vital: la casa estara siempre en penumbra.")
	(director [TVornoTV_Class10012])
	(duracio 105)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(genere [TVornoTV_Class27])
	(idioma Espanyol Angles Frances)
	(nacionalitat "Espanyola")
	(subtitols TRUE)
	(titol "Los Otros")
	(versioOriginal TRUE))

([TVornoTV_Class10012] of  Persona

	(nom "Alejandor Amenabar")
	(sexe home))

([TVornoTV_Class10013] of  Persona

	(nom "Nicole Kidman")
	(sexe dona))

([TVornoTV_Class10014] of  Cine

	(actors
		[TVornoTV_Class10016]
		[TVornoTV_Class10017])
	(any 1973)
	(descripcio "Regan MacNeil, una inocente niña de 12 años, se empieza a sentir mal y su madre, Chris, acude a diferentes medicos para descubrir que enfermedad sufre su hija. Cuando nadie es capaz de darle una respuesta, Chris acude desesperada a un sacerdote, el padre Lankester Merrin, empieza a creer que la enfermedad de su hija esta mas relacionada con lo espiritual que con lo fisico.")
	(director [TVornoTV_Class10015])
	(duracio 117)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class27])
	(idioma Espanyol Angles Frances Italia)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "El Exorcista")
	(versioOriginal TRUE))

([TVornoTV_Class10015] of  Persona

	(nom "William Friedkin")
	(sexe home))

([TVornoTV_Class10016] of  Persona

	(nom "Ellen Burstyn")
	(sexe dona))

([TVornoTV_Class10017] of  Persona

	(nom "Maxvon Sydow")
	(sexe home))

([TVornoTV_Class10018] of  Cine

	(actors
		[TVornoTV_Class57]
		[TVornoTV_Class10020])
	(any 2002)
	(descripcio "Una cinta de video contiene imagenes perturbadoras... Tras visionarla, recibes una llamada telefonica que anuncia tu muerte... Siete dias despues, la terrible profecia se cumple...")
	(director [TVornoTV_Class10019])
	(duracio 110)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class27])
	(idioma Espanyol Angles Japones)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "The Ring")
	(versioOriginal TRUE))

([TVornoTV_Class10019] of  Persona

	(nom "Gore Verinski")
	(sexe home))

([TVornoTV_Class10020] of  Persona

	(nom "Martin Henderson")
	(sexe home))

([TVornoTV_Class10021] of  Cine

	(actors
		[TVornoTV_Class10022]
		[TVornoTV_Class10023])
	(any 1980)
	(descripcio "Piensa en el mayor terror imaginable. ¿Monstruos? ¿Una epidemia? O, como en esta obra maestra de Stanley Kubrick, el miedo procede de un asesino que deberia amarte y protegerte, como un miembro de la familia. Realizada a partir de una novela de Stephen King, Kubrick mezcla la realizacion mas impactante con los escenarios mas terrorificos para tenernos susto tras susto.")
	(director [TVornoTV_Class10024])
	(duracio 115)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class27])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "El Resplandor")
	(versioOriginal TRUE))

([TVornoTV_Class10022] of  Persona

	(nom "Jack Nicholson")
	(sexe home))

([TVornoTV_Class10023] of  Persona

	(nom "Shelley Duvall")
	(sexe dona))

([TVornoTV_Class10024] of  Persona

	(nom "Stanley Kubrick")
	(sexe home))

([TVornoTV_Class10025] of  Cine

	(actors
		[TVornoTV_Class10026]
		[TVornoTV_Class10027])
	(any 1982)
	(descripcio "En una estacion experimental de la Antartida, un equipo de investigadores descubre a un ente extraño venido del espacio, que ha permanecido enterrado en la nieve durante mas de 100.000 años. doreso.")
	(director [TVornoTV_Class10028])
	(duracio 108)
	(edatRecomanada 15)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class33])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "La cosa (el enigma de otro mundo)")
	(versioOriginal TRUE))

([TVornoTV_Class10026] of  Persona

	(nom "Kurt Russell")
	(sexe home))

([TVornoTV_Class10027] of  Persona

	(nom "Wiford Brimley")
	(sexe home))

([TVornoTV_Class10028] of  Persona

	(nom "John Carpenter")
	(sexe home))

([TVornoTV_Class10029] of  Cine

	(actors [TVornoTV_Class10031])
	(any 1968)
	(descripcio ". Hace millones de años, en los albores del nacimiento del homo sapiens, unos simios descubren un monolito que les lleva a un estadio de inteligencia superior. Otro monolito vuelve a aparecer, millones de años despues, enterrado en una luna, lo que provoca el interes de los cientificos humanos.")
	(director [TVornoTV_Class10024])
	(duracio 139)
	(edatRecomanada 15)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere
		[TVornoTV_Class33]
		[TVornoTV_Class60016])
	(idioma Espanyol Angles Frances)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "2001: Una odisea del espacio")
	(versioOriginal TRUE))

([TVornoTV_Class10031] of  Persona

	(nom "Keir Dullea")
	(sexe home))

([TVornoTV_Class10032] of  Cine

	(actors [TVornoTV_Class10033])
	(any 1999)
	(descripcio "Thomas Anderson es un brillante programador de una respetable compañia de software. Pero fuera del trabajo es Neo, un hacker que un dia recibe una misteriosa visita...")
	(director [TVornoTV_Class10034])
	(duracio 131)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class33])
	(idioma Espanyol Angles Frances Italia Japones)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Matrix")
	(versioOriginal TRUE))

([TVornoTV_Class10033] of  Persona

	(nom "Keanu Reeves")
	(sexe home))

([TVornoTV_Class10034] of  Persona

	(nom "Andy Wachowski")
	(sexe home))

([TVornoTV_Class10035] of  Cine

	(actors
		[TVornoTV_Class10037]
		[TVornoTV_Class10038])
	(any 1977)
	(descripcio "La princesa Leia, lider del movimiento rebelde que desea reinstaurar la Republica en la galaxia en los tiempos ominosos del Imperio, es capturada por las Fuerzas Imperiales, capitaneadas por el implacable Darth Vader, el sirviente mas fiel del Emperador.")
	(director [TVornoTV_Class10036])
	(duracio 121)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class33])
	(idioma Espanyol Angles Frances Italia Japones)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "La guerra de las galaxias")
	(versioOriginal TRUE))

([TVornoTV_Class10036] of  Persona

	(nom "George Lucas")
	(sexe home))

([TVornoTV_Class10037] of  Persona

	(nom "Mark Hamill")
	(sexe home))

([TVornoTV_Class10038] of  Persona

	(nom "Harrison Ford")
	(sexe home))

([TVornoTV_Class10039] of  Cine

	(actors
		[TVornoTV_Class10041]
		[TVornoTV_Class10042])
	(any 1931)
	(descripcio "El doctor Henry Von Frankenstein se embarca en un experimento tenebroso: construir, a partir de trozos de cadaveres, un nuevo ser humano.")
	(director [TVornoTV_Class10040])
	(duracio 71)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(format BiN)
	(genere [TVornoTV_Class33])
	(idioma Espanyol Angles Frances)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "El doctor Frankenstein")
	(versioOriginal TRUE))

([TVornoTV_Class10040] of  Persona

	(nom "James Whale")
	(sexe home))

([TVornoTV_Class10041] of  Persona

	(nom "Boris Karloff")
	(sexe home))

([TVornoTV_Class10042] of  Persona

	(nom "Colin Clive")
	(sexe home))

([TVornoTV_Class10044] of  Cine

	(actors
		[TVornoTV_Class10046]
		[TVornoTV_Class10047])
	(any 1972)
	(descripcio "Años 40. Don Vito Corleone es el jefe de una de las cinco familias de la mafia de Nueva York.")
	(director [TVornoTV_Class10045])
	(duracio 175)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class5])
	(idioma Espanyol Angles Frances Italia)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "El Padrino")
	(versioOriginal TRUE))

([TVornoTV_Class10045] of  Persona

	(nom "Francis Ford Coppola")
	(sexe home))

([TVornoTV_Class10046] of  Persona

	(nom "Marlon Brando")
	(sexe home))

([TVornoTV_Class10047] of  Persona

	(nom "Al Pacino")
	(sexe home))

([TVornoTV_Class10048] of  Cine

	(actors [TVornoTV_Class10050])
	(any 1993)
	(descripcio "Oskar Schindler (Liam Neeson), un hombre de enorme astucia y talento para las relaciones publicas, organiza un ambicioso plan para ganarse la simpatia de los nazis. Despues de la invasion de Polonia por los alemanes, consigue, gracias a sus relaciones con los nazis, la propiedad de una fabrica de Cracovia.")
	(director [TVornoTV_Class10049])
	(duracio 195)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(format BiN)
	(genere [TVornoTV_Class5])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "La lista de Schindler")
	(versioOriginal TRUE))

([TVornoTV_Class10049] of  Persona

	(nom "Steven Spielberg")
	(sexe home))

([TVornoTV_Class10050] of  Persona

	(nom "Liam Neeson")
	(sexe home))

([TVornoTV_Class10051] of  Cine

	(actors [TVornoTV_Class10054])
	(any 1994)
	(descripcio "Jules y Vincent son dos asesinos a sueldo que trabajan para Marsellus Wallace.")
	(director [TVornoTV_Class10052])
	(duracio 153)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class5])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Pulp Fiction")
	(versioOriginal TRUE))

([TVornoTV_Class10052] of  Persona

	(nom "Quentin Tarantino")
	(sexe home))

([TVornoTV_Class10054] of  Persona

	(nom "John Travolta")
	(sexe home))

([TVornoTV_Class10055] of  Cine

	(actors [TVornoTV_Class10057])
	(any 1971)
	(descripcio "Gran Bretaña, en un futuro indeterminado. Alex (Malcolm McDowell) es un joven muy agresivo que tiene dos pasiones: la violencia desaforada y Beethoven. Es el jefe de la banda de los drugos, que dan rienda suelta a sus instintos mas salvajes apaleando, violando y aterrorizando a la poblacion.")
	(director [TVornoTV_Class10024])
	(duracio 137)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class5])
	(idioma Espanyol Angles Frances Italia)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "La naranja mecanica")
	(versioOriginal TRUE))

([TVornoTV_Class10057] of  Persona

	(nom "Malcolm McDowell")
	(sexe home))

([TVornoTV_Class10058] of  Cine

	(actors [TVornoTV_Class10060])
	(any 2000)
	(descripcio "En el año 180, el Imperio Romano domina todo el mundo conocido. Tras la victoria sobre los barbaros, el anciano emperador Marco Aurelio (Richard Harris) decide transferir el poder a Maximo (Russell Crowe), bravo general de sus ejercitos y hombre de inquebrantable lealtad al imperio, pero su hijo Comodo (Joaquin Phoenix) no lo acepta y trata de asesinarlo.")
	(director [TVornoTV_Class10059])
	(duracio 150)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class17])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Gladiator")
	(versioOriginal TRUE))

([TVornoTV_Class10059] of  Persona

	(nom "Ridley Scott")
	(sexe home))

([TVornoTV_Class10060] of  Persona

	(nom "Russell Crowe")
	(sexe home))

([TVornoTV_Class10061] of  Cine

	(actors
		[TVornoTV_Class10063]
		[TVornoTV_Class10064])
	(any 2004)
	(director [TVornoTV_Class10062])
	(duracio 127)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(format 3D)
	(genere [TVornoTV_Class17])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Spider Man 2")
	(versioOriginal TRUE))

([TVornoTV_Class10062] of  Persona

	(nom "Sam Raimi")
	(sexe home))

([TVornoTV_Class10063] of  Persona

	(nom "Tobey Maquire")
	(sexe home))

([TVornoTV_Class10064] of  Persona

	(nom "Kirsten Dunst")
	(sexe dona))

([TVornoTV_Class10065] of  Cine

	(actors [TVornoTV_Class10067])
	(any 1987)
	(descripcio "Martin Riggs es un policia de Los Angeles con tendencias suicidas. Roger Murtaugh es un maduro y responsable policia, padre de familia, que trabaja con Riggs. Juntos intentaran desmantelar una operacion de contrabando de droga y, al mismo tiempo, a pesar de sus diferentes caracteres, se haran buenos amigos.")
	(director [TVornoTV_Class10066])
	(duracio 105)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class17])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Arma letal")
	(versioOriginal TRUE))

([TVornoTV_Class10066] of  Persona

	(nom "Richard Donner")
	(sexe home))

([TVornoTV_Class10067] of  Persona

	(nom "Mel Gibson")
	(sexe home))

([TVornoTV_Class10068] of  Cine

	(actors [TVornoTV_Class10070])
	(any 1988)
	(descripcio "En lo alto de la ciudad de Los Ángeles un grupo armado terrorista se ha apoderado de un edificio tomando a un grupo de personas como rehenes. Solo un hombre, el policia John McClane (Bruce Willis), ha conseguido escapar del acoso terrorista.")
	(director [TVornoTV_Class10069])
	(duracio 131)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class17])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Jungla de cristal")
	(versioOriginal TRUE))

([TVornoTV_Class10069] of  Persona

	(nom "John McTiernan")
	(sexe home))

([TVornoTV_Class10070] of  Persona

	(nom "Bruce Willis")
	(sexe home))

([TVornoTV_Class10071] of  Format

	(nomGenere "Animacio"))

([TVornoTV_Class10072] of  Estil

	(nomGenere "Comedia"))

([TVornoTV_Class10073] of  Cine

	(any 1953)
	(descripcio "Relata las aventuras en el Pais de Nunca Jamas de Peter Pan, su compañera Campanilla, su amiga Wendy y los Niños Perdidos, en su lucha contra el malvado Capitan Garfio.")
	(director [TVornoTV_Class10074])
	(duracio 77)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class10071])
	(idioma Espanyol Angles Frances Italia)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "Peter Pan")
	(versioOriginal TRUE))

([TVornoTV_Class10074] of  Persona

	(nom "Clyde Geronimi")
	(sexe home))

([TVornoTV_Class10075] of  Cine

	(any 1991)
	(descripcio "Una hermosa joven llamada Bella acepta alojarse en un castillo con una bestia a cambio de la libertad de su padre. La bestia es, en realidad, un principe encantado.")
	(director [TVornoTV_Class10076])
	(duracio 85)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(format BiN)
	(genere [TVornoTV_Class10071])
	(idioma Espanyol Angles Frances Italia)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "La Bella y la Bestia")
	(versioOriginal TRUE))

([TVornoTV_Class10076] of  Persona

	(nom "Gary Trousdale")
	(sexe home))

([TVornoTV_Class10077] of  Cine

	(any 1994)
	(descripcio "La sabana africana es el escenario en el que tienen lugar las aventuras de Simba, un pequeño leon que es el heredero del trono. Sin embargo, se ve forzado a exiliarse al ser injustamente acusado de la muerte de su padre. Durante su destierro, hara buenas amistades y, finalmente, regresara para recuperar lo que legitimamente le corresponde.")
	(director [TVornoTV_Class10078])
	(duracio 85)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class10071])
	(idioma Espanyol Angles Frances Italia)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "El Rey Leon")
	(versioOriginal TRUE))

([TVornoTV_Class10078] of  Persona

	(nom "Rob Minkoff")
	(sexe home))

([TVornoTV_Class10079] of  Cine

	(any 1995)
	(descripcio "Los juguetes de Andy, un niño de 6 años, temen que haya llegado su hora y que un nuevo regalo de cumpleaños les sustituya en el corazon de su dueño.")
	(director [TVornoTV_Class10080])
	(duracio 80)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class10071])
	(idioma Espanyol Angles Frances Italia)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "Toy Story")
	(versioOriginal TRUE))

([TVornoTV_Class10080] of  Persona

	(nom "John Lasseter")
	(sexe home))

([TVornoTV_Class10081] of  Cine

	(actors [TVornoTV_Class10083])
	(any 1959)
	(descripcio "Época de la Ley Seca (1920-1933). Joe y Jerry son dos musicos del monton que se ven obligados a huir despues de ser testigos de un ajuste de cuentas entre dos bandas rivales.")
	(director [TVornoTV_Class10082])
	(duracio 119)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format BiN)
	(genere [TVornoTV_Class10072])
	(idioma Angles)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "Con faldas y a lo loco")
	(versioOriginal TRUE))

([TVornoTV_Class10082] of  Persona

	(nom "Billy Wilder")
	(sexe home))

([TVornoTV_Class10083] of  Persona

	(nom "Marily Monroe")
	(sexe dona))

([TVornoTV_Class10084] of  Cine

	(actors [TVornoTV_Class10085])
	(any 1931)
	(descripcio "Un pobre vagabundo (Charles Chaplin) pasa mil y un avatares para conseguir dinero y ayudar a una pobre chica ciega (Virginia Cherill) de la que se ha enamorado.")
	(director [TVornoTV_Class10085])
	(duracio 81)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(format BiN)
	(genere [TVornoTV_Class10072])
	(idioma Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Luces de la ciudad")
	(versioOriginal TRUE))

([TVornoTV_Class10085] of  Persona

	(nom "Charles Chaplin")
	(sexe home))

([TVornoTV_Class10087] of  Cine

	(actors
		[TVornoTV_Class10089]
		[TVornoTV_Class10090])
	(any 1952)
	(descripcio "Antes de conocer a la aspirante a actriz Kathy Selden (Debbie Reynolds), el idolo del cine mudo Don Lockwood (Gene Kelly) pensaba que lo tenia todo: fama, fortuna y exito...")
	(director [TVornoTV_Class10088])
	(duracio 102)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class10072])
	(idioma Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Cantando bajo la lluvia")
	(versioOriginal TRUE))

([TVornoTV_Class10088] of  Persona

	(nom "Stanley Donen")
	(sexe home))

([TVornoTV_Class10089] of  Persona

	(nom "Gene Kelly")
	(sexe dona))

([TVornoTV_Class10090] of  Persona

	(nom "Donald O'Connor")
	(sexe home))

([TVornoTV_Class10091] of  Cine

	(actors
		[TVornoTV_Class10093]
		[TVornoTV_Class10094]
		[TVornoTV_Class10095]
		[TVornoTV_Class10096])
	(any 1984)
	(descripcio "En la academia de policia estan a punto de finalizar sus pruebas preparatorias para el cuerpo un numeroso grupo de veteranos. Durante un tiempo, coinciden con los novatos de nuevo ingreso, que seran el centro de un monton de bromas que muchas veces se lo haran pasar muy mal.")
	(director [TVornoTV_Class10092])
	(duracio 95)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class10072])
	(idioma Espanyol)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "Loca academia de policia")
	(versioOriginal TRUE))

([TVornoTV_Class10092] of  Persona

	(nom "Hugh Wilson")
	(sexe home))

([TVornoTV_Class10093] of  Persona

	(nom "Steve Guttenberg")
	(sexe home))

([TVornoTV_Class10094] of  Persona

	(nom "Kim Cattrall")
	(sexe home))

([TVornoTV_Class10095] of  Persona

	(nom "Bubba Smith")
	(sexe home))

([TVornoTV_Class10096] of  Persona

	(nom "G.W. Bailey")
	(sexe home))

([TVornoTV_Class10097] of  Cine

	(any 2009)
	(director [TVornoTV_Class10098])
	(duracio 94)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(format 3D)
	(genere [TVornoTV_Class10071])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "Monsters Vs. Aliens")
	(versioOriginal TRUE))

([TVornoTV_Class10098] of  Persona

	(nom "Rob Letterman")
	(sexe home))

([TVornoTV_Class10099] of  Cine

	(actors
		[TVornoTV_Class10101]
		[TVornoTV_Class10102])
	(any 2000)
	(descripcio "Un joven estudiante tiene una premonicion al subirse al avion en el que se dispone a ir a Paris con sus compañeros. Presintiendo que algo grave va a pasar, el y sus amigos desembarcan antes del despegue.")
	(director [TVornoTV_Class10100])
	(duracio 97)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format 3D)
	(genere [TVornoTV_Class27])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Destino final")
	(versioOriginal FALSE))

([TVornoTV_Class10100] of  Persona

	(nom "James Wong")
	(sexe home))

([TVornoTV_Class10101] of  Persona

	(nom "Devon Sawa")
	(sexe home))

([TVornoTV_Class10102] of  Persona

	(nom "Ali Larter")
	(sexe dona))

([TVornoTV_Class10103] of  Cine

	(actors
		[TVornoTV_Class10105]
		[TVornoTV_Class10106])
	(any 2008)
	(descripcio "Durante una expedicion cientifica en Islandia, el visionario cientifico Trevor Anderson (Brendan Fraser), su sobrino Sean (Josh Hutcherson) y su hermosa guia regional, Hannah (Anita Briem), quedan atrapados en una cueva. La unica posibilidad de escapar de alli es adentrandose en las entrañas de la Tierra.")
	(director [TVornoTV_Class10104])
	(duracio 92)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(format 3D)
	(genere [TVornoTV_Class33])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "Viaje al centro de la Tierra")
	(versioOriginal TRUE))

([TVornoTV_Class10104] of  Persona

	(nom "Eric Brevig")
	(sexe home))

([TVornoTV_Class10105] of  Persona

	(nom "Brendan Fraser")
	(sexe home))

([TVornoTV_Class10106] of  Persona

	(nom "Josh Hutcherson")
	(sexe home))

([TVornoTV_Class10107] of  Cine

	(actors
		[TVornoTV_Class10109]
		[TVornoTV_Class10110]
		[TVornoTV_Class10111]
		[TVornoTV_Class10112])
	(any 2003)
	(descripcio "La tecnologia HD/3-D entra en escena cuando los jovenes agentes Juni (Daryl Sabara) y Carmen Cortez (Alexa Vega) emprenden la mision mas emocionante de sus vidas: un viaje al interior de la realidad virtual de un videojuego en 3D que ha sido especialmente diseñado para acabar con ellos")
	(director [TVornoTV_Class10108])
	(duracio 84)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(format 3D)
	(genere [TVornoTV_Class10071])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "Spy Kids 3D: Game Over")
	(versioOriginal TRUE))

([TVornoTV_Class10108] of  Persona

	(nom "Robert Rodriguez")
	(sexe home))

([TVornoTV_Class10109] of  Persona

	(nom "Antonio Banderas")
	(sexe home))

([TVornoTV_Class10110] of  Persona

	(nom "Carla Gugino")
	(sexe dona))

([TVornoTV_Class10111] of  Persona

	(nom "Daryl Sabara")
	(sexe home))

([TVornoTV_Class10112] of  Persona

	(nom "Alexa Vega")
	(sexe dona))

([TVornoTV_Class10113] of  Cine

	(actors [TVornoTV_Class10115])
	(any 2001)
	(descripcio "Amelie no es una chica como las demas. Ha visto a su pez de colores deslizarse hacia las alcantarillas municipales, a su madre morir en la plaza de Notre-Dame y a su padre dedicar todo su afecto a un gnomo de jardin. De repente, a sus veintidos años, descubre su objetivo en la vida: arreglar la vida de los demas.")
	(director [TVornoTV_Class10114])
	(duracio 120)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class5])
	(idioma Frances Espanyol Angles)
	(nacionalitat "Francesa")
	(subtitols TRUE)
	(titol "Amelie")
	(versioOriginal TRUE))

([TVornoTV_Class10114] of  Persona

	(nom "Jean Pierre Jeunet")
	(sexe home))

([TVornoTV_Class10115] of  Persona

	(nom "Audrey Tautou")
	(sexe dona))

([TVornoTV_Class10116] of  Cine

	(actors
		[TVornoTV_Class10118]
		[TVornoTV_Class10119])
	(any 2006)
	(descripcio "En Paris, el amor esta por todas partes: en sus bares y cafes, bajo la Torre Eiffel e incluso bajo tierra, en el metro. Algunos de los directores mas prestigiosos del mundo fueron invitados a contar una historia ambientada en uno de los barrios de la ciudad.")
	(director [TVornoTV_Class10117])
	(duracio 119)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class10072])
	(idioma Frances Espanyol Angles)
	(nacionalitat "Francesa")
	(subtitols TRUE)
	(titol "Paris, je t'aime")
	(versioOriginal TRUE))

([TVornoTV_Class10117] of  Persona

	(nom "Olivier Assayas")
	(sexe home))

([TVornoTV_Class10118] of  Persona

	(nom "Natalie Portman")
	(sexe dona))

([TVornoTV_Class10119] of  Persona

	(nom "Fanny Ardant")
	(sexe home))

([TVornoTV_Class10120] of  Cine

	(actors
		[TVornoTV_Class10121]
		[TVornoTV_Class10122])
	(any 1991)
	(descripcio "En un inmenso descampado, se alza un viejo edificio habitado por personas de costumbres mas bien extrañas que solo tiene una preocupacion: alimentarse. El propietario es un peculiar carnicero que tiene su establecimiento en los bajos del bloque. Alli llega un nuevo inquilino que trabaja en el circo y que alterara la vida de la excentrica comunidad que lo habita.")
	(director [TVornoTV_Class10114])
	(duracio 95)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class10072])
	(idioma Frances Espanyol Angles)
	(nacionalitat "Francesa")
	(subtitols TRUE)
	(titol "Delicatessen")
	(versioOriginal TRUE))

([TVornoTV_Class10121] of  Persona

	(nom "Howard Vernon")
	(sexe home))

([TVornoTV_Class10122] of  Persona

	(nom "Dominique Pinon")
	(sexe home))

([TVornoTV_Class10124] of  Cine

	(actors [TVornoTV_Class10126])
	(any 1999)
	(descripcio "Daniel Lefebre, de 40 años, dirige una escuela infantil en un barrio marginal de Hernaing, poblacion minera del norte de Francia. En el pequeño pueblo, el 30% de la poblacion esta en paro a causa de la crisis de la mineria. Un dia, la madre de una de las alumnas llega borracha a la escuela, sufre un colapso y deja alli a su bebe y a su hija de cinco años. El profesor decide tomar cartas en el asunto y solicita la ayuda de la comunidad.")
	(director [TVornoTV_Class10125])
	(duracio 107)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class5])
	(idioma Frances Angles Espanyol)
	(nacionalitat "Francesa")
	(subtitols TRUE)
	(titol "Hoy empieza todo")
	(versioOriginal TRUE))

([TVornoTV_Class10125] of  Persona

	(nom "Bertrand Tavernier")
	(sexe home))

([TVornoTV_Class10126] of  Persona

	(nom "Philippe Torreton")
	(sexe home))

([TVornoTV_Class10127] of  Cine

	(actors
		[TVornoTV_Class10129]
		[TVornoTV_Class10130]
		[TVornoTV_Class10131]
		[TVornoTV_Class10132]
		[TVornoTV_Class10133]
		[TVornoTV_Class10134])
	(any 2010)
	(descripcio "Durante los duros años de la postguerra, en una zona rural de Cataluña, un niño llamado Andreu, cuya familia pertenece al bando de los perdedores, encuentra un dia en el bosque los cadaveres de un hombre y su hijo.")
	(director [TVornoTV_Class10128])
	(duracio 108)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class5])
	(idioma Catala)
	(nacionalitat "Espanyola")
	(subtitols FALSE)
	(titol "Pa negre")
	(versioOriginal TRUE))

([TVornoTV_Class10128] of  Persona

	(nom "Agusti Villaronga")
	(sexe home))

([TVornoTV_Class10129] of  Persona

	(nom "Francesc Colomer")
	(sexe home))

([TVornoTV_Class10130] of  Persona

	(nom "Nora Navas")
	(sexe dona))

([TVornoTV_Class10131] of  Persona

	(nom "Marina Comas")
	(sexe dona))

([TVornoTV_Class10132] of  Persona

	(nom "Laia Marull"))

([TVornoTV_Class10133] of  Persona

	(nom "Jordi Pla")
	(sexe home))

([TVornoTV_Class10134] of  Persona

	(nom "Sergi Lopez")
	(sexe home))

([TVornoTV_Class10139] of  Historia

	(any 1988)
	(descripcio "Historia sobre el regim dictatorial de Adolf Hitler.")
	(director [TVornoTV_Class10146])
	(duracio 54)
	(edatRecomanada 16)
	(epoca SegleXX)
	(ferirSensibilitat TRUE)
	(idioma Espanyol)
	(subtitols FALSE)
	(titol "Adolf Hitler - La historia oculta del III Reich"))

([TVornoTV_Class10146] of  Persona

	(nom "Dave Flitton")
	(sexe home))

([TVornoTV_Class10150] of  Tecnologia

	(ambit Informatica)
	(any 1999)
	(descripcio "La red esta poblada de tribus ciberneticas. Piratas, escritores de virus, jovenes que se adueñan de la identidad de las empresas...")
	(director [TVornoTV_Class10151])
	(duracio 45)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(titol "Hackers españoles"))

([TVornoTV_Class10151] of  Persona

	(estatCivil casada)
	(nom "Miguel Ángel Nieto")
	(orientacioSexual heterosexual)
	(sexe home))

([TVornoTV_Class10152] of  Tecnologia

	(ambit Informatica)
	(any 1999)
	(descripcio "Historia de la construccio del gran imperi de Microsoft i Apple")
	(director [TVornoTV_Class10153])
	(duracio 95)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols TRUE)
	(titol "Piratas de Silicon Valley"))

([TVornoTV_Class10153] of  Persona

	(nom "Martyn Burke"))

([TVornoTV_Class10154] of  Cine

	(actors
		[TVornoTV_Class10157]
		[TVornoTV_Class10158])
	(any 1929)
	(descripcio "Pel·licula classica de salvador dali")
	(director
		[TVornoTV_Class10155]
		[TVornoTV_Class10156])
	(duracio 16)
	(ferirSensibilitat FALSE)
	(format BiN)
	(genere [TVornoTV_Class5])
	(idioma Frances)
	(nacionalitat "Francesa")
	(subtitols FALSE)
	(titol "Un perro andaluz")
	(versioOriginal TRUE))

([TVornoTV_Class10155] of  Persona

	(nom "Louis Bunuel")
	(sexe home))

([TVornoTV_Class10156] of  Persona

	(nom "Salvador Dali")
	(sexe home))

([TVornoTV_Class10157] of  Persona

	(nom "Simonne Marefuil")
	(sexe dona))

([TVornoTV_Class10158] of  Persona

	(nom "Pierre Batchef")
	(sexe home))

([TVornoTV_Class10159] of  Tecnologia

	(ambit Informatica)
	(any 2002)
	(descripcio "Entrevist a Richard Stallman a TVE3")
	(duracio 28)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Catala)
	(subtitols FALSE)
	(titol "Richard Stallman - GNU/Linux"))

([TVornoTV_Class11] of  Persona

	(idiomes Angles)
	(nom "Lotte Verbeek")
	(sexe home))

([TVornoTV_Class12] of  Persona

	(nom "Tom Charlfa")
	(sexe home))

([TVornoTV_Class13] of  Cine

	(any 2010)
	(descripcio "En el sur de Francia durante la temporada estival. Gaspard es un adolescente que se regocija en la idea de poder hacer lo que le venga en gana en su casa, ahora que sus padres se han marchado. Sus amigos Yann y Ludo estan siempre con el, dispuestos a hacer el tonto mientras Gaspard descubre el deseo y quizas el amor con Marion.")
	(director [TVornoTV_Class15])
	(duracio 105)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class5])
	(idioma Espanyol)
	(nacionalitat "Francia")
	(subtitols FALSE)
	(titol "Black Heaven"))

([TVornoTV_Class15] of  Persona

	(idiomes Frances)
	(nom "Gilles Marchand")
	(sexe home))

([TVornoTV_Class16] of  Cine

	(actors
		[TVornoTV_Class19]
		[TVornoTV_Class20]
		[TVornoTV_Class21]
		[TVornoTV_Class22]
		[TVornoTV_Class23]
		[TVornoTV_Class24]
		[TVornoTV_Class25])
	(any 1991)
	(descripcio "Las maquinas, en su intento fallido por matar a la embarazada Sarah Connor (Linda Hamilton), deciden continuar con su cometido, pero esta vez deciden cambiar de objetivo: el adolescente John Connor (Edward Furlong). Para ello envian al avanzado T-1000 (Robert Patrick), un prototipo de metal liquido que es capaz de transformarse en cualquier persona. Pero el joven Connor recibira la ayuda de un T-800 CSM-101 (Arnold Schwarzenegger), que viene desde el futuro para salvarlo.")
	(director [TVornoTV_Class18])
	(duracio 137)
	(edatRecomanada 16)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere
		[TVornoTV_Class17]
		[TVornoTV_Class60011])
	(idioma Espanyol Angles Catala)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Terminator 2: El juicio final"))

([TVornoTV_Class17] of  Estil

	(nomGenere "Accio"))

([TVornoTV_Class18] of  Persona

	(nom "James Cameron")
	(sexe home))

([TVornoTV_Class19] of  Persona

	(edat 64)
	(estatCivil casada)
	(idiomes Angles)
	(nivellEconomic 2.0E8)
	(nom "Arnold Schwarzenegger")
	(orientacioSexual heterosexual)
	(sexe home))

([TVornoTV_Class2] of  Persona

	(estatCivil casada)
	(nom "Belen Rueda")
	(orientacioSexual heterosexual)
	(sexe dona))

([TVornoTV_Class20] of  Persona

	(nom "Linda Hamilton")
	(sexe dona))

([TVornoTV_Class20000] of  Economia

	(any 2010)
	(descripcio "Documental no sólo sobre las causas, sino también sobre los responsables de la crisis económica mundial de 2008, que signíficó la ruina de millones de personas que perdieron sus hogares y empleos, y, además, puso en peligro la estabilidad económica de los países desarrollados. A través de una extensa investigación y de entrevistas a financieros, políticos y periodistas, se muestra el auge de empresarios sin escrúpulos y la degradación de la política y la educación.")
	(director [TVornoTV_Class20001])
	(duracio 50)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Angles)
	(subtitols FALSE)
	(titol "Inside Job"))

([TVornoTV_Class20001] of  Persona

	(edat 56)
	(nom "Charles Ferguson")
	(sexe home))

([TVornoTV_Class20003] of  Politica

	(any 2008)
	(descripcio "Documental que conmemora el 50 aniversario del ascenso al poder del presidente de los Estados Unidos John F. Kennedy, presentando grabaciones nunca mostradas hasta la fecha con otras más conocidas.")
	(director [TVornoTV_Class30004])
	(duracio 92)
	(ferirSensibilitat FALSE)
	(idioma Angles)
	(subtitols FALSE)
	(titol "A President to Remember. In the Company of John F. Kennedy"))

([TVornoTV_Class20004] of  Naturalesa

	(any 2001)
	(descripcio "David Attenborough nos presenta el ciclo estacional de la Antártida , en cada uno de los seis episodios  examina cómo las especies hacen frente a la vida en el continente antártico durante el año")
	(director [TVornoTV_Class10001])
	(duracio 28)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(tema Mamifers)
	(titol "La vida en el hielo: La carrera para la reproduccion"))

([TVornoTV_Class20005] of  Naturalesa

	(any 2000)
	(descripcio "Científicos observan el apareamiento de distintas especies para descubrir aquello que las hembras buscan en los machos para mejorar su especie.")
	(director [TVornoTV_Class20006])
	(duracio 50)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(tema AnimalsGeneral)
	(titol "Lo que las hembras desean y los machos no dudan en hacer"))

([TVornoTV_Class20006] of  Persona

	(nom "Kevin Bachar"))

([TVornoTV_Class20007] of  Naturalesa

	(any 2002)
	(descripcio "Documental que recoge uno de los acontecimientos más impresionates que se desarrolla entre los meses de Mayo y Julio en el punto donde el Océano Indico y Atlántico se unen (Cape Town): la migración de las sardinas a aguas más cálidas.")
	(director [TVornoTV_Class10151])
	(duracio 52)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols TRUE)
	(tema Peixos)
	(titol "El banquete"))

([TVornoTV_Class20008] of  Serie

	(actorsS
		[TVornoTV_Class20010]
		[TVornoTV_Class20011]
		[TVornoTV_Class20012]
		[TVornoTV_Class20013]
		[TVornoTV_Class20014]
		[TVornoTV_Class20015]
		[TVornoTV_Class20016])
	(any 2010)
	(descripcio "Serie de ciencia ficcio on transcorren dos mons paralels i fenomens mes alla del conegut.")
	(director [TVornoTV_Class20009])
	(duracio 45)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class33])
	(idioma Angles Catala)
	(num_capitol 6)
	(num_temporada 1)
	(resum "En aquest capítol Walter Bishop surt del centre psiquiatric.")
	(subtitols TRUE)
	(titol "Fringe"))

([TVornoTV_Class20009] of  Persona

	(nom "J.J. Abrams"))

([TVornoTV_Class20010] of  Persona

	(nom "Anna Torv")
	(sexe dona))

([TVornoTV_Class20011] of  Persona

	(nom "Joshua Jackson")
	(sexe home))

([TVornoTV_Class20012] of  Persona

	(nom "John Noble")
	(sexe home))

([TVornoTV_Class20013] of  Persona

	(nom "Lance Reddick")
	(sexe home))

([TVornoTV_Class20014] of  Persona

	(nom "Kirk Acevedo")
	(sexe home))

([TVornoTV_Class20015] of  Persona

	(nom "Blair Brown")
	(sexe dona))

([TVornoTV_Class20016] of  Persona

	(nom "Jasika Nicole")
	(sexe dona))

([TVornoTV_Class21] of  Persona

	(nom "Edward Furlong")
	(sexe home))

([TVornoTV_Class22] of  Persona

	(nom "Robert Patrick")
	(sexe home))

([TVornoTV_Class23] of  Persona

	(nom "Earl Boen")
	(sexe home))

([TVornoTV_Class24] of  Persona

	(nom "Joe Morton")
	(sexe home))

([TVornoTV_Class25] of  Persona

	(nom "Michael Biehn")
	(sexe home))

([TVornoTV_Class26] of  Cine

	(actors
		[TVornoTV_Class29]
		[TVornoTV_Class30]
		[TVornoTV_Class31])
	(any 2006)
	(descripcio "Jigsaw kidnaps a doctor to keep him alive while he watches his new apprentice put an unlucky citizen through a brutal test.")
	(director [TVornoTV_Class28])
	(duracio 108)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class27])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Saw III"))

([TVornoTV_Class27] of  Estil

	(nomGenere "Terror"))

([TVornoTV_Class28] of  Persona

	(nom "Darren Lynn Bousman")
	(sexe home))

([TVornoTV_Class29] of  Persona

	(nom "Tobin Bell")
	(sexe home))

([TVornoTV_Class3] of  Persona

	(nom "Juan Antonio Bayona")
	(sexe home))

([TVornoTV_Class30] of  Persona

	(nom "Shawnee Smith")
	(sexe dona))

([TVornoTV_Class30000] of  Ambientacio

	(nomGenere "Oest"))

([TVornoTV_Class30001] of  Cine

	(actors
		[TVornoTV_Class46]
		[TVornoTV_Class30003]
		[TVornoTV_Class40004]
		[TVornoTV_Class40005])
	(any 1966)
	(descripcio "Los protagonistas son tres cazadores de recompensas que buscan un tesoro que ninguno de ellos puede encontrar sin la ayuda de los otros dos. Así que los tres colaboran entre sí, al menos en apariencia.")
	(director [TVornoTV_Class30002])
	(duracio 150)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere
		[TVornoTV_Class30000]
		[TVornoTV_Class17])
	(idioma Italia Angles Espanyol Catala)
	(nacionalitat "Italiana")
	(subtitols TRUE)
	(titol "El bueno, el feo y el malo")
	(versioOriginal FALSE))

([TVornoTV_Class30002] of  Persona

	(nom "Sergio Leone")
	(sexe home))

([TVornoTV_Class30003] of  Persona

	(nom "Lee Van Cleef")
	(sexe home))

([TVornoTV_Class30004] of  Persona

	(edat 87)
	(nom "Robert Drew")
	(sexe home))

([TVornoTV_Class30005] of  Art

	(any 2011)
	(descripcio "Miniserie de cuatro capítulos en la que más de 50 actrices españolas cuentan, a través de entrevistas exclusivas, cómo afrontan su apasionante trabajo. Casi un año de seguimiento exhaustivo por todas las facetas de la profesión: cástings, ensayos, rodajes, entregas de premios, ruedas de prensa, premieres, sesiones fotográficas, promoción de películas, galas, fiestas, festivales...")
	(director [TVornoTV_Class30006])
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(titol "Actrices"))

([TVornoTV_Class30006] of  Persona

	(idiomes Espanyol)
	(nom "Gonzalo Cabrera")
	(sexe home))

([TVornoTV_Class30007] of  Naturalesa

	(any 2011)
	(descripcio "Documental centrado en dos familias de felinos y en cómo se les enseña a los cachorros la forma de afrontar la vida salvaje")
	(director
		[TVornoTV_Class30008]
		[TVornoTV_Class30009])
	(duracio 89)
	(ferirSensibilitat FALSE)
	(idioma Angles)
	(subtitols FALSE)
	(tema Mamifers)
	(titol "African Cats: Kingdom of Courage"))

([TVornoTV_Class30008] of  Persona

	(edat 51)
	(nom "Alastair Fothergill")
	(sexe home))

([TVornoTV_Class30009] of  Persona

	(nom "Keith Scholey")
	(sexe home))

([TVornoTV_Class30010] of  Historia

	(any 2011)
	(descripcio "An African Election is a political documentary that exposes the never-before-seen, nitty-gritty of political electioneering in Africa. It captures the intrigues of political campaigns; the almost carnival like atmosphere that is laced with fear of the unknown and the danger that lurks behind-the-scenes")
	(director
		[TVornoTV_Class30011]
		[TVornoTV_Class30012])
	(duracio 89)
	(epoca Actual)
	(ferirSensibilitat FALSE)
	(idioma Angles)
	(subtitols FALSE)
	(titol "An African Election"))

([TVornoTV_Class30011] of  Persona

	(edat 41)
	(nom "Jarreth J. Merz")
	(sexe home))

([TVornoTV_Class30012] of  Persona

	(nom "Kevin Merz"))

([TVornoTV_Class30013] of  Naturalesa

	(any 2011)
	(descripcio "Erase una vez el corazón del Congo, una especie de grandes simios que no se encuentran en ninguna otra parte, los bonobos. Más inteligentes, mas bromistas y más fascinantes que cualquier otra especie de monos, están sin embargo, en peligro de extinción. Claudine André, que dedica su vida a su defensa, abrió una reserva única en el mundo")
	(director [TVornoTV_Class30014])
	(duracio 90)
	(ferirSensibilitat FALSE)
	(idioma Frances)
	(subtitols FALSE)
	(tema Mamifers)
	(titol "Bonobos"))

([TVornoTV_Class30014] of  Persona

	(edat 63)
	(nom "Alain Tixier")
	(sexe home))

([TVornoTV_Class30015] of  Naturalesa

	(any 2011)
	(descripcio "Born to be Wild 3D es una historia inspirada en el amor, la dedicación y el vínculo importante entre los seres humanos y animales. Esta película documenta los orangutanes huérfanos y los elefantes y la gente extraordinaria que los rescatan y crian. Es una aventura conmovedora que transporta a los espectadores a las selvas de Borneo con el mundialmente famoso primatólogo Dr. Birute Galdikas, y a través de la sabana de Kenya con la famosa autoridad en elefantes Dame Daphne Sheldrick, y veremos cómo ellos y su equipo de rescate, rehabilitan y devuelven a los animales a su hábitat natural")
	(director [TVornoTV_Class30016])
	(duracio 40)
	(ferirSensibilitat FALSE)
	(idioma Angles)
	(subtitols FALSE)
	(tema Mamifers)
	(titol "Born to be wild"))

([TVornoTV_Class30016] of  Persona

	(nom "David Lickley")
	(sexe home))

([TVornoTV_Class30017] of  Art

	(any 2011)
	(descripcio "Es el reflejo de la trayectoria vital y musical de Enrique Bunbury. Un documental que muestra el recorrido del cantante desde sus inicios, pasando por Héroes del Silencio donde empezó su aventura a nivel internacional, para continuar con una extensa producción en solitario que llega hasta su más reciente creación en estudio a través de “Las Consecuencias”. Una carrera de crecimiento artístico y personal motivada por el continuo cambio, no exenta de riesgos, de conflictos que le han llevado siempre a recorrer caminos diferentes e inexplorados")
	(director [TVornoTV_Class30018])
	(duracio 101)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(titol "Bunbury: Porque las cosas cambian"))

([TVornoTV_Class30018] of  Persona

	(nom "Javier Alvero")
	(sexe home))

([TVornoTV_Class30019] of  Actualitat

	(any 2011)
	(descripcio "Documental que resume una amplia entrevista que el escritor Manuel Rivas hizo al ex juez de la Audiencia Nacional Baltasar Garzón. Estreno en el Festival de Berlín de 2011 en la sección \"Eventos especiales\".")
	(director [TVornoTV_Class30020])
	(duracio 87)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(titol "Escuchando al juez Garzon"))

([TVornoTV_Class30020] of  Persona

	(edat 51)
	(idiomes Catala Espanyol)
	(nom "Isabel Coixet")
	(sexe dona))

([TVornoTV_Class30021] of  Economia

	(any 2010)
	(descripcio "La realizadora alemana Cosima Dannoritze dirige esta reveladora historia que explica por qué los productos que compramos duran cada vez menos, detalla la programación de la obsolescencia de los objetos para incrementar el consumo. ¿Existen bombillas eternas? ¿Cómo se puede usar un chip para 'matar' un producto cuando llegue a un determinado número de usos? Éstas y otras muchas preguntas encuentran respuesta en este reportaje, en cuya realización participa RTVE y otras televisiones europeas. El documental ha sido rodado en Cataluña, Francia, Alemania, EE.UU. y Ghana, un país africano que se ha convertido en el vertedero de la 'basura electrónica' de Occidente.")
	(director [TVornoTV_Class30022])
	(duracio 52)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(titol "Comprar, tirar, comprar"))

([TVornoTV_Class30022] of  Persona

	(nom "Cosima Dannoritzer")
	(sexe dona))

([TVornoTV_Class31] of  Persona

	(nom "Angus Macfadyen")
	(sexe home))

([TVornoTV_Class32] of  Cine

	(actors
		[TVornoTV_Class35]
		[TVornoTV_Class36]
		[TVornoTV_Class37]
		[TVornoTV_Class38]
		[TVornoTV_Class39]
		[TVornoTV_Class40]
		[TVornoTV_Class41]
		[TVornoTV_Class42]
		[TVornoTV_Class43]
		[TVornoTV_Class44])
	(any 2009)
	(descripcio "ake Sully, un Infante de Marina veterano de guerra y herido en combate que queda paraplejico, es seleccionado para participar en el programa Avatar ocupando el puesto que, como cientifico, ejercia su hermano gemelo recien fallecido. De esta forma, Jake es trasladado a Pandora, una luna del planeta Polifemo cuya atmosfera es toxica para los humanos y que, ademas de albergar una asombrosa biodiversidad, esta habitada por los na'vi, una raza humanoide de piel azul y con algunos rasgos felinos.[")
	(director [TVornoTV_Class18])
	(duracio 162)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(format 3D)
	(genere [TVornoTV_Class33])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols TRUE)
	(titol "Avatar")
	(versioOriginal TRUE))

([TVornoTV_Class33] of  Estil

	(nomGenere "Ciencia Ficcio"))

([TVornoTV_Class35] of  Persona

	(nom "Sam Worthington")
	(sexe home))

([TVornoTV_Class36] of  Persona

	(nom "Zoe Saldaña")
	(sexe home))

([TVornoTV_Class37] of  Persona

	(nom "Sigourney Weaver")
	(sexe home))

([TVornoTV_Class38] of  Persona

	(nom "Stephen Lang")
	(sexe home))

([TVornoTV_Class39] of  Persona

	(nom "Michelle Rodriguez")
	(sexe dona))

([TVornoTV_Class4] of  Cine

	(actors
		[TVornoTV_Class11]
		[TVornoTV_Class10]
		[TVornoTV_Class12])
	(any 2009)
	(descripcio "Una joven y rebelde holandesa recorre los caminos de Irlanda, convirtiendose en vagabunda por eleccion y disfrutando de la soledad que buscaba en el austero paisaje de Connemara.")
	(director [TVornoTV_Class6])
	(duracio 85)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class5])
	(idioma Espanyol Angles)
	(nacionalitat "Irlanda")
	(subtitols TRUE)
	(titol "Nada Personal"))

([TVornoTV_Class40] of  Persona

	(nom "Giovanni Ribisi")
	(sexe home))

([TVornoTV_Class40000] of  Actualitat

	(any 2011)
	(descripcio "La fractura entre rics i pobres creix a un ritme alarmant a la Xina. El govern intenta corregir aquest desequilibri i arribar a una societat \"harmoniosa\" i \"modestament acomodada\".")
	(director [TVornoTV_Class40001])
	(duracio 60)
	(edatRecomanada 7)
	(ferirSensibilitat TRUE)
	(idioma Catala)
	(subtitols FALSE)
	(titol "Contrastos a la Xina: Els nous rics i els pobres del camp"))

([TVornoTV_Class40001] of  Persona

	(nom "Joan Salvat")
	(sexe home))

([TVornoTV_Class40002] of  Actualitat

	(any 2011)
	(descripcio "La Xina s'està convertint en el nou centre de creixement mundial. El volum de capital que s'hi genera és cada cop més important, i les inversions i compres de grans corporacions estrangeres es multipliquen.")
	(director [TVornoTV_Class40001])
	(duracio 60)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(idioma Catala)
	(subtitols FALSE)
	(titol "El poder de la Xina"))

([TVornoTV_Class40004] of  Persona

	(nom "Eli Wallach")
	(sexe home))

([TVornoTV_Class40005] of  Persona

	(nom "Aldo Giuffrè")
	(sexe home))

([TVornoTV_Class41] of  Persona

	(nom "Joel David Moore")
	(sexe home))

([TVornoTV_Class42] of  Persona

	(edat 60)
	(estatCivil casada)
	(idiomes Espanyol Angles)
	(nom "C. C. H. Pounder")
	(orientacioSexual heterosexual)
	(sexe dona))

([TVornoTV_Class43] of  Persona

	(nom "Wes Studi")
	(sexe home))

([TVornoTV_Class44] of  Persona

	(idiomes Angles)
	(nom "Laz Alonso")
	(sexe home))

([TVornoTV_Class45] of  Cine

	(actors
		[TVornoTV_Class47]
		[TVornoTV_Class48]
		[TVornoTV_Class46]
		[TVornoTV_Class49]
		[TVornoTV_Class50]
		[TVornoTV_Class51])
	(any 1986)
	(descripcio "El sargento Tom Highway (Eastwood) es un adicto al alcohol dispuesto a arruinar su vida personal, sacrificando a su mujer, a sus amigos y su reputacion, con tal de llegar a lo mas alto en la carrera militar. Veterano de las guerras de Vietnam y Corea, vuelve a los Estados Unidos para llevar a cabo una mision nada facil: instruir a un grupo de novatos desmotivados e indisciplinados para convertirlos en autenticos marines. Los reclutas ponen de relieve el anacronismo de Highway, cuyos principios son utiles tan solo en caso de guerra.")
	(director [TVornoTV_Class46])
	(duracio 126)
	(edatRecomanada 16)
	(ferirSensibilitat FALSE)
	(genere [TVornoTV_Class17])
	(idioma Espanyol Angles)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "El sargento de hierro"))

([TVornoTV_Class46] of  Persona

	(edat 81)
	(estatCivil casada)
	(idiomes Angles)
	(nom "Clint Eastwood")
	(orientacioSexual heterosexual)
	(sexe home))

([TVornoTV_Class47] of  Persona

	(estatCivil separada)
	(idiomes Angles)
	(nom "Marsha Mason")
	(orientacioSexual heterosexual)
	(sexe dona))

([TVornoTV_Class48] of  Persona

	(nom "Everett McGill")
	(sexe dona))

([TVornoTV_Class49] of  Persona

	(nom "Bo Svenson")
	(sexe home))

([TVornoTV_Class5] of  Estil

	(nomGenere "Drama"))

([TVornoTV_Class50] of  Persona

	(nom "Mario Van Peebles")
	(sexe home))

([TVornoTV_Class50000] of  Ambientacio

	(nomGenere "Rosa"))

([TVornoTV_Class50001] of  Estil

	(nomGenere "XXX"))

([TVornoTV_Class50002] of  Ambientacio

	(nomGenere "Homosexual"))

([TVornoTV_Class50003] of  Estil

	(nomGenere "Aventura"))

([TVornoTV_Class50004] of  Actualitat

	(any 2011)
	(descripcio "A la població de Feng Jiang, al sud de Xangai, van a parar cada any prop de 2 milions de tones de deixalles metàl·liques i electròniques, provinents del Japó, els Estats Units, Austràlia i Europa.")
	(director [TVornoTV_Class40001])
	(duracio 60)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(idioma Catala)
	(subtitols TRUE)
	(titol "Viure del metall"))

([TVornoTV_Class50005] of  Politica

	(any 2011)
	(descripcio "Els alumnes del darrer any de secundària d'una escola de la ciutat de Chongqing, al centre de la Xina, es preparen durament per accedir a una de les dues universitats més importants de la capital, en competició amb altres 10 milions i mig d'estudiants d'arreu del país.")
	(director [TVornoTV_Class40001])
	(duracio 60)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Catala)
	(subtitols FALSE)
	(titol "Dirigents del futur?"))

([TVornoTV_Class50006] of  Politica

	(any 2011)
	(descripcio "El documental planteja interrogants com ara si la democràcia és un valor universal o si les eleccions comporten necessàriament la manipulació.")
	(director [TVornoTV_Class40001])
	(duracio 60)
	(edatRecomanada 16)
	(ferirSensibilitat FALSE)
	(idioma Catala)
	(subtitols TRUE)
	(titol "Xina: Vota per mi, sisplau."))

([TVornoTV_Class50007] of  Ciencia

	(any 2009)
	(descripcio "¿Sabrías decir cu¿Sabrías decir cuál es el objeto de estudio de la física cuántica o a qué es un cuanto? ¿Has oído hablar alguna vez del ordenador cuántico? Posiblemente no, pero seguro que sí que conoces el láser, la resonancia magnética, o utilizas CD y DVD en tu vida cotidiana. ál es el objeto de estudio de la física cuántica o a qué es un cuanto? ¿Has oído hablar alguna vez del ordenador cuántico? Posiblemente no, pero seguro que sí que conoces el láser, la resonancia magnética, o utilizas CD y DVD en tu vida cotidiana.")
	(director [TVornoTV_Class50008])
	(duracio 51)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(titol "Revolucion cuantica"))

([TVornoTV_Class50008] of  Persona

	(nom "John Matlock")
	(sexe home))

([TVornoTV_Class50009] of  Ciencia

	(any 2011)
	(descripcio "Tras el éxito de su anterior serie documental, Wonders of the Solar System, el profesor Brian Cox vuelve con otra superproducción de la BBC: Wonders of the Universe;")
	(director [TVornoTV_Class50010])
	(duracio 62)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(idioma Angles)
	(subtitols FALSE)
	(titol "Wonders of the Universe"))

([TVornoTV_Class50010] of  Persona

	(nom "Brian Cox")
	(sexe home))

([TVornoTV_Class50012] of  Serie

	(actorsS
		[TVornoTV_Class20010]
		[TVornoTV_Class20011]
		[TVornoTV_Class20012]
		[TVornoTV_Class20013]
		[TVornoTV_Class20014]
		[TVornoTV_Class20015]
		[TVornoTV_Class20016])
	(any 2010)
	(descripcio "Serie de ciencia ficcio on transcorren dos mons paralels i fenomens mes alla del conegut.")
	(director [TVornoTV_Class20009])
	(duracio 45)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class33])
	(idioma Angles Catala)
	(num_capitol 13)
	(num_temporada 2)
	(resum "Olivia dunham es raptada a l'univers paral·lel.")
	(subtitols TRUE)
	(titol "Fringe"))

([TVornoTV_Class50013] of  Serie

	(actorsS
		[TVornoTV_Class20010]
		[TVornoTV_Class20011]
		[TVornoTV_Class20012]
		[TVornoTV_Class20013]
		[TVornoTV_Class20014]
		[TVornoTV_Class20015]
		[TVornoTV_Class20016])
	(any 2010)
	(descripcio "Serie de ciencia ficcio on transcorren dos mons paralels i fenomens mes alla del conegut.")
	(director [TVornoTV_Class20009])
	(duracio 45)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class33])
	(idioma Angles Catala)
	(num_capitol 9)
	(num_temporada 2)
	(resum "Walter Bishop explica per fi els motius del segrest del seu fill.")
	(subtitols TRUE)
	(titol "Fringe"))

([TVornoTV_Class50014] of  Serie

	(actorsS
		[TVornoTV_Class20010]
		[TVornoTV_Class20011]
		[TVornoTV_Class20012]
		[TVornoTV_Class20013]
		[TVornoTV_Class20014]
		[TVornoTV_Class20015]
		[TVornoTV_Class20016])
	(any 2010)
	(descripcio "Serie de ciencia ficcio on transcorren dos mons paralels i fenomens mes alla del conegut.")
	(director [TVornoTV_Class20009])
	(duracio 45)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class33])
	(idioma Angles Catala)
	(num_capitol 22)
	(num_temporada 1)
	(resum "En aquest capitol apareix un trenc entre els dos universos.")
	(subtitols TRUE)
	(titol "Fringe"))

([TVornoTV_Class50015] of  Serie

	(actorsS [TVornoTV_Class50016])
	(any 2010)
	(descripcio "Programa de televisión  español perteneciente al género conocido como late show, conducido por el humorista Andreu Buenafuente y producido por El Terrat")
	(director [TVornoTV_Class50016])
	(duracio 70)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class10072]
		[TVornoTV_Class50017])
	(idioma Espanyol)
	(num_capitol 25)
	(num_temporada 6)
	(resum "Si Piqué tiene un piquetón, Los Piqueras ¿qué tenemos?")
	(subtitols FALSE)
	(titol "Buenafuente"))

([TVornoTV_Class50016] of  Persona

	(idiomes Catala Espanyol)
	(nom "Andreu Buenafuente")
	(sexe home))

([TVornoTV_Class50017] of  Format

	(nomGenere "Show"))

([TVornoTV_Class50018] of  Serie

	(actorsS [TVornoTV_Class50016])
	(any 2010)
	(descripcio "Programa de televisión  español perteneciente al género conocido como late show, conducido por el humorista Andreu Buenafuente y producido por El Terrat")
	(director [TVornoTV_Class50016])
	(duracio 70)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class10072]
		[TVornoTV_Class50017])
	(idioma Espanyol)
	(num_capitol 6)
	(num_temporada 4)
	(resum "El amigo de Berto de pasear al perro")
	(subtitols FALSE)
	(titol "Buenafuente"))

([TVornoTV_Class50019] of  Serie

	(any 1987)
	(descripcio "Doraemon es probablemente uno de los manga más exitosos de la historia, tanto que en Japón  su anime nunca se ha dejado de transmitir por televisión y es un icono de la niñez en todo el mundo.")
	(director [TVornoTV_Class50020])
	(duracio 30)
	(edatRecomanada 3)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class10071])
	(idioma Catala Angles Espanyol Japones)
	(num_capitol 8)
	(num_temporada 1)
	(resum "La guerra espacial den Nobita")
	(subtitols FALSE)
	(titol "Doraemon"))

([TVornoTV_Class50020] of  Persona

	(nom "Tsutomu Shibayama")
	(sexe home))

([TVornoTV_Class51] of  Persona

	(nom "Tom Villard")
	(sexe home))

([TVornoTV_Class52] of  Cine

	(actors
		[TVornoTV_Class55]
		[TVornoTV_Class56]
		[TVornoTV_Class57]
		[TVornoTV_Class58]
		[TVornoTV_Class59])
	(any 2012)
	(descripcio "Biopic de J. Edgar Hoover, que fue nombrado en 1924, a los 29 años, director general del FBI con la intencion de reformar la organizacion. Ocupo dicho cargo hasta su muerte en 1972, y durante su mandato sobrevivio a siete presidentes, alguno de los cuales quiso destituirlo sin conseguirlo. Los archivos que Hoover guardaba celosamente, llenos de secretos inconfesables de muchas personalidades importantes de los Estados Unidos, lo convirtieron en uno de los hombres mas poderosos y temidos de la historia de ese pais.")
	(director [TVornoTV_Class46])
	(duracio 120)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(genere [TVornoTV_Class5])
	(idioma Espanyol)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "J. Edgar"))

([TVornoTV_Class55] of  Persona

	(nom "Leonardo DiCaprio")
	(sexe home))

([TVornoTV_Class56] of  Persona

	(nom "Arnie Hammer")
	(sexe home))

([TVornoTV_Class57] of  Persona

	(nom "Naomi Watts")
	(sexe dona))

([TVornoTV_Class58] of  Persona

	(nom "Judi Dench")
	(sexe dona))

([TVornoTV_Class59] of  Persona

	(nom "Ed Westwick")
	(sexe home))

([TVornoTV_Class6] of  Persona

	(edat 52)
	(idiomes Angles)
	(nom "Urszula Antoniak")
	(sexe dona))

([TVornoTV_Class60] of  Cine

	(actors
		[TVornoTV_Class55]
		[TVornoTV_Class62]
		[TVornoTV_Class63])
	(any 1997)
	(descripcio "En 1996, el cazatesoros Brock Lovett (Bill Paxton) y su equipo exploran los restos del Titanic buscando un collar, el \"Corazon del Mar\". En medio de su busqueda estos descubren un dibujo de una mujer joven reclinada y desnuda, que lleva puesto aquel collar firmado el dia del hundimiento del Titanic. La noticia del descubrimiento del dibujo aparece en television, llamando la atencion una mujer, Rose Dawson Calvert (Gloria Stuart), proxima a los 101 años. Junto a su nieta Lizzy Calvert , vuela hasta el barco de Lovett. Alli les informa de que ella es la mujer del dibujo y les relata sus recuerdos, cuando ella era la joven de 17 años Rose DeWitt Bukater (Kate Winslet).")
	(director [TVornoTV_Class18])
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class5])
	(idioma Espanyol)
	(nacionalitat "EEUU")
	(subtitols FALSE)
	(titol "Titanic"))

([TVornoTV_Class60000] of  Cine

	(any 2003)
	(descripcio "Esta Pelicula contiene imagenes explicitas de sexo, para su visionado debes ser mayor de edad.")
	(duracio 45)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class50001])
	(nacionalitat "Angles")
	(subtitols FALSE)
	(titol "110 por ciento natural")
	(versioOriginal FALSE))

([TVornoTV_Class60001] of  Serie

	(any 2003)
	(descripcio "Actualidad de la prensa del corazón y el mundo de los famosos. La base del programa son los reportajes (mayoritariamente grabados) y en menor medida, las entrevistas.")
	(duracio 45)
	(edatRecomanada 16)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class50000]
		[TVornoTV_Class50017])
	(idioma Espanyol)
	(num_capitol 201)
	(num_temporada 6)
	(resum "Persiguiendo a Isabel Pantoja")
	(subtitols FALSE)
	(titol "Aqui hay tomate"))

([TVornoTV_Class60002] of  Serie

	(any 2003)
	(descripcio "Actualidad de la prensa del corazón y el mundo de los famosos. La base del programa son los reportajes (mayoritariamente grabados) y en menor medida, las entrevistas.")
	(duracio 30)
	(edatRecomanada 16)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class50000]
		[TVornoTV_Class50017])
	(idioma Espanyol)
	(num_capitol 123)
	(num_temporada 5)
	(resum "Entrevista a El Farruquito")
	(subtitols FALSE)
	(titol "Aqui hay tomate"))

([TVornoTV_Class60003] of  Serie

	(any 2003)
	(descripcio "Actualidad de la prensa del corazón y el mundo de los famosos. La base del programa son los reportajes (mayoritariamente grabados) y en menor medida, las entrevistas.")
	(duracio 45)
	(edatRecomanada 16)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class50000]
		[TVornoTV_Class50017])
	(idioma Espanyol)
	(num_capitol 124)
	(num_temporada 5)
	(resum "El secreto de Farruquito")
	(subtitols FALSE)
	(titol "Aqui hay tomate"))

([TVornoTV_Class60004] of  Estil

	(nomGenere "Romantic"))

([TVornoTV_Class60005] of  Estil

	(nomGenere "Musical"))

([TVornoTV_Class60006] of  Estil

	(nomGenere "Melodrama"))

([TVornoTV_Class60007] of  Estil

	(nomGenere "Catastrofe"))

([TVornoTV_Class60008] of  Estil

	(nomGenere "Suspense"))

([TVornoTV_Class60009] of  Estil

	(nomGenere "Fantasia"))

([TVornoTV_Class60010] of  Ambientacio

	(nomGenere "Historic"))

([TVornoTV_Class60011] of  Ambientacio

	(nomGenere "Policiaca"))

([TVornoTV_Class60012] of  Ambientacio

	(nomGenere "Belic"))

([TVornoTV_Class60013] of  Ambientacio

	(nomGenere "Esportiu"))

([TVornoTV_Class60015] of  Ambientacio

	(nomGenere "Culte"))

([TVornoTV_Class60016] of  Ambientacio

	(nomGenere "Espai"))

([TVornoTV_Class62] of  Persona

	(nom "Kate Winslet")
	(sexe dona))

([TVornoTV_Class63] of  Persona

	(nom "Billy Zane")
	(sexe home))

([TVornoTV_Class70001] of  Tecnologia

	(ambit Informatica)
	(any 2008)
	(descripcio "Dedicado a la empresa de Apple y su creacion")
	(director [TVornoTV_Class70002])
	(duracio 83)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols FALSE)
	(titol "Welcome to Macintosh"))

([TVornoTV_Class70002] of  Persona

	(nom "Baca Productions")
	(sexe home))

([TVornoTV_Class70003] of  Naturalesa

	(any 2009)
	(descripcio "Frente el calentamiento climatico, nos habla del futuro de la energia nuclear delante de la importancia de las energias renovables")
	(director [TVornoTV_Class80004])
	(duracio 80)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Frances Espanyol Angles)
	(subtitols FALSE)
	(tema Clima)
	(titol "Energia Nuclear ¿el fin de un tabu?"))

([TVornoTV_Class70004] of  Serie

	(any 2003)
	(descripcio "Actualidad de la prensa del corazón y el mundo de los famosos. La base del programa son los reportajes (mayoritariamente grabados) y en menor medida, las entrevistas.")
	(duracio 45)
	(edatRecomanada 16)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class50000]
		[TVornoTV_Class50017])
	(idioma Espanyol)
	(num_capitol 111)
	(num_temporada 2)
	(resum "Beckham en el vestuario")
	(subtitols FALSE)
	(titol "Aqui hay tomate"))

([TVornoTV_Class70005] of  Serie

	(any 2007)
	(descripcio "Talk show dedicado a la actualidad de la prensa del corazón, producido por Cuarzo Producciones")
	(duracio 45)
	(edatRecomanada 16)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class50000]
		[TVornoTV_Class50017])
	(idioma Espanyol)
	(num_capitol 12)
	(num_temporada 1)
	(resum "En aquest capítol es vulnera l'honor de Pepe Navarro")
	(subtitols FALSE)
	(titol "Donde estas corazon"))

([TVornoTV_Class70006] of  Serie

	(any 2008)
	(descripcio "Talk show dedicado a la actualidad de la prensa del corazón, producido por Cuarzo Producciones")
	(duracio 45)
	(edatRecomanada 16)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class50000]
		[TVornoTV_Class50017])
	(idioma Espanyol)
	(num_capitol 24)
	(num_temporada 2)
	(resum "Baralla entre Maria Patinyo i Belen Esteban")
	(subtitols FALSE)
	(titol "Donde estas corazon"))

([TVornoTV_Class70007] of  Cine

	(any 2003)
	(descripcio "Esta Pelicula contiene imagenes explicitas de sexo, para su visionado debes ser mayor de edad.")
	(duracio 45)
	(edatRecomanada 16)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere
		[TVornoTV_Class50001]
		[TVornoTV_Class50002])
	(nacionalitat "Francesa")
	(subtitols FALSE)
	(titol "Los amigos")
	(versioOriginal FALSE))

([TVornoTV_Class70008] of  Cine

	(any 2006)
	(descripcio "Esta Pelicula contiene imagenes explicitas de sexo, para su visionado debes ser mayor de edad.")
	(duracio 90)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class50001])
	(idioma Angles)
	(nacionalitat "Angles")
	(subtitols FALSE)
	(titol "4 contra 1")
	(versioOriginal FALSE))

([TVornoTV_Class70009] of  Cine

	(any 2009)
	(descripcio "Esta Pelicula contiene imagenes explicitas de sexo, para su visionado debes ser mayor de edad.")
	(duracio 30)
	(edatRecomanada 18)
	(ferirSensibilitat FALSE)
	(format COLOR)
	(genere [TVornoTV_Class50001])
	(idioma Angles)
	(nacionalitat "Angles")
	(subtitols FALSE)
	(titol "Alison")
	(versioOriginal FALSE))

([TVornoTV_Class70011] of  Esports

	(any 2011)
	(descripcio "Mitic partit Barca Madrid de la lliga Champions League")
	(duracio 90)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Catala)
	(subtitols FALSE)
	(titol "Lliga champions Barca-Madrid"))

([TVornoTV_Class70012] of  Esports

	(any 2011)
	(descripcio "Sortida de la regata Barcelona World Race 2011")
	(duracio 45)
	(edatRecomanada 7)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles Catala Frances)
	(subtitols FALSE)
	(titol "Sortida BWR 2011"))

([TVornoTV_Class80004] of  Persona

	(nom "Ana Kwak")
	(sexe dona))

([TVornoTV_Class80005] of  Actualitat

	(any 2008)
	(descripcio "Gigantes corporativos y gobiernos corruptos compiten ya hoy por el control de nuestros suministros de agua que cada vez son mas escasos; nos habla de la crisi mundial por el agua.")
	(duracio 51)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Angles Espanyol)
	(subtitols FALSE)
	(titol "Oro azul, la guerra del agua"))

([TVornoTV_Class80006] of  Actualitat

	(any 2008)
	(descripcio "viene a ser algo así como un curso acelerado sobre los nuevos paradigmas que enfrenta nuestra especie, ante la gran anomalía planetaria denominada Pico del Petróleo y sus implicancias en el futuro de la humanidad")
	(director [TVornoTV_Class80008])
	(duracio 86)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Angles)
	(subtitols TRUE)
	(titol "Punto ciego"))

([TVornoTV_Class80008] of  Persona

	(nom "Adolfo Doring")
	(sexe home))

([TVornoTV_Class80010] of  Actualitat

	(any 2011)
	(descripcio "mostra la perillosa feina dels treballadors que desmunten vaixells a la ciutat portuària de Chittagong, al sud de Blangadesh")
	(director [TVornoTV_Class80011])
	(duracio 80)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Catala Espanyol)
	(subtitols FALSE)
	(titol "Corbs de Ferro"))

([TVornoTV_Class80011] of  Persona

	(nom "Bong- Nam Park")
	(sexe home))

([TVornoTV_Class80012] of  Actualitat

	(any 2004)
	(descripcio "És la història de Basilio Vargas, de 14 anys, i del seu germà Bernardino, de 12, que treballen a les mines de plata de Cerro Rico, a Potosí, Bolívia, que van començar a ser explotades al segle XVI")
	(director
		[TVornoTV_Class80013]
		[TVornoTV_Class80014])
	(duracio 80)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Angles Espanyol Catala)
	(subtitols TRUE)
	(titol "La mina del diable"))

([TVornoTV_Class80013] of  Persona

	(nom "Richard Ladkani")
	(sexe home))

([TVornoTV_Class80014] of  Persona

	(nom "Kief Davidson")
	(sexe home))

([TVornoTV_Class80015] of  Ciencia

	(any 2010)
	(descripcio "El profesor Brian Cox nos invita un viaje a lo largo del Sistema Solar, mostrándonos las maravillas escondidas en cada planeta, satélite, o incluso en el Sol.")
	(director [TVornoTV_Class80017])
	(duracio 75)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Angles Espanyol)
	(subtitols FALSE)
	(titol "Maravillas del Sistema Solar"))

([TVornoTV_Class80016] of  Ciencia

	(any 2006)
	(descripcio "Marcus du Sautoy, Catedrático de Matemáticas de la Universidad de Oxford y uno de los científicos más prestigiosos de Inglaterra nos acerca al fascinante mundo de las matemáticas, a su belleza y a sus secretos.")
	(director [TVornoTV_Class80017])
	(duracio 30)
	(edatRecomanada 15)
	(ferirSensibilitat FALSE)
	(idioma Angles Espanyol Frances)
	(subtitols FALSE)
	(titol "La música de los números primos"))

([TVornoTV_Class80017] of  Persona

	(nom "BBC"))

([TVornoTV_Class80018] of  Ciencia

	(any 2008)
	(descripcio "Los virus han sido considerados grandes amenazas para la humanidad, pero un sorprendente descubrimiento ha puesto de manifiesto su extraordinaria capacidad creadora.")
	(director [TVornoTV_Class80019])
	(duracio 50)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Angles Espanyol Frances)
	(subtitols FALSE)
	(titol "Virus, el origen"))

([TVornoTV_Class80019] of  Persona

	(nom "David Elisco")
	(sexe home))

([TVornoTV_Class80020] of  Naturalesa

	(any 2009)
	(descripcio "nos mostrará qué ocurre cuando las fuerzas de la naturaleza entran en conflicto con el hombre, siendo testigos de sus efectos devastadores.")
	(director [TVornoTV_Class80017])
	(duracio 60)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols FALSE)
	(tema Clima)
	(titol "Los peores desastres del mundo: Tsunamis, olas asesinas"))

([TVornoTV_Class80021] of  Ciencia

	(any 2007)
	(descripcio "Este documental de la BBC muestra los esfuerzos de la comunidad científica por controlar las supertormentas y minimizar sus riesgos, así como el fracaso de algunos intentos de alterar el clima llevados a cabo en el pasado.")
	(director [TVornoTV_Class80017])
	(duracio 50)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles Frances)
	(subtitols FALSE)
	(titol "La ciencia de las supertormentas"))

([TVornoTV_Class80022] of  Ciencia

	(any 2008)
	(descripcio "nos mostrará los secretos de las partículas, su naturaleza y cómo todo lo que nos rodea está formado por átomos.")
	(director [TVornoTV_Class80017])
	(duracio 54)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles Frances Italia)
	(subtitols FALSE)
	(titol "La ilusion de la realidad"))

([TVornoTV_Class80023] of  Ciencia

	(any 2007)
	(descripcio "National Geographic ha viajado por distintos lugares del mundo para mostrarnos las nuevas y gigantescas instalaciones que aprovechan el potencial energético del Sol.")
	(duracio 50)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles Frances)
	(subtitols FALSE)
	(titol "Energía solar: limpia e inagotable"))

([TVornoTV_Class80024] of  Ciencia

	(any 2004)
	(descripcio "Se trata del rascacielos Turning Torso, un edificio que contará con 54 plantas cuando esté acabado y que se retuerce como una barra de regaliz a medida que alcanza altura.")
	(director [TVornoTV_Class80025])
	(duracio 65)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols FALSE)
	(titol "Ingeniería extrema: residencia sueca Turning Torso"))

([TVornoTV_Class80025] of  Persona

	(nom "Peter Frumkin")
	(sexe home))

([TVornoTV_Class80026] of  Ciencia

	(any 1996)
	(descripcio "Este es un viaje fascinante por la generosidad de los mares y por los desiertos de dos mundos increíblemente diferentes, pero intrínsecamente unidos.")
	(director [TVornoTV_Class80027])
	(duracio 40)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles Frances)
	(subtitols FALSE)
	(titol "Un Oasis en el Océano"))

([TVornoTV_Class80027] of  Persona

	(nom "James Neihouse")
	(sexe home))

([TVornoTV_Class80028] of  Economia

	(any 2008)
	(descripcio "Uno de los bancos de inversión más antiguos de Wall Street. En septiembre de 2008 colapsó debido a la crisis hipotecaria del mercado estadounidense arrastrando en su caí­da a otras instituciones financieras.")
	(director [TVornoTV_Class80017])
	(duracio 50)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Angles Espanyol)
	(subtitols FALSE)
	(titol "Los últimos días de Lehman Brothers"))

([TVornoTV_Class80029] of  Economia

	(any 2002)
	(descripcio "Describe y analiza la influencia de la psicología de masas y la propaganda en la creación de la sociedad de consumo del poder político y empresarial del siglo XX.")
	(director [TVornoTV_Class80017])
	(duracio 60)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles Frances Italia)
	(subtitols FALSE)
	(titol "El siglo del individualismo"))

([TVornoTV_Class80030] of  Economia

	(any 2008)
	(descripcio "Para algunos el dinero es la raíz de todo mal, otros en cambio sueñan con que algún día crezca en los árboles. Todo el mundo habla de dinero, la mayoría sueña con tenerlo y sólo algunos pueden malgastarlo.")
	(director [TVornoTV_Class80031])
	(duracio 47)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols TRUE)
	(titol "El poder del dinero"))

([TVornoTV_Class80031] of  Persona

	(nom "Adrian Pennink")
	(sexe home))

([TVornoTV_Class80032] of  Economia

	(any 2011)
	(descripcio "Trata de comprender los orígenes de la crisis financiera.")
	(director [TVornoTV_Class80033])
	(duracio 60)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Angles)
	(subtitols FALSE)
	(titol "The Flaw"))

([TVornoTV_Class80033] of  Persona

	(nom "David Sington")
	(sexe home))

([TVornoTV_Class80034] of  Esports

	(any 2008)
	(descripcio "Indaga en la violencia en el mundo del deporte. Tras una investigación minuciosa del fenómeno y múltiples entrevistas con expertos y afectados, el documental desvela la parte más desconocida de ésta violencia que tiene como escenario final los grandes estadios.")
	(duracio 50)
	(edatRecomanada 13)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles Frances Italia)
	(subtitols FALSE)
	(titol "Violencia en el deporte."))

([TVornoTV_Class80035] of  Esports

	(any 2007)
	(descripcio "Hugo Sánchez nos lleva de la mano a través de la historia de los ‘Merengues Galáctivos’ del Real Madrid.")
	(director [TVornoTV_Class80036])
	(duracio 50)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(titol "El nuevo siglo Blanco"))

([TVornoTV_Class80036] of  Persona

	(nom "Hugo Sánchez")
	(sexe home))

([TVornoTV_Class80037] of  Esports

	(any 2008)
	(descripcio "Trata sobre la vida y la ficción del baloncesto de Michael Jordan")
	(duracio 50)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols FALSE)
	(titol "Michael Jordan"))

([TVornoTV_Class80038] of  Serie

	(actorsS
		[TVornoTV_Class80040]
		[TVornoTV_Class80041])
	(any 2009)
	(descripcio "La serie gira en torno a tres familias que están relacionadas entre sí a través de Jay Pritchett, su hijo Mitchell Pritchett y su hija Claire Dunphy. Cada uno de los tres núcleos familiares responde a un modelo de familia diferente")
	(director [TVornoTV_Class80039])
	(duracio 22)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class10072])
	(idioma Espanyol Angles)
	(num_capitol 5)
	(num_temporada 1)
	(resum "Coal Digger")
	(subtitols FALSE)
	(titol "Modern Family"))

([TVornoTV_Class80039] of  Persona

	(nom "Christopher Lloyd")
	(sexe home))

([TVornoTV_Class80040] of  Persona

	(nom "Ed O'Neill")
	(sexe home))

([TVornoTV_Class80041] of  Persona

	(nom "Sofia Vergara")
	(sexe dona))

([TVornoTV_Class80042] of  Serie

	(actorsS
		[TVornoTV_Class80040]
		[TVornoTV_Class80041])
	(any 2009)
	(descripcio "La serie gira en torno a tres familias que están relacionadas entre sí a través de Jay Pritchett, su hijo Mitchell Pritchett y su hija Claire Dunphy. Cada uno de los tres núcleos familiares responde a un modelo de familia diferente")
	(director [TVornoTV_Class80039])
	(duracio 22)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class10072])
	(idioma Espanyol Angles)
	(num_capitol 3)
	(num_temporada 2)
	(resum "The Kiss")
	(subtitols FALSE)
	(titol "Modern Family"))

([TVornoTV_Class80043] of  Serie

	(actorsS
		[TVornoTV_Class80040]
		[TVornoTV_Class80041])
	(any 2009)
	(descripcio "La serie gira en torno a tres familias que están relacionadas entre sí a través de Jay Pritchett, su hijo Mitchell Pritchett y su hija Claire Dunphy. Cada uno de los tres núcleos familiares responde a un modelo de familia diferente")
	(director [TVornoTV_Class80039])
	(duracio 22)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class10072])
	(idioma Espanyol Angles)
	(num_capitol 24)
	(num_temporada 1)
	(resum "Family Portrait")
	(subtitols FALSE)
	(titol "Modern Family"))

([TVornoTV_Class80044] of  Serie

	(actorsS
		[TVornoTV_Class80045]
		[TVornoTV_Class80046])
	(any 2005)
	(descripcio "un delincuente de poca monta sin respeto por nada ni por nadie, que nada más ganar $100.000 en la lotería de un boleto comprado con dinero robado, pierde el boleto al ser atropellado por un coche. Mientras se encuentra convaleciente en el hospital su mujer le hace firmar el divorcio, y es entonces cuando, a través de la televisión, descubre el karma")
	(director [TVornoTV_Class80047])
	(duracio 21)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class10072])
	(idioma Angles Espanyol)
	(num_capitol 2)
	(num_temporada 1)
	(resum "Quit Smoking")
	(subtitols TRUE)
	(titol "My name is Earl"))

([TVornoTV_Class80045] of  Persona

	(nom "Jason Lee")
	(sexe home))

([TVornoTV_Class80046] of  Persona

	(nom "Ethan Suplee")
	(sexe home))

([TVornoTV_Class80047] of  Persona

	(nom "Greg Garcia")
	(sexe home))

([TVornoTV_Class80048] of  Serie

	(actorsS
		[TVornoTV_Class80045]
		[TVornoTV_Class80046])
	(any 2005)
	(descripcio "un delincuente de poca monta sin respeto por nada ni por nadie, que nada más ganar $100.000 en la lotería de un boleto comprado con dinero robado, pierde el boleto al ser atropellado por un coche. Mientras se encuentra convaleciente en el hospital su mujer le hace firmar el divorcio, y es entonces cuando, a través de la televisión, descubre el karma")
	(director [TVornoTV_Class80047])
	(duracio 21)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class10072])
	(idioma Angles Espanyol)
	(num_capitol 4)
	(num_temporada 1)
	(resum "Faked My Own Death")
	(subtitols TRUE)
	(titol "My name is Earl"))

([TVornoTV_Class80049] of  Serie

	(actorsS
		[TVornoTV_Class80045]
		[TVornoTV_Class80046])
	(any 2005)
	(descripcio "un delincuente de poca monta sin respeto por nada ni por nadie, que nada más ganar $100.000 en la lotería de un boleto comprado con dinero robado, pierde el boleto al ser atropellado por un coche. Mientras se encuentra convaleciente en el hospital su mujer le hace firmar el divorcio, y es entonces cuando, a través de la televisión, descubre el karma")
	(director [TVornoTV_Class80047])
	(duracio 21)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class10072])
	(idioma Angles Espanyol)
	(num_capitol 8)
	(num_temporada 1)
	(resum "Joy's Wedding")
	(subtitols TRUE)
	(titol "My name is Earl"))

([TVornoTV_Class80050] of  Serie

	(actorsS
		[TVornoTV_Class80053]
		[TVornoTV_Class80054]
		[TVornoTV_Class80055])
	(any 2007)
	(descripcio "La serie comienza con la llegada de Penny, aspirante a actriz, al apartamento vecino que comparten Sheldon y Leonard, dos físicos, que trabajan en el Instituto Tecnológico de California (Caltech). Leonard se enamora desde el primer momento de Penny.")
	(director [TVornoTV_Class80052])
	(duracio 21)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class10072])
	(idioma Espanyol Angles)
	(num_capitol 3)
	(num_temporada 1)
	(resum "The Fuzzy Boots Corollary")
	(subtitols FALSE)
	(titol "The Big Bang Theory"))

([TVornoTV_Class80052] of  Persona

	(nom "Chuck Lorre")
	(sexe home))

([TVornoTV_Class80053] of  Persona

	(nom "Johnny Galecki")
	(sexe home))

([TVornoTV_Class80054] of  Persona

	(nom "Jim Parsons")
	(sexe home))

([TVornoTV_Class80055] of  Persona

	(nom "Kaley Cuoco")
	(sexe home))

([TVornoTV_Class80056] of  Serie

	(actorsS
		[TVornoTV_Class80053]
		[TVornoTV_Class80054]
		[TVornoTV_Class80055])
	(any 2007)
	(descripcio "La serie comienza con la llegada de Penny, aspirante a actriz, al apartamento vecino que comparten Sheldon y Leonard, dos físicos, que trabajan en el Instituto Tecnológico de California (Caltech). Leonard se enamora desde el primer momento de Penny.")
	(director [TVornoTV_Class80052])
	(duracio 21)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class10072])
	(idioma Espanyol Angles)
	(num_capitol 8)
	(num_temporada 1)
	(resum "The Grasshopper Experiment")
	(subtitols FALSE)
	(titol "The Big Bang Theory"))

([TVornoTV_Class80057] of  Serie

	(actorsS
		[TVornoTV_Class80053]
		[TVornoTV_Class80054]
		[TVornoTV_Class80055])
	(any 2007)
	(descripcio "La serie comienza con la llegada de Penny, aspirante a actriz, al apartamento vecino que comparten Sheldon y Leonard, dos físicos, que trabajan en el Instituto Tecnológico de California (Caltech). Leonard se enamora desde el primer momento de Penny.")
	(director [TVornoTV_Class80052])
	(duracio 21)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(genere_serie [TVornoTV_Class10072])
	(idioma Espanyol Angles)
	(num_capitol 16)
	(num_temporada 1)
	(resum "The Peanut Reaction")
	(subtitols FALSE)
	(titol "The Big Bang Theory"))

([TVornoTV_Class80058] of  Serie

	(actorsS
		[TVornoTV_Class80061]
		[TVornoTV_Class80062])
	(any 2005)
	(descripcio "La trama de la serie gira en torno a un hombre sentenciado a la pena de muerte y el elaborado plan de su hermano para salvarlo de la misma")
	(director [TVornoTV_Class80059])
	(duracio 45)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class5]
		[TVornoTV_Class17]
		[TVornoTV_Class60008])
	(idioma Espanyol Angles)
	(num_capitol 6)
	(num_temporada 2)
	(resum "Subdivision")
	(subtitols FALSE)
	(titol "Prison Break"))

([TVornoTV_Class80059] of  Persona

	(nom "Paul Scheuring")
	(sexe home))

([TVornoTV_Class80061] of  Persona

	(nom "Dominic Purcell")
	(sexe home))

([TVornoTV_Class80062] of  Persona

	(nom "Wentworth Miller")
	(sexe home))

([TVornoTV_Class80063] of  Serie

	(actorsS
		[TVornoTV_Class80064]
		[TVornoTV_Class80065])
	(any 2004)
	(descripcio "Debido a diversos problemas ocurridos durante el vuelo, el avión tuvo que desviar su trayectoria después de haber perdido las comunicaciones. Esto deja a un grupo de supervivientes en una isla en medio de la nada.")
	(director [TVornoTV_Class80066])
	(duracio 43)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class50003]
		[TVornoTV_Class5]
		[TVornoTV_Class33])
	(idioma Angles Espanyol)
	(num_capitol 10)
	(num_temporada 1)
	(resum "All The Best Cowboys Have Daddy Issues")
	(subtitols FALSE)
	(titol "Lost"))

([TVornoTV_Class80064] of  Persona

	(nom "Adewale Akinnuoye")
	(sexe home))

([TVornoTV_Class80065] of  Persona

	(nom "Matthew Fox")
	(sexe home))

([TVornoTV_Class80066] of  Persona

	(nom "Jeffrey Lieber")
	(sexe home))

([TVornoTV_Class80067] of  Serie

	(any 1987)
	(descripcio "La serie es una sátira de la sociedad estadounidense que narra la vida y el día a día de una familia de clase media de ese país (cuyos miembros son Homer, Marge, Bart, Lisa y Maggie Simpson) que vive en un pueblo ficticio llamado Springfield.")
	(director [TVornoTV_Class80068])
	(duracio 24)
	(edatRecomanada 8)
	(ferirSensibilitat FALSE)
	(genere_serie
		[TVornoTV_Class10071]
		[TVornoTV_Class10072])
	(idioma Espanyol Angles Frances Italia Japones)
	(num_capitol 8)
	(num_temporada 4)
	(resum "Marge se va de casa.")
	(subtitols FALSE)
	(titol "Los Simpson"))

([TVornoTV_Class80068] of  Persona

	(nom "Matt Groening")
	(sexe home))

([TVornoTV_Class80069] of  Persona

	(nom "Dan Castellaneta")
	(sexe home))

([TVornoTV_Class80070] of  Historia

	(any 1985)
	(descripcio "La Guerra de Yom Kipur, un episodio más del conflicto arabo-israelí. La última guerra total entre Israel, Egipto y Siria. Egipto y Siria lanzaron una ofensiva militar por sorpresa contra Israel coincidiendo con la festividad hebrea del Yom Kipur.")
	(director [TVornoTV_Class80017])
	(duracio 45)
	(edatRecomanada 12)
	(epoca Moderna)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols TRUE)
	(titol "La Guerra de Yom Kippur"))

([TVornoTV_Class80071] of  Historia

	(any 1996)
	(descripcio "Se nos suele enseñar, y transmitimos los horrores del nazismo. Pero no siempre somos conscientes que este movimiento procede de una lenta cocción desde la génesis de la modernidad, si no antes ya que las divisiones en la historia suelen ser arbitrarias.")
	(director [TVornoTV_Class30012])
	(duracio 60)
	(edatRecomanada 18)
	(epoca Actual)
	(ferirSensibilitat TRUE)
	(idioma Espanyol)
	(subtitols FALSE)
	(titol "La Industrializacion de la guerra"))

([TVornoTV_Class80072] of  Historia

	(any 1999)
	(descripcio "Un repaso a 42 casos documentados de intentos y planes de asesinar a una de las personas más temidas y despreciadas del siglo XX, un recorrido a los más extravagantes e ingeniosos intentos de asesinatos al Führer de Alemania.")
	(duracio 45)
	(edatRecomanada 15)
	(epoca SegleXX)
	(ferirSensibilitat TRUE)
	(idioma Espanyol Angles)
	(subtitols TRUE)
	(titol "42 formas de matar a Hitler"))

([TVornoTV_Class80073] of  Historia

	(any 1960)
	(descripcio "Las maravillas de China")
	(duracio 45)
	(edatRecomanada 12)
	(epoca Romanticisme)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles Frances Italia)
	(subtitols FALSE)
	(titol "La belleza en la Antigüedad: China"))

([TVornoTV_Class80074] of  Politica

	(any 2006)
	(descripcio "El muro de hierro es un documental realizado en 2006 sobre el establecimiento de asentamientos por parte de Israel en Cisjordania. El documental afirma que es una estrategia para la ocupación permanente del territorio.")
	(duracio 52)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols FALSE)
	(titol "El muro de hierro"))

([TVornoTV_Class80075] of  Politica

	(any 2003)
	(descripcio "El hilo conductor del programa son las entrevistas a personajes con capacidad para conocer lo que ocurriría si una tragedia golpease a alguna de las ciudades más importantes de EE UU. Altos mandos militares, científicos, políticos o policías de calle, ellos son quienes deben trabajar codo con codo para llevar a cabo el plan.")
	(duracio 90)
	(edatRecomanada 13)
	(ferirSensibilitat TRUE)
	(idioma Espanyol Angles)
	(subtitols FALSE)
	(titol "El dia despues del desastre"))

([TVornoTV_Class80076] of  Art

	(any 2002)
	(descripcio "Desvela como el arte barroco inglés tuvo su clímax con Christopher Wren y la icónica Catedral de San Pablo.")
	(duracio 74)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols TRUE)
	(titol "El Barroco"))

([TVornoTV_Class80077] of  Art

	(any 1997)
	(descripcio "Seguiremos el robo de algunas reliquias egipcias del Museo Británico de Londres y la desaparición de dos Rubens de una galería del norte de España.")
	(duracio 30)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(idioma Espanyol)
	(subtitols FALSE)
	(titol "Los grandes robos de arte"))

([TVornoTV_Class80078] of  Art

	(any 1995)
	(descripcio "Gran pintor del mundo")
	(duracio 45)
	(edatRecomanada 6)
	(ferirSensibilitat FALSE)
	(idioma Angles)
	(subtitols FALSE)
	(titol "Picasso"))

([TVornoTV_Class80079] of  Art

	(any 1992)
	(descripcio "La iglesa de Santa Sofia")
	(duracio 40)
	(edatRecomanada 12)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols FALSE)
	(titol "Antiguas superestructuras"))

([TVornoTV_Class80080] of  Tecnologia

	(ambit Telecomunicacions)
	(any 2006)
	(descripcio "La fantasia se hace realidad")
	(duracio 45)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols FALSE)
	(titol "Tecnologia del futuro"))

([TVornoTV_Class80081] of  Tecnologia

	(ambit Mecanica)
	(any 1998)
	(descripcio "Avances tecnologicos de entretenimiento, productividad y antomatizacion en la industria automotriz.")
	(duracio 40)
	(edatRecomanada 10)
	(ferirSensibilitat FALSE)
	(idioma Espanyol Angles)
	(subtitols FALSE)
	(titol "El automovil"))

)
;;FI INSTANCIES


;;****************************************************************************************************************************************************
;;*   MODULS     ******************************************************************************************************************
;;****************************************************************************************************************************************************

;;;
;;; MODUL INICI
;;;
(defmodule MAIN (export ?ALL))

;;***********************************************************************************************************************************************INICI
;;; Template que emmagatzema el tipus d'usuari
(deftemplate usuari
    (slot edat)
    (slot sexe)
    (slot estat-civil)
	(multislot idiomes)
    (slot orientacio-sexual)
    (slot discapacitat-audiovisual)
)
;;; Inicialitzem el sistema amb un usuari desconegut
(deffacts tipus-usuari
    (usuari
        (edat -1)
        (sexe desconegut)
        (estat-civil desconegut)
		(idiomes (create$))
        (orientacio-sexual desconegut)
		(discapacitat-audiovisual desconegut)
	
    )
)
;;; Template que emmagatzema un contingut de tipus cine i la seva puntuacio
(deftemplate contingut-amb-puntuacio
    (slot titol)
    (slot puntuacio)
)

;;; Template que emmagatzema un contingut de tipus documental i la seva puntuacio
(deftemplate genere-amb-puntuacio
    (slot nom-genere)
    (slot puntuacio)
)


;;; FUNCIONS
;;; Obte una resposta a la pregunta d'entre un conjunt de possibles valors
(deffunction pregunta (?pregunta $?valors)
    (printout t crlf ?pregunta)
    (bind ?resposta (read))
    (while (not (member ?resposta ?valors)) do
        (printout t ?pregunta)
        (bind ?resposta (read))
    )
    ?resposta
)
;;; Fa una pregunta a la que s'ha de respondre "si" o "no"
(deffunction si-o-no (?question)
   (bind ?response (pregunta ?question si no s n))
   (if (or (eq ?response si) (eq ?response s))
       then TRUE 
       else FALSE))


;;; Fa una pregunta a la que s'ha de respondre "gens", "poc", "normal", "molt" O "extrem"
(deffunction pregunta-sino-multiple (?pregunta)
	(bind ?resposta (pregunta (str-cat ?pregunta "(gens,poc,normal,molt,extrem) ") gens poc normal molt extrem))
	?resposta
)

;;; Fa una pregunta a la qual se li ha de respondre un numero
(deffunction obte-nombre (?question)
    (printout t crlf ?question)
    (bind ?answer (read))
    (while (not (integerp ?answer))
        (printout t ?question)
        (bind ?answer (read))
    )
    ?answer
)

;;;Fa una pregunta sobre una llista d’elements
(deffunction pregunta-llista (?pregunta)
        (printout t crlf ?pregunta)
    	;Llegim una línea sencera (Ex. "Pasta Marisc Fruita")
	(bind ?resposta (readline))
	;Separem l’string (Ex. "Pasta" "Marisc" "Fruita")
	(bind ?res (str-explode ?resposta))
	;Retornem els diferents camps (Ex. "Pasta" "Marisc" "Fruita")
	?res
)

;;Funcio que retorna TRUE si cap element de la llista1 es dins la llista2.
(deffunction algun-de-llista1-esdins-llista2 (?llista1 ?llista2)
    (bind ?result FALSE)
    (bind ?i 1)
    (while (<= ?i (length$ $?llista1))
	do
		(bind ?llista1Actual (nth$ ?i $?llista1))
		(bind ?j 1)
		(while (<= ?j (length$ $?llista2))
			(bind ?llista2Actual (nth$ ?j $?llista2))
			(if (= (str-compare llista1Actual llista2Actual) 0)
				then
				(bind ?result TRUE)
				(break))	
			(bind ?j (+ ?j 1))	
		)
		(bind ?i (+ ?i 1))
    )
    ?result
)


;;; Fa una pregunta a la qual se li ha de respondre un numero en un rang
;;; Obte una llista de continguts de una categoria determinada
;;; Obte una llista de continguts d'una duració determinada
;;; Actualitza les satisfaccions d'una recomanacio

;;; REGLES
(defrule presentacio "Regla inicial de presentacio"
	(declare (salience 20))
	=>
	(printout t crlf)
	(printout t "+---------------------------------------------------+" crlf)
	(printout t "|                                                   |" crlf)
	(printout t "|                    TVornoTV                       |" crlf)
	(printout t "|      Sistema de recomanacio de continguts         |" crlf)
	(printout t "|                                                   |" crlf)
	(printout t "+---------------------------------------------------+" crlf)
	
    (focus preguntes-definir-usuari)
)




;;;
;;; 1.1 MODUL DE PREGUNTES PER DEFINIR L'USUARI
;;;
(defmodule preguntes-definir-usuari "Modul de preguntes per definir tipus d'usuari"
    (import MAIN ?ALL)
    (export ?ALL)
)
;;*************************************************************************************************************************************DEFINIR L'USUARI
;; Regla que inicialitza els templates (va aqui??)
(defrule inicialitza-cine-puntuacions
	(declare (salience 10))
	?contingut <- (object (is-a Cine))
	=>
	(assert
		(contingut-amb-puntuacio
			(titol (send ?contingut get-titol))
			(puntuacio 0)
		)
	)
)

(defrule inicialitza-serie-puntuacions
	(declare (salience 10))
	?contingut <- (object (is-a Serie))
	=>
	(assert
		(contingut-amb-puntuacio
			(titol (send ?contingut get-titol))
			(puntuacio 0)
		)
	)
)
(defrule inicialitza-documental-puntuacions
	(declare (salience 10))
	?contingut <- (object (is-a Documental))
	=>
	(assert
		(contingut-amb-puntuacio
			(titol (send ?contingut get-titol))
			(puntuacio 0)
		)
	)
)

(defrule inicialitza-generes-puntuacions
	(declare (salience 10))
	?genere <- (object (is-a Genere))
	=>
	(assert
		(genere-amb-puntuacio
			(nom-genere (send ?genere get-nomGenere))
			(puntuacio 0)
		)
	)
)

(defrule inicialitza-tipus-docus-puntuacions
	(declare (salience 10))
	?docus <- (object (is-a Documental))
	=>
;; 	(printout t (str-cat (class ?docus)) crlf)
	(assert
		(genere-amb-puntuacio
			(nom-genere (str-cat (class ?docus)))
			(puntuacio 0)
		)
	)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PROVES PROVES PROVES

(defglobal 
	?*llista-CP* = (create$)
	;;provant...millor amb una instància??
	?*llista-dies* = (create$  (create$ a b)(create$ c d)(create$ e f)(create$)(create$)(create$)(create$))
	
	?*maxi* =  0
	?*mini* = 0
	
)
(defrule getMax
	(declare (salience 9))
	?cont <- (contingut-amb-puntuacio (titol ?titol-cont) (puntuacio ?punts-cont&: (> ?punts-cont ?*maxi*))) 
    =>
	;;Agafem maxims i minims
    	(bind ?*maxi* ?punts-cont)
;;	(printout t ?titol-cont ?*maxi* crlf)
)
(defrule getMin
	(declare (salience 9))
	?cont <- (contingut-amb-puntuacio (titol ?titol-cont) (puntuacio ?punts-cont&: (< ?punts-cont ?*mini*))) 
    =>
	;;Agafem maxims i minims
    	(bind ?*mini* ?punts-cont)
;;	(printout t ?titol-cont ?*mini* crlf)
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PROVES PROVES PROVES

;;; Quina edat tens? (0-120)
(defrule determinar-edat
    ?u <- (usuari (edat -1))
    =>
    (bind ?edatLlegida (obte-nombre "Quina edat tens? "))
    (modify ?u (edat ?edatLlegida))
	(assert(edat-ja-preguntada TRUE))
)
;;; Ets home o dona? (home, dona)
(defrule determinar-sexe
	(edat-ja-preguntada TRUE)
    ?u <- (usuari (sexe desconegut))
    =>
    (bind ?sexeLlegit (pregunta (str-cat "Ets home o dona? (home/dona) ") home dona))
    (modify ?u (sexe ?sexeLlegit))
	(assert(sexe-ja-preguntat TRUE))
)
;;; Quin és el teu estat civil? (casat, separat, divorciat, solter, ajuntat)
(defrule determinar-estat-civil
    ?u <- (usuari (estat-civil desconegut))
    =>
    (bind ?estatCivilLlegit(pregunta (str-cat "Quin es el teu estat civil? (casat/separat/divorciat/solter/ajuntat) ") casat separat divorciat solter ajuntat))
    (modify ?u (estat-civil ?estatCivilLlegit))
)
;;; Posa en ordre els idiomes que entenguis? (cat, esp, fra, it, en, jp)
(defrule determinar-ordre-idiomes
	?u <- (usuari (idiomes $?llistaIdiomes))
	(test (= 0 (length$ $?llistaIdiomes)))
	=>
	(bind ?llista (pregunta-llista "Posa en ordre de mes a menys els idiomes que entenguis: (cat, esp, fra, it, en, jp) "))
	(modify ?u (idiomes ?llista))
)

;;; Tens alguna discapacitat audiovisual? (no, auditiva, visual)
(defrule determinar-discapacitat-audiovisual
    ?u <- (usuari (discapacitat-audiovisual desconegut))
    =>
    (bind ?discapacitatLlegida(pregunta (str-cat "Tens alguna discapacitat audiovisual? (no/auditiva/visual)") no auditiva visual))
    (modify ?u (discapacitat-audiovisual ?discapacitatLlegida))
)
;;; Orientació sexual? (homosexual, heterosexual)
(defrule determinar-orientacio-sexual
    ?u <- (usuari (orientacio-sexual desconegut))
    =>
    (bind ?orientSexualLlegida (pregunta (str-cat "Orientacio sexual? (homosexual/heterosexual) ") homosexual heterosexual))
    (modify ?u (orientacio-sexual ?orientSexualLlegida))
)
;;; Saltem al modul de les preguntes comunes
(defrule a-preguntes-comunes
	(declare (salience -1))
	=>
	(focus preguntes-comunes)
)
;;;
;;; 1.2 MODUL DE PREGUNTES COMUNES
;;;
(defmodule preguntes-comunes "Modul de preguntes comunes"
    (import preguntes-definir-usuari ?ALL)
    (export ?ALL)
)
;;Mitjançant les seguents preguntes, podrem deduir el nivell intelectual de l'usuari, aixi com la seva vocacio
;;i treball. Gracies a aixo podrem saber per exemple alguns documentals que li podrien agradar, tot i que no
;;haurem d'abusar molt, si es que no li agrada el que fa.
;;**********************************************************************************************************************************************COMUNES
;;Tens estudis o estudies? (si,no)
(defrule pregunta-estudia
	=>
	(assert (te-estudis ( si-o-no "Tens estudis o estudies? " )))
)

;;;;Si->I els teus estudis que son, de lletres, de ciencia, de tecnologia o d'art? (lletres, ciencia, tecnologia, art)
(defrule pregunta-estudis-de-que-son
	(te-estudis TRUE)
	=>
	(assert (que-estudia (pregunta "Els teus estudis de que tracten, de lletres, ciencia, tecnologia o art? " lletres ciencia tecnologi art)))
)


;;Treballes? (si,no)
(defrule pregunta-treballa
        (usuari (edat ?e))
	=>
	(if (< ?e 16) then (assert (te-treball FALSE))
	else
	(assert (te-treball ( si-o-no "Treballes actualment? " )))
	)
)

;;;;Si no té estudis
;;;;En quin sector treballes? (construccio, legal, politic, economic, tecnologic, cientific, artistic, altres)
(defrule pregunta-tipus-treball
	(te-treball TRUE)
	=>
	(assert (treball-relacionat-amb (pregunta "Quin tipus de treball es? (construccio,legal,politic,economic,lletres,tecnologia,ciencia,art,altres) " construccio legal politic economic lletres tecnologia ciencia art altres)))
)

;;T'agrada el que fas? (si,no)
(defrule pregunta-agrada-treball
	(te-treball TRUE)
	=>
	(assert (agrada-treball ( pregunta-sino-multiple "Quant t'agrada la teva feina? " )))
)

;;De la seguent pregunta podem deduir si li agrada la politica, l'actualitat, les noticies.
;;Recentment hi ha un conflicte belic amb les tropes de Muamar el Gadafi, t'ha interesat el tema? (gens, poc, normal, molt, extremis)
(defrule pregunta-gadafi
	=>
	(assert (interessat-gadafi ( pregunta-sino-multiple "Recentment hi ha un conflicte belic amb les tropes de Muamar el Gadafi, t'ha interesat el tema? " )))
)

;;;Podem posar-hi documentals de ciencia i medi ambient
;;Et preocupa la radiacio deguda a la fuga de Fukushima? (si, no, ns)
(defrule pregunta-fukushima
	=>
	(assert (interessat-fukushima ( pregunta-sino-multiple "Et preocupa la radiacio deguda a la fuga de Fukushima? " )))
)

;;;Sabem que te temps i que li agraden els "cotilleos", corazon, i programes amb poc contingut intel·lectual.
;;Has seguit la boda real de Guillermo i Kate? (si,no)
(defrule pregunta-bodareal
	=>
	(assert (interessat-boda-real ( si-o-no "Has seguit la boda real de Guillermo i Kate? " )))
)

;;Saps qui és la Princesa del Pueblo? (si,no.. resposta: es la belen esteban)
(defrule pregunta-belenesteban
	=>
	(assert (coneix-belen-esteban ( si-o-no "Saps qui es la Princesa del Pueblo? " )))
)

;;;D'aqui podem deduir si es una persona mes practica o teorica i per tant si li interessa mes per exemple les lletres o la tecnologia.
;;Tens vehicle propi? (si,no)
(defrule pregunta-vehicle
	(usuari (edat ?e))
	=>
	(if (< ?e 14) then (assert (te-vehicle FALSE))
	else
	(assert (te-vehicle ( si-o-no "Tens vehicle propi? " )))
	)
)

;;Si te algun problema no molt greu, faries mai cap reparacio tu mateix (1), o el portaries al mecanic (2)? (1,2)
(defrule pregunta-vehicle-reparacio
	(te-vehicle TRUE)
	=>
	(if (eq (obte-nombre "Si aquest vehicle te algun problema no molt greu, faries mai cap reparacio tu mateix (1), o el portaries al mecanic (2)? ") 1)
	  then
	  (assert (es-practic TRUE))
	  else
  	  (assert (es-practic FALSE)))
)


;;;D'aquesta pregunta podem deduir si 1:Interessat en oci in-door (xbox, pelicules, callejeros), 2:Interessat en oci out-of-door, 3:Molt estudios, in-door, 4:varietat
;;Els caps de semana, habitualment... surts de festa (1), disfrutes de la natura (2), aprofites per estudiar o aprendre coses pel teu compte (3), una mica de tot (4)
(defrule pregunta-oci
	=>
	(bind ?valorOci (obte-nombre "Els caps de semana, habitualment... surts de festa (1), disfrutes de la natura (2), aprofites per estudiar o aprendre coses pel teu compte (3), una mica de tot (4)? "))
	(if (eq ?valorOci 1) then (assert (oci festa)))
	(if (eq ?valorOci 2) then (assert (oci natura)))
	(if (eq ?valorOci 3) then (assert (oci estudiar)))
	(if (eq ?valorOci 4) then (assert (oci general)))
)


;;;Li agrada l'acció.
;;De petit, a l'estiu, jugaves amb pistoles d'aigua?(si,no)
(defrule pregunta-pistolesaigua
	=>
	(assert (jugava-pistoles-aigua ( si-o-no "De petit, a l'estiu, jugaves o jugues amb pistoles d'aigua? " )))
)

;;;Te certa aficio pels animals.
;;Tens mascotes?
(defrule pregunta-mascotes
	=>
	(assert (te-mascota ( si-o-no "Tens mascotes? " )))
)

;;;;Refinem el contingut dels documentals
;;Les teves aficions, es centren en temes de mar, de muntanya, tecnologia, lectura, societat, altres?
(defrule pregunta-aficions
	=>
	(assert (aficions (pregunta "Les teves aficions, es centren en temes de mar, muntanya, tecnologia, lectura, societat, altres? " mar muntanya tecnologia lectura societat altres)))
)

;;;;Refinem encara més les preferencies de Animacio, Accio, Politica, Economia, Oci->Ciencia ficcio, Oci->Comedia, Romantica, etc.
;;Si et dono a triar entre 1:Bambi, 2:Terminator II, 3:El discurso del Rei, 4:Perdidos, 5:Buenafuente, 6:Sexo en nueva york, 7:Brokeback Mountain, amb quin ordre de preferencia
;;les col·locaries? (1,2,3,4,5,6,7)
(defrule pregunta-ordre-pelis
	=>
	(bind ?llista (pregunta-llista "Si et dono a triar entre 1:Bambi, 2:Terminator II, 3:El discurso del Rei, 4:Perdidos, 5:Buenafuente, 6:Sexo en nueva york, 7:Brokeback Mountain, amb quin ordre de preferencia les col.locaries? "))
	(bind ?i 1)
	(while (<= ?i 7)
		do
		   (bind ?ival (nth$ ?i $?llista))
		   (assert (interes ?i ?ival))
		   (bind ?i (+ ?i 1))
	)
)

;; Saltem al modul de les preguntes especifiques

(defrule a-preguntes-especifiques
    (declare (salience -1))
    =>
    (focus preguntes-especifiques)
)
;;;
;;; 1.3 MODUL DE PREGUNTES ESPECIFIQUES
;;;
(defmodule preguntes-especifiques "Modul de preguntes especifiques"
    (import preguntes-comunes ?ALL)
    (export ?ALL)
)
;;****************************************************************************************************************************************ESPECIFIQUES
;;Vols mes series (1), pel·licules (2), o documentals (3)?
(defrule pregunta-tipus

	=>
	(bind ?valor (obte-nombre "Vols mes series (1), pel.licules (2), o documentals (3)? "))
	(if (eq ?valor 1) then (assert (contingut-preferit series)))
	(if (eq ?valor 2) then (assert (contingut-preferit cine)))
	(if (eq ?valor 3) then (assert (contingut-preferit documentals)))
)

;;Quantes hores de televisio al dia veus normalment? (0-24)
(defrule pregunta-hores
	=>
	(bind ?valor (obte-nombre "Quantes hores de televisio al dia veus normalment (0-24)?"))
	(if (eq ?valor 1) then (assert (hores-tv 1)))
	(if (eq ?valor 2) then (assert (hores-tv 2)))
	(if (>= ?valor 3) then (assert (hores-tv 3)))
)


;;Vols que cada contingut sigui mes be llarg (1), curt (2), o t'es igual (3)? (1,2,3)
(defrule pregunta-temps
	=>
	(bind ?valor (obte-nombre "Vols que cada contingut sigui mes be llarg (1), mig (2), curt (3) o t'es igual (4)? "))
	(if (eq ?valor 1) then (assert (duracio-prefer llarg)))
	(if (eq ?valor 2) then (assert (duracio-prefer mig)))
	(if (eq ?valor 3) then (assert (duracio-prefer curt)))
	(if (eq ?valor 4) then (assert (duracio-prefer esigual)))
)

;;PROBLEMES:
;;   1  noms de genere ha de començar en majuscules
;;   2  que passa amb generes que son 2 paraules com "espai exterior"?????
(defrule pregunta-passions
	=>
	(assert (passio-per (pregunta-llista "Dels temes seguents, quin t'apassiona mes?: Belic, Culte, Espai, Esportiu, Historic, Homosexual, Oest, Policiaca, Terror, Suspense, Melodrama, Fantasia, Romantic, Musical, XXX: ")))
)

;;Tens cap actor preferit? Si no en tens cap, escriu "cap".
(defrule pregunta-actor-favorit
	=>
	(assert (actor-preferit (pregunta-llista "Tens cap actor preferit? Si no en tens cap, escriu cap. ")))
)

;;Tens cap director preferit? Si no en tens cap, escriu "cap".
(defrule pregunta-director-favorit
	=>
	(assert (director-preferit (pregunta-llista "Tens cap director preferit? Si no en tens cap, escriu cap. ")))
)

;;(Si edat > 18) Vols permetre cap contingut XXX? (si,no)
(defrule pregunta-xxx
        (usuari (edat ?e))
	=>
	(if (< ?e 18) then (assert (xxx-permes FALSE))
	else
	(assert (xxx-permes ( si-o-no "Vols permetre cap contingut XXX? " )))
	)
)

;;(Si edat > 18) Vols permetre continguts que puguin ferir la sensibilitat de les persones? (si,no)
(defrule pregunta-sensibilitat
        (usuari (edat ?e))
	=>
	(if (< ?e 16) then (assert (contingut-sensible-permes FALSE))
	else
	(assert (contingut-sensible-permes ( si-o-no "Vols permetre continguts que puguin ferir la sensibilitat de les persones? " )))
	)
)


;;T'agradaria veure alguns continguts amb versio original?
(defrule pregunta-vo
	=>
	(assert (versio-original-permes ( si-o-no "T'agradaria veure alguns continguts amb versio original? " )))
)

;;T'agraden les pelicules en blanc i negre? (si,no)
(defrule pregunta-bin
	=>
	(assert (blanc-negre ( si-o-no "T'agraden les pelicules en blanc i negre? " )))
)

;;Voldries veure pelicules antigues? (si,no)
(defrule pregunta-antigues
	=>
	(assert (pelis-antigues ( si-o-no "Voldries veure pelicules antigues? " )))
)

;;; Saltem al modul de les assumpcions

(defrule a-esborrar-instancies
    (declare (salience -1))
    =>
    (focus esborrar-instancies)
)

;;; 2.1 MODUL ESBORRAR INSTANCIES
;;;
;;*************************************************************************************************************************************ESBORRAR INSTANCIES
(defmodule esborrar-instancies "Modul d'esborrar instances"
    (import preguntes-especifiques ?ALL)
    (export ?ALL)
)


;;; Descarta les ofertes que no compleixen els requisits minims

(defrule esborrar-no-compleixen-requisit-minim-edat
	?u <- (usuari (edat ?edatUsuari))
	?contingut <- (object (is-a Contingut))
	=>
	(if (> (send ?contingut get-edatRecomanada) ?edatUsuari)
	then
		(send ?contingut delete)
	)
)
;;Si XXX no esta permes eliminem tot XXX
(defrule esborrar-xxx-no-permes
    (or
		(xxx-permes FALSE)
		(usuari (edat ?e&: (< ?e 18)))
    )
    (or
		?contingut <- (object (is-a Contingut) (genere $?generes))
		?contingut <- (object (is-a Contingut) (genere_serie $?generes))
	)
    =>
    (bind ?i 1)
    (while (<= ?i (length$ $?generes))
	do
		(bind ?genereActual (nth$ ?i $?generes))
		(if (eq (str-compare (send (instance-address * ?genereActual) get-nomGenere) "XXX") 0)
		then
			(printout t "S'ha esborrat, per xxx no permes: " (send ?contingut get-titol) crlf)
			(send ?contingut delete)
			(break);;no cal seguir recorrent els generes un cop eliminat el contingut
		)
		(bind ?i (+ ?i 1))
    )
)
;;Si no vol continguts que pugin ferir sensibilitat, eliminar tots els que tinguin contingut dur.
(defrule esborrar-ferir-sensibilitat-no-permes
	(or
		(contingut-sensible-permes FALSE)
   	    (usuari (edat ?e&: (< ?e 16)))
	)
	?contingut <- (object (is-a Contingut) (ferirSensibilitat TRUE))
	=>
	(printout t "S'ha esborrat, per ferir sensibilitat: " (send ?contingut get-titol) crlf)
	(send ?contingut delete)
	
)

;;Funcio a repassar!----------------------------------------------------------------------------------------------------------------------------------------------
(defrule esborrar-versio-original-no-permes-i-no-lenten
	?vopermes <- (versio-original-permes)
	?u <- (usuari (idiomes $?llistaIdiomesUsr))
	?contingut <- (object (is-a Contingut) (idioma $?llistaIdiomesCont))
	=>
	(bind ?algunsubset (algun-de-llista1-esdins-llista2 $?llistaIdiomesUsr $?llistaIdiomesCont))
	(if (eq ?algunsubset FALSE)
	then
		(
		if (eq ?vopermes TRUE)
		then
		   (if (eq (send ?contingut get-versioOriginal) FALSE)
		   then
		       (printout t "S'ha esborrat, per no voler continguts en V.O.: " (send ?contingut get-titol) crlf)
		       (send ?contingut delete)
		   )
		else	
		       (printout t "S'ha esborrat, per no voler continguts en V.O.: " (send ?contingut get-titol) crlf)
		       (send ?contingut delete)
		)
	)
)

(defrule esborrar-musicals-discapacitat-auditiva
	(usuari (discapacitat-audiovisual ?os&: (= (str-compare ?os "auditiva") 0)))
	?contingut <- (object (is-a Contingut) (genere $?generes))
	=>
   (bind ?i 1)
    (while (<= ?i (length$ $?generes))
	do
		(bind ?genereActual (nth$ ?i $?generes))
		(if (eq (str-compare (send (instance-address * ?genereActual) get-nomGenere) "Musical") 0)
		then
			(printout t "S'ha esborrat, perque es un musical i l'usuari es sord : " (send ?contingut get-titol) crlf)
			(send ?contingut delete)
			(break)
		)
		(bind ?i (+ ?i 1))
    )	
)

(defrule esborrar-sense-subtitols-discapacitat-auditiva
	(usuari (discapacitat-audiovisual ?os&: (= (str-compare ?os "auditiva") 0)))
	?contingut <- (object (is-a Contingut) (subtitols FALSE))
	=>
	(printout t "S'ha esborrat, per no tenir subtitols i ser l'usuari sord: " (send ?contingut get-titol) crlf)
	(send ?contingut delete)
)

(defrule esborrar-contingut-homo-si-hetero
	(usuari (orientacio-sexual ?os&: (= (str-compare ?os "heterosexual") 0)))
	?contingut <- (object (is-a Contingut) (genere $?generes))
	=>
  (bind ?i 1)
    (while (<= ?i (length$ $?generes))
	do
		(bind ?genereActual (nth$ ?i $?generes))
		(if (eq (str-compare (send (instance-address * ?genereActual) get-nomGenere) "Homosexual") 0)
		then
			(printout t "S'ha esborrat, per ser contingut homosex. i usuari heterosex.: " (send ?contingut get-titol) crlf)
			(send ?contingut delete)
			(break)
		)
		(bind ?i (+ ?i 1))
    )	
)

(defrule a-assumpcions-incondicionals
	(declare (salience -1))
	=>
	(focus assumpcions-incondicionals)
)

;;; 2.2 MODUL D'ASSUMPCIONS (puntuacions!!!!!!!!!!!!!!!!!!!!!)
(defmodule assumpcions-incondicionals "Modul d'assignacions incondicionals"
    (import preguntes-especifiques ?ALL)
    (export ?ALL)
)

;;****************************************************************************************************************************************ASSUMPCIONS
(defrule puntuacio-infantil
	(usuari (edat ?e&: (< ?e 13)))
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(punts-infantil ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT edat infantil"crlf)
	(switch ?nomG
		(case "Animacio" then (modify ?genere (puntuacio (+ ?punts 3))))
		(case "Fantasia" then (modify ?genere (puntuacio (+ ?punts 3))))
		
		(case "Comedia" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Ciencia Ficcio" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Aventura" then (modify ?genere (puntuacio (+ ?punts 1))))
		
		(case "Catastrofe" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Suspense" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Policiaca" then (modify ?genere (puntuacio (+ ?punts -1))))
		
		(case "Drama" then (modify ?genere (puntuacio (+ ?punts -3))))
		(case "Terror" then (modify ?genere (puntuacio (+ ?punts -3))))
		(case "Homosexual" then (modify ?genere (puntuacio (+ ?punts -3))))
		(case "Belic" then (modify ?genere (puntuacio (+ ?punts -3))))
		(case "Culte" then (modify ?genere (puntuacio (+ ?punts -3))))
		(case "Actualitat" then (modify ?genere (puntuacio (+ ?punts -3))))
		(case "Art" then (modify ?genere (puntuacio (+ ?punts -3))))
		(case "Economia" then (modify ?genere (puntuacio (+ ?punts -3))))
		(case "Politica" then (modify ?genere (puntuacio (+ ?punts -3))))
	)
	(assert (punts-infantil ?nomG TRUE))
)

(defrule puntuacio-dona
	(usuari (sexe dona))
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(punts-dona ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT sexe dona"crlf)
	(switch ?nomG
		(case "Romantic" then (modify ?genere (puntuacio (+ ?punts 2))))
		
		(case "Drama" then (modify ?genere (puntuacio (+ ?punts 1))))
		
		(case "Accio" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Oest" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "XXX" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Belic" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Esports" then (modify ?genere (puntuacio (+ ?punts -1))))
	)
	(assert (punts-dona ?nomG TRUE))
)

(defrule puntuacio-home
	(usuari (sexe home))
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(punts-home ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT sexe home"crlf)
	(switch ?nomG
		(case "Accio" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Belic" then (modify ?genere (puntuacio (+ ?punts 2))))
		
		(case "Oest" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Esports" then (modify ?genere (puntuacio (+ ?punts 1))))
		
		(case "Romantic" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Musical" then (modify ?genere (puntuacio (+ ?punts -1))))
	)
	(assert (punts-home ?nomG TRUE))
)

(defrule puntuacio-separat-divorciat-solter
	(usuari (estat-civil separat|divorciat|solter))
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(punts-sep-div-sol ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT separat divorciat solter" crlf)
	(switch ?nomG
		(case "XXX" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Esports" then (modify ?genere (puntuacio (+ ?punts 2))))
		
		(case "Comedia" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Accio" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Show" then (modify ?genere (puntuacio (+ ?punts 1))))
		
		(case "Drama" then (modify ?genere (puntuacio (+ ?punts -1))))
		
		(case "Romantic" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Melodrama" then (modify ?genere (puntuacio (+ ?punts -2))))
	)
	(assert (punts-sep-div-sol ?nomG TRUE))
)

(defrule puntuacio-casat-ajuntat
	(usuari (estat-civil casat|ajuntat))
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(punts-cas-aju ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT casat ajuntat" crlf)
	(switch ?nomG
		(case "Romantic" then (modify ?genere (puntuacio (+ ?punts 1))))
		
		(case "XXX" then (modify ?genere (puntuacio (+ ?punts -1))))
	)
	(assert (punts-cas-aju ?nomG TRUE))
)

(defrule puntuacio-homosexual
	(usuari (estat-civil casat|ajuntat))
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(punts-homosexual ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT homosexual"crlf)
	(switch ?nomG
		(case "Homosexual" then (modify ?genere (puntuacio (+ ?punts 1))))
	)
	(assert (punts-homosexual ?nomG TRUE))
)

(defrule puntuacio-no-estudia
	(te-estudis no)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(no-estudia ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT no estudia" crlf)
	(switch ?nomG
		(case "Show" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Rosa" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Comedia" then (modify ?genere (puntuacio (+ ?punts 2))))
		
		(case "Politica" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Economia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Historia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Culte" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Historic" then (modify ?genere (puntuacio (+ ?punts -2))))
	)
	(assert (no-estudia ?nomG TRUE))
)

(defrule puntuacio-estudia-lletres
	(te-estudis si)
	(que-estudia lletres)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(estudia-lletres ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT estudia lletres" crlf)
	(switch ?nomG
		(case "Politica" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Economia" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Historia" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Culte" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Historic" then (modify ?genere (puntuacio (+ ?punts 2))))
		
		(case "Actualitat" then (modify ?genere (puntuacio (+ ?punts 1))))
		
		(case "Naturalesa" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Ciencia Ficcio" then (modify ?genere (puntuacio (+ ?punts -1))))
		
		(case "Art" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Ciencia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Tecnologia" then (modify ?genere (puntuacio (+ ?punts -2))))
	)
	(assert (estudia-lletres ?nomG TRUE))
)

(defrule puntuacio-estudia-ciencia
	(te-estudis si)
	(que-estudia ciencia)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(estudia-ciencia ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT estudia ciencia" crlf)
	(switch ?nomG
		(case "Ciencia" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Ciencia Ficcio" then (modify ?genere (puntuacio (+ ?punts 2))))
		
		(case "Actualitat" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Culte" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Naturalesa" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Tecnologia" then (modify ?genere (puntuacio (+ ?punts 1))))
		
		(case "Historic" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Politica" then (modify ?genere (puntuacio (+ ?punts -1))))
		
		(case "Economia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Historia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Art" then (modify ?genere (puntuacio (+ ?punts -2))))
	)
	(assert (estudia-ciencia ?nomG TRUE))
)

(defrule puntuacio-estudia-tecnologia
	(te-estudis si)
	(que-estudia tecnologia)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(estudia-tecnologia ?nomG TRUE));; per evitar BUCLE infinit
    =>
    ;;     (printout t "PUNT estudia tecnología" crlf)
	(switch ?nomG
		(case "Ciencia Ficcio" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Tecnologia" then (modify ?genere (puntuacio (+ ?punts 2))))
		
		(case "Actualitat" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Culte" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Naturalesa" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Ciencia" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Animacio" then (modify ?genere (puntuacio (+ ?punts 1))))
		
		(case "Historic" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Politica" then (modify ?genere (puntuacio (+ ?punts -1))))
		
		(case "Economia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Historia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Art" then (modify ?genere (puntuacio (+ ?punts -2))))
	)
	(assert (estudia-tecnologia ?nomG TRUE))
)

(defrule puntuacio-estudia-art
	(te-estudis si)
	(que-estudia art)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(estudia-art ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT estudia art" crlf)
	(switch ?nomG
		(case "Art" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Culte" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Animacio" then (modify ?genere (puntuacio (+ ?punts 2))))
		
		(case "Historic" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Historia" then (modify ?genere (puntuacio (+ ?punts 1))))
		(case "Politica" then (modify ?genere (puntuacio (+ ?punts 1))))
		
		(case "Actualitat" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Naturalesa" then (modify ?genere (puntuacio (+ ?punts -1))))
		(case "Ciencia" then (modify ?genere (puntuacio (+ ?punts -1))))
		
		(case "Economia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Tecnologia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Ciencia Ficcio" then (modify ?genere (puntuacio (+ ?punts -2))))
	)
	(assert (estudia-art ?nomG TRUE))
)

(defrule puntuacio-agrada-treball-grup1;;grup1: lletres|legal|politic|economic
	(agrada-treball ?nivellAgradaFeina)
	(treball-relacionat-amb lletres|legal|politic|economic)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(agrada-treball-grup1 ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT agrada feina grup 1" crlf)
	(bind ?suma 0)
	(bind ?multi 0)
	(switch ?nivellAgradaFeina
		(case "gens" then (bind ?multi -2))
		(case "poc" then (bind ?multi -1))
		(case "normal" then (bind ?multi 1))
		(case "molt" then (bind ?multi 2))
		(case "extrem" then (bind ?multi 3))
	)
	(switch ?nomG
		(case "Politica" then (bind ?suma (+ ?suma 2)))
		(case "Economia" then (bind ?suma (+ ?suma 2)))
		(case "Historia" then (bind ?suma (+ ?suma 2)))
		(case "Culte" then (bind ?suma (+ ?suma 2)))
		(case "Historic" then (bind ?suma (+ ?suma 2)))
		
		(case "Actualitat" then (bind ?suma (+ ?suma 1)))
		
		(case "Naturalesa" then (bind ?suma (+ ?suma -1)))
		(case "Ciencia Ficcio" then (bind ?suma (+ ?suma -1)))
		
		(case "Art" then (bind ?suma (+ ?suma -2)))
		(case "Ciencia" then (bind ?suma (+ ?suma -2)))
		(case "Tecnologia" then (bind ?suma (+ ?suma -2)))
	)
	(modify ?genere (puntuacio (+ ?punts (* ?suma ?multi))))
	(assert (agrada-treball-grup1 ?nomG TRUE))
)

(defrule puntuacio-agrada-treball-grup2;;grup2: ciencia
	(agrada-treball ?nivellAgradaFeina)
	(treball-relacionat-amb ciencia)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(agrada-treball-grup2 ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT agrada feina grup 2" crlf)
	(bind ?suma 0)
	(bind ?multi 0)
	(switch ?nivellAgradaFeina
		(case "gens" then (bind ?multi -2))
		(case "poc" then (bind ?multi -1))
		(case "normal" then (bind ?multi 1))
		(case "molt" then (bind ?multi 2))
		(case "extrem" then (bind ?multi 3))
	)
	(switch ?nomG
		(case "Ciencia" then (bind ?suma (+ ?suma 2)))
		(case "Ciencia Ficcio" then (bind ?suma (+ ?suma 2)))
		
		(case "Actualitat" then (bind ?suma (+ ?suma 1)))
		(case "Culte" then (bind ?suma (+ ?suma 1)))
		(case "Naturalesa" then (bind ?suma (+ ?suma 1)))
		(case "Tecnologia" then (bind ?suma (+ ?suma 1)))
		
		(case "Historic" then (bind ?suma (+ ?suma -1)))
		(case "Politica" then (bind ?suma (+ ?suma -1)))
		
		(case "Economia" then (bind ?suma (+ ?suma -2)))
		(case "Historia" then (bind ?suma (+ ?suma -2)))
		(case "Art" then (bind ?suma (+ ?suma -2)))
	)
	(modify ?genere (puntuacio (+ ?punts (* ?suma ?multi))))
	(assert (agrada-treball-grup2 ?nomG TRUE))
)

(defrule puntuacio-agrada-treball-grup3;;grup3: tecnologia|construccio
	(agrada-treball ?nivellAgradaFeina)
	(treball-relacionat-amb tecnologia|construccio)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(agrada-treball-grup3 ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT agrada feina grup 3" crlf)
	(bind ?suma 0)
	(bind ?multi 0)
	(switch ?nivellAgradaFeina
		(case "gens" then (bind ?multi -2))
		(case "poc" then (bind ?multi -1))
		(case "normal" then (bind ?multi 1))
		(case "molt" then (bind ?multi 2))
		(case "extrem" then (bind ?multi 3))
	)
	(switch ?nomG
		(case "Ciencia Ficcio" then (bind ?suma (+ ?suma 2)))
		(case "Tecnologia" then (bind ?suma (+ ?suma 2)))
		
		(case "Actualitat" then (bind ?suma (+ ?suma 1)))
		(case "Culte" then (bind ?suma (+ ?suma 1)))
		(case "Naturalesa" then (bind ?suma (+ ?suma 1)))
		(case "Ciencia" then (bind ?suma (+ ?suma 1)))
		(case "Animacio" then (bind ?suma (+ ?suma 1)))
		
		(case "Historic" then (bind ?suma (+ ?suma -1)))
		(case "Politica" then (bind ?suma (+ ?suma -1)))
		
		(case "Economia" then (bind ?suma (+ ?suma -2)))
		(case "Historia" then (bind ?suma (+ ?suma -2)))
		(case "Art" then (bind ?suma (+ ?suma -2)))
	)
	(modify ?genere (puntuacio (+ ?punts (* ?suma ?multi))))
	(assert (agrada-treball-grup3 ?nomG TRUE))
)

(defrule puntuacio-agrada-treball-grup4;;grup3: art
	(agrada-treball ?nivellAgradaFeina)
	(treball-relacionat-amb art)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(agrada-treball-grup4 ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT agrada feina grup 4" crlf)
	(bind ?suma 0)
	(bind ?multi 0)
	(switch ?nivellAgradaFeina
		(case "gens" then (bind ?multi -2))
		(case "poc" then (bind ?multi -1))
		(case "normal" then (bind ?multi 1))
		(case "molt" then (bind ?multi 2))
		(case "extrem" then (bind ?multi 3))
	)
	(switch ?nomG
		(case "Art" then (bind ?suma (+ ?suma 2)))
		(case "Culte" then (bind ?suma (+ ?suma 2)))
		(case "Animacio" then (bind ?suma (+ ?suma 2)))
		
		(case "Historic" then (bind ?suma (+ ?suma 1)))
		(case "Historia" then (bind ?suma (+ ?suma 1)))
		(case "Politica" then (bind ?suma (+ ?suma 1)))
		
		(case "Actualitat" then (bind ?suma (+ ?suma -1)))
		(case "Naturalesa" then (bind ?suma (+ ?suma -1)))
		(case "Ciencia" then (bind ?suma (+ ?suma -1)))
		
		(case "Economia" then (bind ?suma (+ ?suma -2)))
		(case "Tecnologia" then (bind ?suma (+ ?suma -2)))
		(case "Ciencia Ficcio" then (bind ?suma (+ ?suma -2)))
	)
	(modify ?genere (puntuacio (+ ?punts (* ?suma ?multi))))
	(assert (agrada-treball-grup4 ?nomG TRUE))
)

(defrule puntuacio-interessa-gadafi
	(interessat-gadafi ?nivellInteresGadafi)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(interessa-gadafi ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT interessa gadafi" crlf)
	(bind ?suma 0)
	(bind ?multi 0)
	(switch ?nivellInteresGadafi
		(case "gens" then (bind ?multi -2))
		(case "poc" then (bind ?multi -1))
		(case "normal" then (bind ?multi 1))
		(case "molt" then (bind ?multi 2))
		(case "extrem" then (bind ?multi 3))
	)
	(switch ?nomG
		(case "Politica" then (bind ?suma (+ ?suma 2)))
		(case "Actualitat" then (bind ?suma (+ ?suma 2)))
		
		(case "Belic" then (bind ?suma (+ ?suma 1)))
		(case "Accio" then (bind ?suma (+ ?suma 1)))
	)
	(modify ?genere (puntuacio (+ ?punts (* ?suma ?multi))))
	(assert (interessa-gadafi ?nomG TRUE))
)

(defrule puntuacio-interessa-fukushima
	(interessat-fukushima ?nivellInteresFukushima)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(interessa-fukushima ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT interessa fukushima" crlf)
	(bind ?suma 0)
	(bind ?multi 0)
	(switch ?nivellInteresFukushima
		(case "gens" then (bind ?multi -2))
		(case "poc" then (bind ?multi -1))
		(case "normal" then (bind ?multi 1))
		(case "molt" then (bind ?multi 2))
		(case "extrem" then (bind ?multi 3))
	)
	(switch ?nomG
		(case "Politica" then (bind ?suma (+ ?suma 2)))
		(case "Actualitat" then (bind ?suma (+ ?suma 2)))
		
		(case "Tecnologia" then (bind ?suma (+ ?suma 1)))
		(case "Ciencia" then (bind ?suma (+ ?suma 1)))
		(case "Catastrofe" then (bind ?suma (+ ?suma 1)))
	)
	(modify ?genere (puntuacio (+ ?punts (* ?suma ?multi))))
	(assert (interessa-fukushima ?nomG TRUE))
)

(defrule puntuacio-interessa-boda-real
	(interessat-boda-real TRUE)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-interessa-boda-real ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT interessa boda real" crlf)
	(switch ?nomG
		(case "Actualitat" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Rosa" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Romantic" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Fantasia" then (modify ?genere (puntuacio (+ ?punts 2))))
	)
	(assert (puntuacio-interessa-boda-real ?nomG TRUE))
)

(defrule puntuacio-coneix-belen-esteban
	(coneix-belen-esteban TRUE)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-coneix-belen-esteban ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT coneix belen esteban" crlf)
	(switch ?nomG
		(case "Rosa" then (modify ?genere (puntuacio (+ ?punts 3))))
		(case "Show" then (modify ?genere (puntuacio (+ ?punts 3))))
		
		(case "Actualitat" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Ciencia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Art" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Economia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Historia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Naturalesa" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Politica" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Tecnologia" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Culte" then (modify ?genere (puntuacio (+ ?punts -2))))
	)
	(assert (puntuacio-coneix-belen-esteban ?nomG TRUE))
)

(defrule puntuacio-es-practic
	(es-practic TRUE)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-es-practic ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT es practic" crlf)
	(switch ?nomG
		(case "Actualitat" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Tecnologia" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Ciencia" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Aventura" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Oest" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Accio" then (modify ?genere (puntuacio (+ ?punts 2))))
		
		(case "Art" then (modify ?genere (puntuacio (+ ?punts -2))))
		(case "Historia" then (modify ?genere (puntuacio (+ ?punts -2))))
	)
	(assert (puntuacio-es-practic ?nomG TRUE))
)

(defrule puntuacio-oci-festa
	(oci festa)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-oci-festa ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT oci festa" crlf)
	(switch ?nomG
		(case "Comedia" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Accio" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Show" then (modify ?genere (puntuacio (+ ?punts 2))))
	)
	(assert (puntuacio-oci-festa ?nomG TRUE))
)

(defrule puntuacio-oci-natura
	(oci natura)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-oci-natura ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT oci natura" crlf)
	(switch ?nomG
		(case "Naturalesa" then (modify ?genere (puntuacio (+ ?punts 2))))
	)
	(assert (puntuacio-oci-natura ?nomG TRUE))
)

(defrule puntuacio-oci-estudiar
	(oci estudiar)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-oci-estudiar ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT oci estudiar" crlf)
	(switch ?nomG
		(case "Culte" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Drama" then (modify ?genere (puntuacio (+ ?punts 2))))
		
		(case "Rosa" then (modify ?genere (puntuacio (+ ?punts -1))))
	)
	(assert (puntuacio-oci-estudiar ?nomG TRUE))
)

(defrule puntuacio-jugava-pistoles-aigua
	(jugava-pistoles-aigua si)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-jugava-pistoles-aigua ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT jugava pistoles aigua" crlf)
	(switch ?nomG
		(case "Accio" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Oest" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Aventura" then (modify ?genere (puntuacio (+ ?punts 2))))
	)
	(assert (puntuacio-jugava-pistoles-aigua ?nomG TRUE))
)

(defrule puntuacio-aficions-mar-muntanya
	(aficions mar|muntanya)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-aficions-mar-muntanya ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT aficions mar muntanya" crlf)
	(switch ?nomG
		(case "Naturalesa" then (modify ?genere (puntuacio (+ ?punts 1))))
	)
	(assert (puntuacio-aficions-mar-muntanya ?nomG TRUE))
)

(defrule puntuacio-aficions-tecnologia
	(aficions tecnologia)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-aficions-tecnologia ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT aficions tecnologia" crlf)
	(switch ?nomG
		(case "Tecnologia" then (modify ?genere (puntuacio (+ ?punts 2))))
	)
	(assert (puntuacio-aficions-tecnologia ?nomG TRUE))
)

(defrule puntuacio-aficions-lectura
	(aficions lectura)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-aficions-lectura ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT aficions lectura" crlf)
	(switch ?nomG
		(case "Art" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Economia" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Historia" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Politica" then (modify ?genere (puntuacio (+ ?punts 2))))
	)
	(assert (puntuacio-aficions-lectura ?nomG TRUE))
)

(defrule puntuacio-aficions-societat
	(aficions societat)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-aficions-societat ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT aficions societat" crlf)
	(switch ?nomG
		(case "Historia" then (modify ?genere (puntuacio (+ ?punts 2))))
		(case "Politica" then (modify ?genere (puntuacio (+ ?punts 2))))
	)
	(assert (puntuacio-aficions-societat ?nomG TRUE))
)

(defrule puntuacio-interes
	(interes ?numInteres ?val)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?puntsGenere))
	(not(interes ?numInteres ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT interes (llista pelis)" crlf)
	(switch ?numInteres
		(case 1 then
			(if (eq (str-compare ?nomG "Animacio") 0) then(modify ?genere (puntuacio (+ ?puntsGenere 3)))))
		(case 2 then
			(if (eq (str-compare ?nomG "Accio") 0) then(modify ?genere (puntuacio (+ ?puntsGenere 3)))))
		(case 3 then
			(if (eq (str-compare ?nomG "Politica") 0) then(modify ?genere (puntuacio (+ ?puntsGenere 3)))))
		(case 4 then
			(if (eq (str-compare ?nomG "Suspense") 0) then(modify ?genere (puntuacio (+ ?puntsGenere 3)))))
		(case 5 then
			(if (eq (str-compare ?nomG "Show") 0) then(modify ?genere (puntuacio (+ ?puntsGenere 3)))))
		(case 6 then
			(if (eq (str-compare ?nomG "Comedia") 0) then(modify ?genere (puntuacio (+ ?puntsGenere 3)))))
		(case 7 then
			(if (eq (str-compare ?nomG "Homosexual") 0) then(modify ?genere (puntuacio (+ ?puntsGenere 3)))))
	)
	(assert(interes ?numInteres ?nomG TRUE))
)

(defrule puntuacio-passio-per-generes
	(passio-per $?generesPassio)
	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts))
	(not(puntuacio-genere-passio ?nomG TRUE));; per evitar BUCLE infinit
    =>
;;     (printout t "PUNT passio per generes" crlf)
	(loop-for-count (?i 1 (length$ $?generesPassio)) do
		(bind ?genereActualPassio (nth$ ?i $?generesPassio))
		(if (eq (str-compare ?genereActualPassio ?nomG) 0)
		then
			(modify ?genere (puntuacio (+ ?punts 2)))
		)
	)
	(assert (puntuacio-genere-passio ?nomG TRUE))
)

(defrule a-assumpcions-incondicionals2
	(declare (salience -1))
	=>
	(focus assumpcions-incondicionals2)
)

(defmodule assumpcions-incondicionals2 "Modul d'assignacions incondicionals2"
    (import assumpcions-incondicionals ?ALL)
    (export ?ALL)
)
;;PUNTUACIO DE CONTINGUTS

(defrule puntuacio-cine-per-generes
	?contingut <- (object (is-a Cine) (titol ?titolC) (genere $?generes))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	?gen <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?puntsGenere))
	(not(punts-cine-gen ?titolC ?nomG TRUE));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT cine per generes" crlf)
	(loop-for-count (?i 1 (length$ $?generes)) do
		(bind ?genereActual (nth$ ?i $?generes))
		(if (eq (str-compare ?nomG (send (instance-address * ?genereActual) get-nomGenere)) 0)
		then
			(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut ?puntsGenere)))
		)
	)
	(assert(punts-cine-gen ?titolC ?nomG TRUE))
)

(defrule puntuacio-cine-favorit
	(contingut-preferit cine)
	?contingut <- (object (is-a Cine) (titol ?titolC) (genere $?generes))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-cine-favorit ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT cine favorit" crlf)
	(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 1)))
	(assert(punts-cine-favorit ?titolC))
)

(defrule puntuacio-duracio-contingut
	(duracio-prefer ?duracioPreferida)
	?contingut <- (object (is-a Contingut) (titol ?titolC) (duracio ?duracioContingut))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-duracio-contingut ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT duracio contingut" crlf)
	(if (<= ?duracioContingut 30)
	then
		(if (eq ?duracioPreferida curt)
		then
			(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 1)))
		else
			(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut -1)))
		)
	else
		(if (< ?duracioContingut 60)
		then
			(if (eq ?duracioPreferida mig)
			then
				(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 1)))
			else
				(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut -1)))
			)
		else
			(if (>= ?duracioContingut 60)
			then
				(if (eq ?duracioPreferida llarg)
				then
					(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 1)))
				else
					(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut -1)))
				)
			)
		)
	)
	(assert(punts-duracio-contingut ?titolC))
)

(defrule puntuacio-actor-favorit
	(actor-preferit ?actorFav)
	(or
		?contingut <- (object (is-a Contingut) (titol ?titolC) (actors $?actorsC))
		?contingut <- (object (is-a Contingut) (titol ?titolC) (actorsS $?actorsC))
	)
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-actor-favorit ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT actor favorit" crlf)
	(loop-for-count (?i 1 (length$ $?actorsC)) do
		(bind ?actorActual (nth$ ?i $?actorsC))
		(if (eq (str-compare ?actorFav (send (instance-address * ?actorActual) get-nom)) 0)
		then
			(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 3)))
		)
	)
	(assert(punts-actor-favorit ?titolC))
)

(defrule puntuacio-director-favorit
	(director-preferit ?directorFav)
	?contingut <- (object (is-a Contingut) (titol ?titolC) (director $?directorsC))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-director-favorit ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT director favorit" crlf)
	(loop-for-count (?i 1 (length$ $?directorsC)) do
		(bind ?directorActual (nth$ ?i $?directorsC))
		(if (eq (str-compare ?directorFav (send (instance-address * ?directorActual) get-nom)) 0)
		then
			(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 3)))
		)
	)
	(assert(punts-director-favorit ?titolC))
)

(defrule puntuacio-blanc-i-negre
	(blanc-negre TRUE)
	?contingut <- (object (is-a Cine) (titol ?titolC) (format BiN))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-blanc-i-negre ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT blanc i negre" crlf)
	(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 3)))
	(assert(punts-blanc-i-negre ?titolC))
)

(defrule puntuacio-pelis-antigues
	(pelis-antigues TRUE)
	?contingut <- (object (is-a Cine) (titol ?titolC) (any ?a&: (< ?a 1990)))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-pelis-antigues ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT pelis antigues" crlf)
	(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 2)))
	(assert(punts-pelis-antigues ?titolC))
)

(defrule puntuacio-documentals-per-generes
	?contingut <- (object (is-a Documental) (titol ?titolC))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	?gen <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?puntsGenere))
	(not(punts-documental-gen ?titolC ?nomG));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT docus per generes" crlf)
	(bind ?tipusDocu (str-cat (class ?contingut)))
	(if (eq (str-compare ?nomG ?tipusDocu) 0)
	then
		(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut ?puntsGenere)))
	)
	(assert(punts-documental-gen ?titolC ?nomG))
)

(defrule puntuacio-documentals-favorit
	(contingut-preferit documentals)
	?contingut <- (object (is-a Documental) (titol ?titolC))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-documentals-favorit ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT docus favorits" crlf)
	(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 1)))
	(assert(punts-documentals-favorit ?titolC))
)

(defrule puntuacio-documentals-naturalesa-te-mascota
	(te-mascota TRUE)
	?contingut <- (object (is-a Naturalesa) (titol ?titolC) (tema Mamifers|Peixos|Insectes|Aus|Reptils|AnimalsGeneral))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-documentals-natu-te-mascota ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT naturalesa te mascota" crlf)
	(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 1)))
	(assert(punts-documentals-natu-te-mascota ?titolC))
)

(defrule puntuacio-documentals-aficio-mar
	(aficions mar)
	?contingut <- (object (is-a Naturalesa) (titol ?titolC) (tema Peixos))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-documentals-aficio-mar ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT docu aficio mar" crlf)
	(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 2)))
	(assert(punts-documentals-aficio-mar ?titolC))
)

(defrule puntuacio-documentals-aficio-muntanya
	(aficions muntanya)
	?contingut <- (object (is-a Naturalesa) (titol ?titolC) (tema Geologia|Clima))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-documentals-aficio-muntanya ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT docu aficio muntanya" crlf)
	(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 2)))
	(assert(punts-documentals-aficio-muntanya ?titolC))
)

(defrule puntuacio-series-per-generes
	?contingut <- (object (is-a Serie) (titol ?titolC) (genere_serie $?generes))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	?gen <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?puntsGenere))
	(not(punts-serie-gen ?titolC ?nomG));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT serie per generes" crlf)
	(loop-for-count (?i 1 (length$ $?generes)) do
		(bind ?genereActual (nth$ ?i $?generes))
		(if (eq (str-compare ?nomG (send (instance-address * ?genereActual) get-nomGenere)) 0)
		then
			(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut ?puntsGenere)))
		)
	)
	(assert(punts-serie-gen ?titolC ?nomG))
)

(defrule puntuacio-series-favorit
	(contingut-preferit series)
	?contingut <- (object (is-a Serie) (titol ?titolC) (genere_serie $?generes))
	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?puntsContingut))
	(not(punts-series-favorit ?titolC));; per evitar BUCLE infinit
	=>
;; 	(printout t "PUNT series favorit" crlf)
	(modify ?contingutAmbPunts (puntuacio (+ ?puntsContingut 1)))
	(assert(punts-series-favorit ?titolC))
)


(defrule a-solucions
	(declare (salience -1))
	=>
	(focus solucions)
)


;;;
;;;MODUL DE REFINAMENT
;;;
;;Avalua la solució trobada segons la satisfacció dels requisits
;;****************************************************************************************************************************************************

;;;
;;;MODUL DE MOSTRA DE SOLUCIONS
;;****************************************************************************************************************************************************
;;Imprimeix totes les recomanacions
(defmodule solucions
;; 	(import refinament ?ALL)
	(import assumpcions-incondicionals ?ALL)
	(export ?ALL)
)

(defrule escriure-titol-solucions
	(declare (salience 10))
	(not(titol-solucio-pintada TRUE))
	=>
	(printout t "+---------------------------------------------------+" crlf)
	(printout t "|                                                   |" crlf)
	(printout t "|                      Solucions                    |" crlf)
	(printout t "|                                                   |" crlf)
	(printout t "+---------------------------------------------------+" crlf)
	
	(assert (titol-solucio-pintada TRUE))
)

;; (defrule prova5;;imprimeix generes amb punts diferents de 0, per debug
;; 	(declare (salience 6))
;; ;; 	(not(usuari (sexe desconegut)))
;; ;; 	(not(usuari (edat ?e&:(= ?e -1))))
;; 	?genere <- (genere-amb-puntuacio (nom-genere ?nomG) (puntuacio ?punts&: (not(= ?punts 0))))
;; ;; 	(not(provafet5 ?nomG TRUE))
;;     =>
;; 	(printout t "nom: " ?nomG  " punts: " ?punts crlf)
;; ;; 	(assert (provafet5 ?nomG TRUE))
;; )

;; (defrule imprimeix-cont
;; 	(declare (salience 7))
;; 	?contingut <- (object (titol ?titolC))
;; 	?contingutAmbPunts <- (contingut-amb-puntuacio (titol ?titolC) (puntuacio ?punts-cont))
;; 	(not(cont-impres ?titolC TRUE))
;;     =>
;; 	(printout t (str-cat (class ?contingut)) " PUNTS: " ?punts-cont  " TITOL: " ?titolC  crlf)
;; ;; 	(printout t "PUNTS: " ?punts-cont  " TITOL: " ?titolC  crlf)
;; 	(assert (cont-impres ?titolC TRUE))
;; )

(defrule posa-a-llista
	(declare (salience 5))
	?cont <- (contingut-amb-puntuacio (titol ?titol-cont) (puntuacio ?punts))
    =>
;; 	(printout t "llista ABANS: " ?*llista-CP* crlf)
;; 	(bind ?us 10)
	(bind ?*llista-CP* (insert$ ?*llista-CP* (+ (length$ ?*llista-CP*) 1) ?titol-cont ?punts))
;; 	(printout t "llista DESPRES: " ?*llista-CP* crlf)
;; 	(printout t "afegim: " ?cont " " ?pepe crlf)
	
)


(defrule escriu-adequades
	(declare (salience 5))
	=>
	
	(printout t ?*llista-CP* crlf)
)



