;;Sistema expert per a la recomanació de televisió


;;****************
;;*   CLASSES    *
;;****************

; Sat May 07 14:16:09 CEST 2011
; 
;+ (version "3.4.6")
;+ (build "Build 613")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
    (is-a USER)
    (role abstract)
    (multislot idioma
;+      (comment "Idioma en que s'emet el contingut.")
        (type SYMBOL)
        (allowed-values Espanyol Angles Catala Frances Italia Japones)
        (create-accessor read-write))
    (single-slot tema
;+      (comment "Tema  dintre de la naturalesa.")
        (type SYMBOL)
        (allowed-values Geologia Mamifers Peixos Insectes Clima Aus Reptils AnimalsGeneral)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (multislot actors
;+      (comment "Actors del contingut de tipus Cine.")
        (type INSTANCE)
;+      (allowed-classes Persona)
        (create-accessor read-write))
    (single-slot ambit
;+      (comment "Ambit del que tracta aquest documental.")
        (type SYMBOL)
        (allowed-values Informatica Telecomunicacions Aviacio Nautica Construccio Mecanica)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot nacionalitat
;+      (comment "Defineix el pais de produccio de la pel·licula. Pot ser Espanyola, Francesa, EEUU, etc.")
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot rol
;+      (comment "Rol que tindra la persona en un contingut determinat.")
        (type SYMBOL)
        (allowed-values actor director)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot tematica
;+      (comment "Tematica del documental.")
        (type INSTANCE)
;+      (allowed-classes)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot resum
;+      (comment "Resum del capitol en concret. Es diferencia de la descripcio (parametre heretat), en que l'altre es la descripcio en general de la serie.")
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (multislot director
;+      (comment "Relacio que indica que una Persona te com a rol director per un Contingut determinat.")
        (type INSTANCE)
;+      (allowed-classes Persona)
        (create-accessor read-write))
    (single-slot nom
        (type STRING)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot estatCivil
;+      (comment "La persona esta casada, divorciada, etc?")
        (type SYMBOL)
        (allowed-values casada divorciada soltera separada)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot nivellEconomic
;+      (comment "Sou que guanya aquesta persona per fer-se una idea del nivell economic.")
        (type FLOAT)
        (range 0.0 1.0E12)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot format
;+      (comment "Descriu el format en que s'emet la pel·licula. Pot ser en color, blanc i negre o en 3D.")
        (type SYMBOL)
        (allowed-values 3D BiN COLOR)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot descripcio
;+      (comment "Descripcio, resum o sinopsis del contingut del programa.")
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot num_temporada
;+      (comment "Temporada de la serie.")
        (type INTEGER)
        (range 1 1000)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot duracio
;+      (comment "Duracio en minuts del contingut. Ex. 60', 90', 120', etc.")
        (type INTEGER)
        (range 0 600)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot num_capitol
;+      (comment "Nombre del capitol de la serie.")
        (type INTEGER)
        (range 1 1000)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot sexe
;+      (comment "Sexe de la persona")
        (type SYMBOL)
        (allowed-values home dona)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (multislot genere_serie
;+      (comment "Genere del contingut de tipus Serie.")
        (type INSTANCE)
;+      (allowed-classes Genere)
        (cardinality 1 ?VARIABLE)
        (create-accessor read-write))
    (single-slot subtitols
;+      (comment "Es poden seleccionar subtitols per aquest contingut?")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (default FALSE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot epoca
;+      (comment "Epoca en que esta enfocat el documental.")
        (type SYMBOL)
        (allowed-values Moderna Medieval Prehist%C3%B2ria Classica SegleXX Romanticisme SegleXIX Actual Futur)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot ferirSensibilitat
;+      (comment "Aquest contingut pot ferir la sensibilitat de les persones. Basats en criteris mes o menys de la etica de la nostra societat.")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (default FALSE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (multislot idiomes
;+      (comment "Idiomes que enten la persona.")
        (type SYMBOL)
        (allowed-values Angles Frances Catala Espanyol Italia)
        (create-accessor read-write))
    (single-slot nomGenere
;+      (comment "Nom del genere al que fa referencia la classe.")
        (type STRING)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (multislot genere
;+      (comment "Genere del contingut de tipus Cine.")
        (type INSTANCE)
;+      (allowed-classes Genere)
        (cardinality 1 ?VARIABLE)
        (create-accessor read-write))
    (single-slot any
;+      (comment "Any en que el contingut s'ha realitzat. P.ex. correspondria a la data de filmacio d'una pel·licula.")
        (type INTEGER)
        (range 1895 2012)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot TVornoTV_Class7
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot orientacioSexual
;+      (comment "Orientacio sexual de la persona.")
        (type SYMBOL)
        (allowed-values heterosexual homosexual bisexual)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (multislot actorsS
;+      (comment "Actors de la serie.")
        (type INSTANCE)
;+      (allowed-classes Persona)
        (create-accessor read-write))
    (single-slot edatRecomanada
;+      (comment "Edat recomanada per veure aquest contingut.")
        (type INTEGER)
        (range 0 18)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot versioOriginal
;+      (comment "Indica si aquesta pel·licula pot ser emesa en versio original. (Si inclou l'idioma original en que es grava).")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (default FALSE)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot titol
;+      (comment "Nom o titol del contingut, per exemple \"Terminator 3\" o \"Doraemon\"")
        (type STRING)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot edat
;+      (comment "Edat de la persona")
        (type INTEGER)
        (range 0 120)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot nomTema
;+      (comment "Nom del tema a la que fa referencia la instancia.")
        (type STRING)
;+      (cardinality 1 1)
        (create-accessor read-write)))

(defclass Contingut "Classe que representa un programa televisiu, tambe anomenat \"Contingut\"."
    (is-a USER)
    (role concrete)
    (multislot idioma
;+      (comment "Idioma en que s'emet el contingut.")
        (type SYMBOL)
        (allowed-values Espanyol Angles Catala Frances Italia Japones)
        (create-accessor read-write))
    (single-slot ferirSensibilitat
;+      (comment "Aquest contingut pot ferir la sensibilitat de les persones. Basats en criteris mes o menys de la etica de la nostra societat.")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (default FALSE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot descripcio
;+      (comment "Descripcio, resum o sinopsis del contingut del programa.")
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (multislot director
;+      (comment "Relacio que indica que una Persona te com a rol director per un Contingut determinat.")
        (type INSTANCE)
;+      (allowed-classes Persona)
        (create-accessor read-write))
    (single-slot any
;+      (comment "Any en que el contingut s'ha realitzat. P.ex. correspondria a la data de filmacio d'una pel·licula.")
        (type INTEGER)
        (range 1895 2012)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot titol
;+      (comment "Nom o titol del contingut, per exemple \"Terminator 3\" o \"Doraemon\"")
        (type STRING)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot duracio
;+      (comment "Duracio en minuts del contingut. Ex. 60', 90', 120', etc.")
        (type INTEGER)
        (range 0 600)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot subtitols
;+      (comment "Es poden seleccionar subtitols per aquest contingut?")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (default FALSE)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot edatRecomanada
;+      (comment "Edat recomanada per veure aquest contingut.")
        (type INTEGER)
        (range 0 18)
;+      (cardinality 0 1)
        (create-accessor read-write)))

(defclass Cine "Representa el conjunt de pel·licules cinematografiques."
    (is-a Contingut)
    (role concrete)
    (multislot genere
;+      (comment "Genere del contingut de tipus Cine.")
        (type INSTANCE)
;+      (allowed-classes Genere)
        (cardinality 1 ?VARIABLE)
        (create-accessor read-write))
    (multislot actors
;+      (comment "Actors del contingut de tipus Cine.")
        (type INSTANCE)
;+      (allowed-classes Persona)
        (create-accessor read-write))
    (single-slot format
;+      (comment "Descriu el format en que s'emet la pel·licula. Pot ser en color, blanc i negre o en 3D.")
        (type SYMBOL)
        (allowed-values 3D BiN COLOR)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot nacionalitat
;+      (comment "Defineix el pais de produccio de la pel·licula. Pot ser Espanyola, Francesa, EEUU, etc.")
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot versioOriginal
;+      (comment "Indica si aquesta pel·licula pot ser emesa en versio original. (Si inclou l'idioma original en que es grava).")
        (type SYMBOL)
        (allowed-values FALSE TRUE)
        (default FALSE)
;+      (cardinality 0 1)
        (create-accessor read-write)))

(defclass Serie "Representa una serie de televisio."
    (is-a Contingut)
    (role concrete)
    (single-slot resum
;+      (comment "Resum del capitol en concret. Es diferencia de la descripcio (parametre heretat), en que l'altre es la descripcio en general de la serie.")
        (type STRING)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (multislot genere_serie
;+      (comment "Genere del contingut de tipus Serie.")
        (type INSTANCE)
;+      (allowed-classes Genere)
        (cardinality 1 ?VARIABLE)
        (create-accessor read-write))
    (single-slot num_temporada
;+      (comment "Temporada de la serie.")
        (type INTEGER)
        (range 1 1000)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot num_capitol
;+      (comment "Nombre del capitol de la serie.")
        (type INTEGER)
        (range 1 1000)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (multislot actorsS
;+      (comment "Actors de la serie.")
        (type INSTANCE)
;+      (allowed-classes Persona)
        (create-accessor read-write)))

(defclass Documental "Representa els continguts de tipus documental, ja siguin d'animals, telediaris, etc."
    (is-a Contingut)
    (role concrete))

(defclass Historia "Documentals històrics, que expliquen tant la prehistòria, com el succés de la societat humana."
    (is-a Documental)
    (role concrete)
    (single-slot epoca
;+      (comment "Epoca en que esta enfocat el documental.")
        (type SYMBOL)
        (allowed-values Moderna Medieval Prehist%C3%B2ria Classica SegleXX Romanticisme SegleXIX Actual Futur)
;+      (cardinality 1 1)
        (create-accessor read-write)))

(defclass Naturalesa "Els documentals de naturalesa són els més habituals en televisió. Mostren el món animal, o simplement el món geològic, entre altres."
    (is-a Documental)
    (role concrete)
    (single-slot tema
;+      (comment "Tema  dintre de la naturalesa.")
        (type SYMBOL)
        (allowed-values Geologia Mamifers Peixos Insectes Clima Aus Reptils AnimalsGeneral)
;+      (cardinality 1 1)
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
;+      (comment "Ambit del que tracta aquest documental.")
        (type SYMBOL)
        (allowed-values Informatica Telecomunicacions Aviacio Nautica Construccio Mecanica)
;+      (cardinality 1 1)
        (create-accessor read-write)))

(defclass Persona "Clase persona. Ens servira tant per definir els usuaris del nostre sistema, com per definir els actors, directors dels continguts."
    (is-a USER)
    (role concrete)
    (multislot idiomes
;+      (comment "Idiomes que enten la persona.")
        (type SYMBOL)
        (allowed-values Angles Frances Catala Espanyol Italia)
        (create-accessor read-write))
    (single-slot nom
        (type STRING)
;+      (cardinality 1 1)
        (create-accessor read-write))
    (single-slot orientacioSexual
;+      (comment "Orientacio sexual de la persona.")
        (type SYMBOL)
        (allowed-values heterosexual homosexual bisexual)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot estatCivil
;+      (comment "La persona esta casada, divorciada, etc?")
        (type SYMBOL)
        (allowed-values casada divorciada soltera separada)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot edat
;+      (comment "Edat de la persona")
        (type INTEGER)
        (range 0 120)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot sexe
;+      (comment "Sexe de la persona")
        (type SYMBOL)
        (allowed-values home dona)
;+      (cardinality 0 1)
        (create-accessor read-write))
    (single-slot nivellEconomic
;+      (comment "Sou que guanya aquesta persona per fer-se una idea del nivell economic.")
        (type FLOAT)
        (range 0.0 1.0E12)
;+      (cardinality 0 1)
        (create-accessor read-write)))

(defclass Genere "Representa el genere del contingut i es fa servir tant per cine com per series.\n\nLos géneros cinematográficos se clasifican según los elementos comunes de las películas que abarquen, originalmente según sus aspectos formales (ritmo, estilo o tono y, sobre todo, el sentimiento que busquen provocar en el espectador, ajuste). Alternativamente, los géneros cinematográficos se definen por su ambientación, estilo o por su formato. Los géneros son a menudo concretados para formar subgéneros, y también pueden ser combinados para formar géneros híbridos.\n\nActualmente no existe un consenso en cuanto a géneros cinematográficos se refiere y se da una compleja serie de clasificaciones."
    (is-a USER)
    (role concrete)
    (single-slot nomGenere
;+      (comment "Nom del genere al que fa referencia la classe.")
        (type STRING)
;+      (cardinality 1 1)
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


; Sat May 07 14:16:09 CEST 2011
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
    (genere [TVornoTV_Class17])
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

    (nomGenere "Espai exterior"))

([TVornoTV_Class62] of  Persona

    (nom "Kate Winslet")
    (sexe dona))

([TVornoTV_Class63] of  Persona

    (nom "Billy Zane")
    (sexe home))

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
    (slot orientacio-sexual)
    (slot discapacitat-audiovisual)
)
;;; Inicialitzem el sistema amb un usuari desconegut
(deffacts tipus-usuari
    (usuari
        (edat -1)
        (sexe desconegut)
        (estat-civil desconegut)
        (orientacio-sexual desconegut)
	(discapacitat-audiovisual desconegut)
	
    )
)
;;; Template que emmagatzema una recomanacio



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
;;; Fa una pregunta a la que s'ha de respondre "si", "no", "potser-si", "potser-no" O "indiferent"
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
;;; Quina edat tens? (0-120)
(defrule determinar-edat
    ?u <- (usuari (edat -1))
    =>
    (bind ?edatLlegida (obte-nombre "Quina edat tens? "))
    (modify ?u (edat ?edatLlegida))
)
;;; Ets home o dona? (home, dona)
(defrule determinar-sexe
    ?u <- (usuari (sexe desconegut))
    =>
    (bind ?sexeLlegit (pregunta (str-cat "Ets home o dona? (home/dona) ") home dona))
    (modify ?u (sexe ?sexeLlegit))
)
;;; Quin és el teu estat civil? (casat, separat, divorciat, solter, ajuntat)
(defrule determinar-estat-civil
    ?u <- (usuari (estat-civil desconegut))
    =>
    (bind ?estatCivilLlegit(pregunta (str-cat "Quin és el teu estat civil? (casat/separat/divorciat/solter/ajuntat) ") casat separat divorciat solter ajuntat))
    (modify ?u (estat-civil ?estatCivilLlegit))
)
;;; Posa en ordre els idiomes que entenguis? (cat, esp, fra, it, en, jp)
;;     TODO

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
    (bind ?orientSexualLlegida (pregunta (str-cat "Orientació sexual? (homosexual/heterosexual) ") homosexual, heterosexual))
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
;;;;Si->I els teus estudis que son, de lletres, de ciencia, de tecnologia o d'art? (lletres, ciencia, tecnologia, art)

;;Treballes? (si,no)
;;;;Si-> [Si té estudis] -> I el teu treball esta relacionat amb els teus estudis? (si,no)
;;;;Sino->En quin sector treballes? (construccio, legal, politic, economic, tecnologic, cientific, artistic, altres)

;;T'agrada el que fas? (si,no)

;;De la seguent pregunta podem deduir si li agrada la politica, l'actualitat, les noticies.
;;Recentment hi ha un conflicte belic amb les tropes de Muamar el Gadafi, t'ha interesat el tema? (gens, poc, normal, molt, extremis)

;;;Podem posar-hi documentals de ciencia i medi ambient
;;Et preocupa la radiacio deguda a la fuga de Fukushima? (si, no, ns)

;;;Sabem que te temps i que li agraden els "cotilleos", corazon, i programes amb poc contingut intel·lectual.
;;Has seguit la boda real de Guillermo i Kate? (si,no)
;;Saps qui és la Princesa del Pueblo? (si,no.. resposta: es la belen esteban)

;;;D'aqui podem deduir si es una persona mes practica o teorica i per tant si li interessa mes per exemple les lletres o la tecnologia.
;;Tens vehicle propi? (si,no)
;;Si te algun problema no molt greu, faries mai cap reparacio tu mateix (1), o el portaries al mecanic (2)? (1,2)

;;;D'aquesta pregunta podem deduir si 1:Interessat en oci in-door (xbox, pelicules, callejeros), 2:Interessat en oci out-of-door, 3:Molt estudios, in-door, 4:varietat
;;Els caps de semana, habitualment... surts de festa (1), disfrutes de la natura (2), aprofites per estudiar o aprendre coses pel teu compte (3), una mica de tot (4)

;;;Li agrada l'acció.
;;De petit, a l'estiu, jugaves amb pistoles d'aigua?(si,no)

;;;Te certa aficio pels animals.
;;Tens mascotes?

;;;;Refinem el contingut dels documentals
;;Les teves aficions, es centren en temes de mar, de muntanya, tecnologia, lectura, societat, altres?

;;;;Refinem encara més les preferencies de Animacio, Accio, Politica, Economia, Oci->Ciencia ficcio, Oci->Comedia, Romantica, etc.
;;Si et dono a triar entre 1:Bambi, 2:Terminator II, 3:El discurso del Rei, 4:Perdidos, 5:Buenafuente, 6:Sexo en nueva york, 7:Brokeback Mountain, amb quin ordre de preferencia
;;les col·locaries? (1,2,3,4,5,6,7)


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
;;Quantes hores de televisio al dia veus normalment? (0-24)
;;Vols que cada contingut sigui mes be llarg (1), curt (2), o t'es igual (3)? (1,2,3)
;;Dels temes següents, n'hi ha cap que t'apasioni?: belic, culte, espai, esportiu, historic, oest, policiaca, peixos, mamifers, mar, muntanya, geologia, terror, suspense, clima, informatica,
;; telecos, societat,xxx.
;;(Si edat > 18) Vols permetre cap contingut XXX? (si,no)
;;(Si edat > 18) Vols permetre continguts que puguin ferir la sensibilitat de les persones? (si,no)
;;T'agradaria veure alguns continguts amb versio original?
;;; Saltem al modul de les assumpcions

(defrule a-assumpcions-incondicionals
    (declare (salience -1))
    =>
    (focus assumpcions-incondicionals)
)
;;; 2.1 MODUL D'ASSUMPCIONS
(defmodule assumpcions-incondicionals "Modul d'assignacions incondicionals"
    (import preguntes-especifiques ?ALL)
    (export ?ALL)
)
;;; Sembla que aqui juguem amb probabilitats.
;;; Es creen fets en funció de la info deduida al modul 1 per definir l'usuari.
;;****************************************************************************************************************************************ASSUMPCIONS
;;;Restriccions per edat
;;Si l'usuari te entre 16-65 anys, no li interessa gaire "Animacio".
;;Si l'usuari te menys de 13 anys, li interessa molt "Animacio"
(defrule infantil
    (usuari (edat ?e&: (< ?e 13)))
    =>
    (assert
        (interesaMolt Animacio)
    )
)


;;Si l'usuari te mes de 65 anys, no li interessa massa XXX
;;;Per orientacio sexual, sexe i estat civil
;;Si es homosexual no li posem pelicules XXX amb contingut d'ambientacio hetero, i viceversa.
;;Si es dona, baixem la probabilitat que vulgui XXX i augmentem romantiques
(defrule prob-xxx
    (usuari (sexe dona))
    =>
    (assert
        (interesaMolt Romantiques)
        (interesaPoc XXX)
    )
)
;;Si es solter, separat o divorciat, augmentem probabilitat XXX i disminuim Romantiques
;;Si es ajuntat augmentem romantiques
;;Si es casat i edat < 40 anys, segurament s'ha casat fa poc. Augmentar romantiques.
;;;Discapacitat i idioma:
;;Augmentar probabilitats de pelicules amb primer i 2on idioma de l'usuari (si es que en te 2)
;;Si es ceg, baixar probabilitat de pel·licules amb alt contingut grafic, com pelicules 3D????¿?¿ <-A revisar
;;Si es ceg, fer irrellevant el que hi hagi subtitols o no.
;;Si es ceg, augmentar probabilitat de genere estil Debat o Tertulia

(defrule a-esborrar-instancies
	(declare (salience -1))
	=>
	(focus esborrar-instancies)
)

;;; 2.2 MODUL ESBORRAR INSTANCIES
;;;
;;*************************************************************************************************************************************ESBORRAR INSTANCIES
(defmodule esborrar-instancies "Modul d'esborrar instances"
    (import assumpcions-incondicionals ?ALL)
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
;;Si no vol XXX eliminem tot XXX
(defrule esborrar-no-vol-xxx
    (interesaPoc XXX)
    ?contingut <- (object (is-a Contingut) (genere $?generes))
    =>
    (bind ?i 1)
    (while (<= ?i (length$ $?generes))
	do 
		(bind ?genereActual (nth$ ?i $?generes))
;; 		(printout t ?genereActual crlf)
		(printout t (send (instance-address * ?genereActual) get-nomGenere) crlf)
		(bind ?i (+ ?i 1))
    )
;;     (if (str-compare (send ?contingut get-nomGenere) Comedia)
;;             ;;ha de ser xxx, fent proves amb comedia, no 'sha de comparar directamente
;;             ;;s'ha de comparar accedint a les instancies de genere i mirar si hi ha una
;;             ;;amb nomGenere Comedia, xxx o el que sigui
;;     then
;; ;;         (send ?contingut delete)
;;     )
)
;;Si no vol continguts que pugin ferir sensibilitat, eliminar tots els que tinguin contingut dur.
;;;Discapacitat i idioma:
;;Si te discapacitat auditiva, eliminar tot el que no tingui subtitols.
;;Si l'idioma del contingut no apareix a la llista de idiomes que enten l'usuari i no es subtitulat, eliminar-lo.
;;


;; aixo es temporal, pel micro prototip
(defrule a-solucions
	(declare (salience -1))
	=>
	(focus solucions)
)

;;;
;;; 3.1 MODUL QUE FA L'ASSOCIACIO HEURISTICA
;;;
(defmodule associacio-heuristica "Modul associació heurística"
    (import esborrar-instancies ?ALL)
    (export ?ALL)
)
;;****************************************************************************************************************************************************

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

(defrule escriu-adequades
	(declare (salience 5))
	?contingut <- (object (is-a Contingut))
	=>
	(printout t (send ?contingut get-titol) crlf)
)



