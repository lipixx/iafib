;;; Sistema Expert per a la recomanació de lloguer d'habitatges
;;; Assignatura: Intel·ligencia Artificial - FIB - UPC
;;; Curs 2009/2010 1r Quadrimestre


; Sat Jan 02 13:00:35 CET 2010


; Mon Jan 04 17:24:14 CET 2010
; 
;+ (version "3.4.1")
;+ (build "Build 537")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot numPisos
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teVistes
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot id
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot situacio
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot teJardi
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teCelobert
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teAireCondicionat
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teTerrassa
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nom
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot prefereixSerAProp
		(type SYMBOL)
;+		(allowed-parents Servei)
		(create-accessor read-write))
	(single-slot numParking
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot pis
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot tipus
		(type SYMBOL)
		(allowed-values simple doble suite)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot prefereixSerLluny
		(type SYMBOL)
;+		(allowed-parents Servei)
		(create-accessor read-write))
	(single-slot telefon
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot data
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot DNI
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot ID
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot tePati
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot preu
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot tipusHabitatge
		(type SYMBOL)
		(allowed-values pis duplex)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot m2
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot estat
		(type SYMBOL)
		(allowed-values obra-nova bon-estat per-reformar)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot orientacio
		(type SYMBOL)
		(allowed-values nord sud est oest nord-est nord-oest sud-est sud-oest)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot numBanys
;+		(comment "nombre de banys sense comptar el de la suite si en té")
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot requereixSerLluny
		(type SYMBOL)
;+		(allowed-parents Servei)
		(create-accessor read-write))
	(single-slot teBalco
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot esAccessible
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot estaMoblat
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teAscensor
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot faReferenciaA
		(type INSTANCE)
;+		(allowed-classes Habitatge)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot esPotMascotes
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot posY
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot posX
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot requereixSerAProp
		(type SYMBOL)
;+		(allowed-parents Servei)
		(create-accessor read-write))
	(multislot te
		(type INSTANCE)
;+		(allowed-classes Dormitori)
		(create-accessor read-write))
	(single-slot cognoms
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teCalefaccio
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot numHabitacions
;+		(comment "Nombre d'habitacions sense comptar suite en el cas que n'hi hagi.")
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot suite
;+		(comment "té suite (habitació + bany)")
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Oferta
	(is-a USER)
	(role concrete)
	(single-slot data
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot faReferenciaA
		(type INSTANCE)
;+		(allowed-classes Habitatge)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot preu
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot id
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Habitatge
	(is-a USER)
	(role concrete)
	(single-slot esAccessible
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot estaMoblat
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot tePati
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teVistes
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot esPotMascotes
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot id
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot posY
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teJardi
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot m2
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot posX
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot estat
		(type SYMBOL)
		(allowed-values obra-nova bon-estat per-reformar)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teCelobert
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot te
		(type INSTANCE)
;+		(allowed-classes Dormitori)
		(create-accessor read-write))
	(single-slot teAireCondicionat
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teTerrassa
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teCalefaccio
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot numBanys
;+		(comment "nombre de banys sense comptar el de la suite si en té")
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot numParking
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Casa
	(is-a Habitatge)
	(role concrete)
	(single-slot numPisos
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Pis
	(is-a Habitatge)
	(role concrete)
	(single-slot orientacio
		(type SYMBOL)
		(allowed-values nord sud est oest nord-est nord-oest sud-est sud-oest)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot pis
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teAscensor
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot tipusHabitatge
		(type SYMBOL)
		(allowed-values pis duplex)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot teBalco
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Servei
	(is-a USER)
	(role concrete)
	(single-slot esAccessible
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot nom
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot id
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot posY
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot posX
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass TransportPublic
	(is-a Servei)
	(role concrete))

(defclass Metro
	(is-a TransportPublic)
	(role concrete))

(defclass Bus
	(is-a TransportPublic)
	(role concrete))

(defclass CentreMedic
	(is-a Servei)
	(role concrete))

(defclass Educacio
	(is-a Servei)
	(role concrete))

(defclass Escola
	(is-a Educacio)
	(role concrete))

(defclass Universitat
	(is-a Educacio)
	(role concrete))

(defclass ZonaVerda
	(is-a Servei)
	(role concrete))

(defclass Oci
	(is-a Servei)
	(role concrete))

(defclass Discoteca
	(is-a Oci)
	(role concrete))

(defclass Bar
	(is-a Oci)
	(role concrete))

(defclass Cinema
	(is-a Oci)
	(role concrete))

(defclass Teatre
	(is-a Oci)
	(role concrete))

(defclass Biblioteca
	(is-a Servei)
	(role concrete))

(defclass Supermercat
	(is-a Servei)
	(role concrete))

(defclass Dormitori
	(is-a USER)
	(role concrete)
	(single-slot tipus
		(type SYMBOL)
		(allowed-values simple doble suite)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Carrer
	(is-a USER)
	(role concrete)
	(single-slot nom
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot id
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot posY
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot posX
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))



(definstances instancies
	; Mon Jan 04 17:24:14 CET 2010
; 
;+ (version "3.4.1")
;+ (build "Build 537")

([MAIN::iaHabitatge_Class10004] of  Carrer

	(id "2")
	(nom "Maduixa")
	(posX 450)
	(posY 0))

([MAIN::iaHabitatge_Class10006] of  Carrer

	(id "4")
	(nom "Taronja")
	(posX 1050)
	(posY 0))

([MAIN::iaHabitatge_Class10009] of  Carrer

	(id "20")
	(nom "Brahms")
	(posX 0)
	(posY 1950))

([MAIN::iaHabitatge_Class10011] of  Carrer

	(id "22")
	(nom "Dvorak")
	(posX 0)
	(posY 2550))

([MAIN::iaHabitatge_Class10012] of  Carrer

	(id "10")
	(nom "Llimona")
	(posX 2850)
	(posY 0))

([MAIN::iaHabitatge_Class10014] of  Carrer

	(id "25")
	(nom "Bach")
	(posX 0)
	(posY 3450))

([MAIN::iaHabitatge_Class10016] of  Carrer

	(id "16")
	(nom "Beethoven")
	(posX 0)
	(posY 750))

([MAIN::iaHabitatge_Class10018] of  Dormitori

	(tipus simple))

([MAIN::iaHabitatge_Class10019] of  Dormitori

	(tipus doble))

([MAIN::iaHabitatge_Class10020] of  Dormitori

	(tipus suite))

([MAIN::iaHabitatge_Class10021] of  Pis

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat per-reformar)
	(id "3")
	(m2 50)
	(numBanys 2)
	(numParking 0)
	(orientacio sud)
	(pis 5)
	(posX 2000)
	(posY 300)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10018])
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(tePati FALSE)
	(teTerrassa FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10023] of  Supermercat

	(esAccessible TRUE)
	(id "1")
	(nom "Hipercar")
	(posX 200)
	(posY 600))

([MAIN::iaHabitatge_Class10025] of  Metro

	(esAccessible TRUE)
	(id "L1-Penes")
	(nom "Penes")
	(posX 1600)
	(posY 2000))

([MAIN::iaHabitatge_Class10026] of  Metro

	(esAccessible TRUE)
	(id "L1-Tolc")
	(nom "Tolc")
	(posX 1200)
	(posY 2000))

([MAIN::iaHabitatge_Class10027] of  Metro

	(esAccessible TRUE)
	(id "L1-SantAlbert")
	(nom "SantAlbert")
	(posX 800)
	(posY 2000))

([MAIN::iaHabitatge_Class10028] of  Metro

	(esAccessible TRUE)
	(id "L1-SantaGavina")
	(nom "SantaGavina")
	(posX 400)
	(posY 2000))

([MAIN::iaHabitatge_Class10029] of  Metro

	(esAccessible TRUE)
	(id "L1-MercatVell")
	(nom "MercatVell")
	(posX 0)
	(posY 2000))

([MAIN::iaHabitatge_Class10030] of  Supermercat

	(id "2")
	(nom "Hipercar")
	(posX 800)
	(posY 3000))

([MAIN::iaHabitatge_Class10031] of  CentreMedic

	(esAccessible TRUE)
	(id "2")
	(nom "Sant Pere de Deu")
	(posX 1200)
	(posY 2100))

([MAIN::iaHabitatge_Class10032] of  CentreMedic

	(esAccessible TRUE)
	(id "3")
	(nom "Clinica Aralechan")
	(posX 600)
	(posY 400))

([MAIN::iaHabitatge_Class10033] of  CentreMedic

	(esAccessible TRUE)
	(id "4")
	(nom "Clinica de la Columna")
	(posX 2800)
	(posY 3900))

([MAIN::iaHabitatge_Class10034] of  Escola

	(esAccessible TRUE)
	(id "2")
	(nom "Escola Manos")
	(posX 2100)
	(posY 600))

([MAIN::iaHabitatge_Class10035] of  Escola

	(esAccessible TRUE)
	(id "3")
	(nom "Escola Pineda")
	(posX 700)
	(posY 300))

([MAIN::iaHabitatge_Class10036] of  Universitat

	(esAccessible TRUE)
	(id "1")
	(nom "UPB")
	(posX 300)
	(posY 1000))

([MAIN::iaHabitatge_Class10037] of  Universitat

	(esAccessible TRUE)
	(id "2")
	(nom "UB")
	(posX 2000)
	(posY 1800))

([MAIN::iaHabitatge_Class10038] of  Universitat

	(esAccessible TRUE)
	(id "3")
	(nom "UAB")
	(posX 3900)
	(posY 3900))

([MAIN::iaHabitatge_Class10040] of  Supermercat

	(id "2")
	(nom "Carpabo")
	(posX 600)
	(posY 2200))

([MAIN::iaHabitatge_Class10041] of  Supermercat

	(esAccessible TRUE)
	(id "3")
	(nom "Carpabo")
	(posX 1800)
	(posY 1000))

([MAIN::iaHabitatge_Class10042] of  Supermercat

	(esAccessible TRUE)
	(id "4")
	(nom "Carpabo")
	(posX 2700)
	(posY 1500))

([MAIN::iaHabitatge_Class10043] of  Supermercat

	(id "5")
	(nom "Carpabo")
	(posX 3800)
	(posY 3000))

([MAIN::iaHabitatge_Class10044] of  Supermercat

	(esAccessible TRUE)
	(id "1")
	(nom "Carpabo")
	(posX 2500)
	(posY 2700))

([MAIN::iaHabitatge_Class10045] of  ZonaVerda

	(esAccessible TRUE)
	(id "1")
	(nom "PlacaGran")
	(posX 100)
	(posY 3900))

([MAIN::iaHabitatge_Class10046] of  ZonaVerda

	(esAccessible TRUE)
	(id "2")
	(nom "PlacaPetita")
	(posX 500)
	(posY 1500))

([MAIN::iaHabitatge_Class10047] of  ZonaVerda

	(id "3")
	(nom "PlacaMitjana")
	(posX 2900)
	(posY 3000))

([MAIN::iaHabitatge_Class10048] of  ZonaVerda

	(esAccessible TRUE)
	(id "4")
	(nom "PlacaNova")
	(posX 3700)
	(posY 200))

([MAIN::iaHabitatge_Class10049] of  ZonaVerda

	(esAccessible TRUE)
	(id "5")
	(nom "PlacaVella")
	(posX 2400)
	(posY 1700))

([MAIN::iaHabitatge_Class10050] of  Discoteca

	(id "1")
	(nom "Giraffe")
	(posX 2100)
	(posY 2200))

([MAIN::iaHabitatge_Class10051] of  Discoteca

	(esAccessible TRUE)
	(id "2")
	(nom "Dance Club")
	(posX 1700)
	(posY 1300))

([MAIN::iaHabitatge_Class10052] of  Discoteca

	(id "3")
	(nom "Fashion Disco")
	(posX 3300)
	(posY 900))

([MAIN::iaHabitatge_Class10053] of  Supermercat

	(esAccessible TRUE)
	(id "1")
	(nom "El Rectangle")
	(posX 1900)
	(posY 2100))

([MAIN::iaHabitatge_Class10054] of  Bar

	(esAccessible TRUE)
	(id "1")
	(nom "Bar Manolo")
	(posX 300)
	(posY 500))

([MAIN::iaHabitatge_Class10055] of  Cinema

	(esAccessible TRUE)
	(id "1")
	(nom "Cinema Reinuar")
	(posX 800)
	(posY 900))

([MAIN::iaHabitatge_Class10056] of  CentreMedic

	(esAccessible TRUE)
	(id "5")
	(nom "Hospital Sagrat Rombe")
	(posX 200)
	(posY 3700))

([MAIN::iaHabitatge_Class10057] of  CentreMedic

	(esAccessible TRUE)
	(id "6")
	(nom "CAP Eix Estret")
	(posX 2100)
	(posY 2700))

([MAIN::iaHabitatge_Class10058] of  CentreMedic

	(esAccessible TRUE)
	(id "7")
	(nom "Clinica Familiabella")
	(posX 3300)
	(posY 1700))

([MAIN::iaHabitatge_Class10059] of  Escola

	(esAccessible TRUE)
	(id "4")
	(nom "Escola Sant Antoni")
	(posX 600)
	(posY 2700))

([MAIN::iaHabitatge_Class10060] of  Escola

	(esAccessible TRUE)
	(id "5")
	(nom "Escola Sagrat Trevol")
	(posX 1500)
	(posY 2200))

([MAIN::iaHabitatge_Class10061] of  Escola

	(esAccessible TRUE)
	(id "6")
	(nom "Escola Minerva")
	(posX 3100)
	(posY 3300))

([MAIN::iaHabitatge_Class10063] of  Supermercat

	(esAccessible TRUE)
	(id "3")
	(nom "Hipermarket")
	(posX 1400)
	(posY 1800))

([MAIN::iaHabitatge_Class10064] of  Supermercat

	(id "4")
	(nom "Hiperrapid")
	(posX 3000)
	(posY 900))

([MAIN::iaHabitatge_Class10065] of  Metro

	(esAccessible TRUE)
	(id "L3-Drasseres")
	(nom "Drasseres")
	(posX 2000)
	(posY 3500))

([MAIN::iaHabitatge_Class10066] of  Metro

	(esAccessible TRUE)
	(id "L3-Auditori")
	(nom "Auditori")
	(posX 2000)
	(posY 3000))

([MAIN::iaHabitatge_Class10067] of  Metro

	(esAccessible TRUE)
	(id "L3-Polonia")
	(nom "Polonia")
	(posX 2000)
	(posY 2500))

([MAIN::iaHabitatge_Class10068] of  Metro

	(esAccessible TRUE)
	(id "L3-Rocafeble")
	(nom "Rocafeble")
	(posX 2000)
	(posY 2000))

([MAIN::iaHabitatge_Class10069] of  Metro

	(esAccessible TRUE)
	(id "L3-Mercatbo")
	(nom "Mercatbo")
	(posX 2000)
	(posY 1500))

([MAIN::iaHabitatge_Class10070] of  Metro

	(esAccessible TRUE)
	(id "L3-Gran Via")
	(nom "Gran Via")
	(posX 2300)
	(posY 1100))

([MAIN::iaHabitatge_Class10071] of  Metro

	(esAccessible TRUE)
	(id "L3-Passeig de Riure")
	(nom "Passeig de Riure")
	(posX 2700)
	(posY 700))

([MAIN::iaHabitatge_Class10072] of  Metro

	(esAccessible TRUE)
	(id "L3-Patinets")
	(nom "Patinets")
	(posX 3100)
	(posY 300))

([MAIN::iaHabitatge_Class10073] of  ZonaVerda

	(esAccessible TRUE)
	(id "6")
	(nom "PlacaBella")
	(posX 1100)
	(posY 2400))

([MAIN::iaHabitatge_Class10074] of  Discoteca

	(esAccessible TRUE)
	(id "4")
	(nom "Otto Club")
	(posX 600)
	(posY 3000))

([MAIN::iaHabitatge_Class10075] of  Discoteca

	(esAccessible TRUE)
	(id "5")
	(nom "Sorreta")
	(posX 1200)
	(posY 500))

([MAIN::iaHabitatge_Class10076] of  Bar

	(esAccessible TRUE)
	(id "2")
	(nom "Bar Fran")
	(posX 2500)
	(posY 300))

([MAIN::iaHabitatge_Class10077] of  Bar

	(esAccessible TRUE)
	(id "3")
	(nom "Bar Aqui te espero")
	(posX 1800)
	(posY 1800))

([MAIN::iaHabitatge_Class10078] of  Bar

	(esAccessible TRUE)
	(id "4")
	(nom "Bar Trobada")
	(posX 1800)
	(posY 2700))

([MAIN::iaHabitatge_Class10079] of  Bar

	(esAccessible TRUE)
	(id "5")
	(nom "Bar Dharma")
	(posX 3300)
	(posY 3300))

([MAIN::iaHabitatge_Class10080] of  Bar

	(id "6")
	(nom "Bar Filemon")
	(posX 3700)
	(posY 1800))

([MAIN::iaHabitatge_Class10081] of  Cinema

	(esAccessible TRUE)
	(id "2")
	(nom "Cinema Gol")
	(posX 2100)
	(posY 1700))

([MAIN::iaHabitatge_Class10082] of  Cinema

	(esAccessible TRUE)
	(id "3")
	(nom "Cinema Balaguer")
	(posX 1400)
	(posY 3400))

([MAIN::iaHabitatge_Class10083] of  Cinema

	(esAccessible TRUE)
	(id "4")
	(nom "Cinema Crispetes")
	(posX 3100)
	(posY 2200))

([MAIN::iaHabitatge_Class10084] of  Teatre

	(esAccessible TRUE)
	(id "1")
	(nom "Teatre Borros")
	(posX 1500)
	(posY 1500))

([MAIN::iaHabitatge_Class10085] of  Teatre

	(id "2")
	(nom "Teatre Coloseum")
	(posX 2600)
	(posY 3400))

([MAIN::iaHabitatge_Class10086] of  Teatre

	(esAccessible TRUE)
	(id "3")
	(nom "Tetre Tirolina")
	(posX 2700)
	(posY 1100))

([MAIN::iaHabitatge_Class10087] of  Biblioteca

	(esAccessible TRUE)
	(id "1")
	(nom "Biblioteca Pere Fuster")
	(posX 2400)
	(posY 2100))

([MAIN::iaHabitatge_Class10088] of  Biblioteca

	(id "2")
	(nom "Biblioteca Pare Manya")
	(posX 900)
	(posY 1500))

([MAIN::iaHabitatge_Class10089] of  Biblioteca

	(esAccessible TRUE)
	(id "3")
	(nom "Biblioteca Vapornou")
	(posX 3200)
	(posY 3500))

([MAIN::iaHabitatge_Class10090] of  Biblioteca

	(esAccessible TRUE)
	(id "4")
	(nom "Can Pomers")
	(posX 1200)
	(posY 2800))

([MAIN::iaHabitatge_Class10091] of  Supermercat

	(esAccessible TRUE)
	(id "2")
	(nom "Gran Via 3")
	(posX 700)
	(posY 3900))

([MAIN::iaHabitatge_Class10092] of  Supermercat

	(esAccessible TRUE)
	(id "3")
	(nom "Aeki")
	(posX 1500)
	(posY 300))

([MAIN::iaHabitatge_Class10094] of  Casa

	(esAccessible TRUE)
	(esPotMascotes FALSE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "15")
	(m2 300)
	(numBanys 3)
	(numParking 2)
	(numPisos 2)
	(posX 1400)
	(posY 2700)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10095] of  Casa

	(esPotMascotes FALSE)
	(estaMoblat FALSE)
	(estat per-reformar)
	(id "3")
	(m2 250)
	(numBanys 3)
	(numParking 1)
	(numPisos 1)
	(posX 1300)
	(posY 3800)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat FALSE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10096] of  Pis

	(estat obra-nova)
	(id "2")
	(m2 75)
	(numBanys 1)
	(numParking 1)
	(orientacio nord-est)
	(pis 2)
	(posX 1200)
	(posY 300)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teBalco TRUE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10098] of  Pis

	(esPotMascotes TRUE)
	(estat per-reformar)
	(id "4")
	(m2 45)
	(numBanys 1)
	(numParking 0)
	(orientacio nord)
	(pis 2)
	(posX 3600)
	(posY 1200)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teVistes FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10099] of  Pis

	(esPotMascotes TRUE)
	(estat per-reformar)
	(id "5")
	(m2 45)
	(numBanys 1)
	(numParking 0)
	(orientacio nord)
	(pis 2)
	(posX 2700)
	(posY 1200)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teVistes FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10100] of  Pis

	(esPotMascotes TRUE)
	(estat per-reformar)
	(id "6")
	(m2 45)
	(numBanys 1)
	(numParking 0)
	(orientacio nord)
	(pis 2)
	(posX 2400)
	(posY 1500)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teVistes FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10101] of  Pis

	(esPotMascotes TRUE)
	(estat bon-estat)
	(id "7")
	(m2 45)
	(numBanys 1)
	(numParking 0)
	(orientacio nord)
	(pis 2)
	(posX 2700)
	(posY 1700)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teVistes FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10102] of  Pis

	(esPotMascotes TRUE)
	(estat bon-estat)
	(id "8")
	(m2 60)
	(numBanys 1)
	(numParking 0)
	(orientacio nord)
	(pis 2)
	(posX 2400)
	(posY 1800)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10019])
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teVistes FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10103] of  Pis

	(esPotMascotes TRUE)
	(estat bon-estat)
	(id "9")
	(m2 90)
	(numBanys 1)
	(numParking 1)
	(orientacio nord)
	(pis 4)
	(posX 3200)
	(posY 2900)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10020])
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teVistes FALSE)
	(tipusHabitatge duplex))

([MAIN::iaHabitatge_Class10104] of  Pis

	(estaMoblat TRUE)
	(estat bon-estat)
	(id "10")
	(m2 60)
	(numBanys 2)
	(numParking 0)
	(orientacio nord)
	(pis 3)
	(posX 2200)
	(posY 3800)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teBalco TRUE)
	(tePati FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10105] of  Pis

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat per-reformar)
	(id "11")
	(m2 150)
	(numBanys 3)
	(numParking 1)
	(orientacio sud)
	(pis 10)
	(posX 200)
	(posY 1800)
	(te
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE)
	(tipusHabitatge duplex))

([MAIN::iaHabitatge_Class10106] of  Casa

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat bon-estat)
	(id "4")
	(m2 400)
	(numBanys 4)
	(numParking 0)
	(numPisos 2)
	(posX 1800)
	(posY 2200)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10107] of  Casa

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "5")
	(m2 600)
	(numBanys 4)
	(numParking 2)
	(numPisos 3)
	(posX 400)
	(posY 3800)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10019])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10110] of  Pis

	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat per-reformar)
	(id "12")
	(m2 30)
	(numBanys 1)
	(numParking 0)
	(orientacio oest)
	(pis 2)
	(posX 3700)
	(posY 400)
	(te [MAIN::iaHabitatge_Class10018])
	(teAireCondicionat FALSE)
	(teAscensor TRUE)
	(teCalefaccio TRUE)
	(teTerrassa TRUE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10111] of  Pis

	(estaMoblat TRUE)
	(id "13")
	(m2 30)
	(numBanys 1)
	(numParking 0)
	(orientacio sud)
	(pis 4)
	(posX 3100)
	(posY 1100)
	(te [MAIN::iaHabitatge_Class10018])
	(teBalco TRUE)
	(teVistes FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10112] of  Pis

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "14")
	(m2 45)
	(numBanys 1)
	(numParking 0)
	(orientacio sud)
	(pis 3)
	(posX 2400)
	(posY 2400)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teVistes FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10113] of  Pis

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "15")
	(m2 70)
	(numBanys 2)
	(numParking 0)
	(orientacio sud)
	(pis 7)
	(posX 1800)
	(posY 2400)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10020])
	(teAscensor TRUE)
	(teCalefaccio TRUE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10114] of  Pis

	(esAccessible FALSE)
	(estat bon-estat)
	(id "16")
	(m2 45)
	(numBanys 2)
	(numParking 1)
	(orientacio sud)
	(pis 9)
	(posX 2700)
	(posY 3000)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teVistes TRUE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10115] of  Pis

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "17")
	(m2 150)
	(numBanys 3)
	(numParking 0)
	(orientacio sud)
	(pis 11)
	(posX 1200)
	(posY 900)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10020])
	(teAireCondicionat TRUE)
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE)
	(tipusHabitatge duplex))

([MAIN::iaHabitatge_Class10116] of  Pis

	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(id "19")
	(m2 100)
	(numBanys 2)
	(numParking 0)
	(orientacio sud-est)
	(pis 6)
	(posX 900)
	(posY 1800)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(tePati TRUE)
	(teTerrassa FALSE)
	(teVistes TRUE)
	(tipusHabitatge duplex))

([MAIN::iaHabitatge_Class10117] of  Pis

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "20")
	(m2 150)
	(numBanys 3)
	(numParking 0)
	(orientacio sud)
	(pis 11)
	(posX 1800)
	(posY 2900)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10020])
	(teAireCondicionat TRUE)
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE)
	(tipusHabitatge duplex))

([MAIN::iaHabitatge_Class10118] of  Pis

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "21")
	(m2 150)
	(numBanys 3)
	(numParking 0)
	(orientacio sud)
	(pis 11)
	(posX 600)
	(posY 3300)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10020])
	(teAireCondicionat TRUE)
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE)
	(tipusHabitatge duplex))

([MAIN::iaHabitatge_Class10119] of  Pis

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "22")
	(m2 150)
	(numBanys 3)
	(numParking 0)
	(orientacio sud)
	(pis 11)
	(posX 900)
	(posY 2200)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10020])
	(teAireCondicionat TRUE)
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE)
	(tipusHabitatge duplex))

([MAIN::iaHabitatge_Class10120] of  Pis

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "23")
	(m2 150)
	(numBanys 3)
	(numParking 0)
	(orientacio sud)
	(pis 11)
	(posX 3800)
	(posY 2400)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10020])
	(teAireCondicionat TRUE)
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE)
	(tipusHabitatge duplex))

([MAIN::iaHabitatge_Class10121] of  Pis

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "18")
	(m2 150)
	(numBanys 3)
	(numParking 0)
	(orientacio sud)
	(pis 11)
	(posX 1900)
	(posY 900)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10020])
	(teAireCondicionat TRUE)
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE)
	(tipusHabitatge duplex))

([MAIN::iaHabitatge_Class10122] of  Casa

	(esPotMascotes TRUE)
	(estaMoblat FALSE)
	(estat per-reformar)
	(id "6")
	(m2 350)
	(numBanys 3)
	(numParking 1)
	(numPisos 3)
	(posX 300)
	(posY 1200)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE))

([MAIN::iaHabitatge_Class10123] of  Casa

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "7")
	(m2 400)
	(numBanys 4)
	(numParking 0)
	(numPisos 2)
	(posX 2400)
	(posY 2800)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10124] of  Casa

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat per-reformar)
	(id "8")
	(m2 400)
	(numBanys 4)
	(numParking 0)
	(numPisos 2)
	(posX 2500)
	(posY 500)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10125] of  Casa

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "9")
	(m2 450)
	(numBanys 4)
	(numParking 2)
	(numPisos 2)
	(posX 1300)
	(posY 1500)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10126] of  Casa

	(esAccessible FALSE)
	(esPotMascotes TRUE)
	(estaMoblat FALSE)
	(estat per-reformar)
	(id "10")
	(m2 350)
	(numBanys 2)
	(numParking 0)
	(numPisos 2)
	(posX 3100)
	(posY 1500)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat FALSE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes FALSE))

([MAIN::iaHabitatge_Class10127] of  Casa

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat bon-estat)
	(id "11")
	(m2 4500)
	(numBanys 2)
	(numParking 2)
	(numPisos 2)
	(posX 3000)
	(posY 2400)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10128] of  Pis

	(esAccessible TRUE)
	(esPotMascotes FALSE)
	(estaMoblat FALSE)
	(estat obra-nova)
	(id "24")
	(m2 150)
	(numBanys 3)
	(numParking 1)
	(orientacio sud)
	(pis 8)
	(posX 2700)
	(posY 300)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10020])
	(teAireCondicionat TRUE)
	(teAscensor TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(teTerrassa FALSE)
	(teVistes TRUE)
	(tipusHabitatge duplex))

([MAIN::iaHabitatge_Class10129] of  Pis

	(esAccessible FALSE)
	(esPotMascotes FALSE)
	(estaMoblat FALSE)
	(estat per-reformar)
	(id "25")
	(m2 60)
	(numBanys 1)
	(numParking 0)
	(orientacio sud)
	(pis 5)
	(posX 3800)
	(posY 1700)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat FALSE)
	(teAscensor FALSE)
	(teBalco FALSE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(teJardi TRUE)
	(teTerrassa FALSE)
	(teVistes FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class10130] of  Casa

	(esAccessible TRUE)
	(esPotMascotes FALSE)
	(estaMoblat TRUE)
	(estat bon-estat)
	(id "14")
	(m2 300)
	(numBanys 3)
	(numParking 2)
	(numPisos 2)
	(posX 1800)
	(posY 500)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10131] of  Casa

	(esAccessible TRUE)
	(esPotMascotes FALSE)
	(estaMoblat TRUE)
	(estat bon-estat)
	(id "13")
	(m2 300)
	(numBanys 3)
	(numParking 2)
	(numPisos 2)
	(posX 2800)
	(posY 3700)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10132] of  Casa

	(esAccessible TRUE)
	(esPotMascotes FALSE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "12")
	(m2 600)
	(numBanys 4)
	(numParking 2)
	(numPisos 3)
	(posX 700)
	(posY 2400)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10020])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10133] of  Casa

	(esAccessible TRUE)
	(esPotMascotes FALSE)
	(estaMoblat TRUE)
	(estat obra-nova)
	(id "1")
	(m2 300)
	(numBanys 3)
	(numParking 2)
	(numPisos 2)
	(posX 900)
	(posY 3400)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class10135] of  Bus

	(esAccessible TRUE)
	(id "54-Parada1")
	(nom "54-Parada1")
	(posX 2100)
	(posY 3500))

([MAIN::iaHabitatge_Class10136] of  Bus

	(esAccessible TRUE)
	(id "54-Parada2")
	(nom "54-Parada2")
	(posX 3100)
	(posY 3100))

([MAIN::iaHabitatge_Class10137] of  Bus

	(esAccessible TRUE)
	(id "54-Parada3")
	(nom "54-Parada3")
	(posX 3300)
	(posY 2700))

([MAIN::iaHabitatge_Class10138] of  Bus

	(esAccessible TRUE)
	(id "54-Parada4")
	(nom "54-Parada4")
	(posX 2800)
	(posY 2100))

([MAIN::iaHabitatge_Class10139] of  Bus

	(esAccessible TRUE)
	(id "54-Parada5")
	(nom "54-Parada5")
	(posX 3300)
	(posY 1500))

([MAIN::iaHabitatge_Class10140] of  Bus

	(esAccessible TRUE)
	(id "54-Parada6")
	(nom "54-Parada6")
	(posX 3700)
	(posY 1500))

([MAIN::iaHabitatge_Class10141] of  Bus

	(esAccessible TRUE)
	(id "54-Parada7")
	(nom "54-Parada7")
	(posX 3700)
	(posY 700))

([MAIN::iaHabitatge_Class10142] of  Bus

	(esAccessible TRUE)
	(id "70-Parada1")
	(nom "70-Parada1")
	(posX 200)
	(posY 1500))

([MAIN::iaHabitatge_Class10143] of  Bus

	(esAccessible TRUE)
	(id "70-Parada2")
	(nom "70-Parada2")
	(posX 800)
	(posY 1200))

([MAIN::iaHabitatge_Class10144] of  Bus

	(esAccessible TRUE)
	(id "70-Parada3")
	(nom "70-Parada3")
	(posX 1400)
	(posY 1200))

([MAIN::iaHabitatge_Class10145] of  Bus

	(esAccessible TRUE)
	(id "70-Parada4")
	(nom "70-Parada4")
	(posX 2200)
	(posY 300))

([MAIN::iaHabitatge_Class17] of  Metro

	(esAccessible TRUE)
	(id "L1-Urgent")
	(nom "Urgent")
	(posX 2400)
	(posY 2000))

([MAIN::iaHabitatge_Class18] of  Metro

	(esAccessible TRUE)
	(id "L1-Barcinova")
	(nom "Barcinova")
	(posX 2800)
	(posY 2000))

([MAIN::iaHabitatge_Class19] of  Metro

	(esAccessible TRUE)
	(id "L1-ArcDeDerrota")
	(nom "ArcDeDerrota")
	(posX 3200)
	(posY 2000))

([MAIN::iaHabitatge_Class2] of  Pis

	(esAccessible TRUE)
	(estaMoblat TRUE)
	(estat bon-estat)
	(id "1")
	(m2 60)
	(numBanys 1)
	(numParking 0)
	(orientacio nord)
	(pis 9)
	(posX 100)
	(posY 300)
	(te
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teBalco TRUE)
	(teCalefaccio TRUE)
	(teCelobert TRUE)
	(teTerrassa FALSE)
	(teVistes FALSE)
	(tipusHabitatge pis))

([MAIN::iaHabitatge_Class20] of  Metro

	(esAccessible TRUE)
	(id "L1-Mariona")
	(nom "Mariona")
	(posX 3600)
	(posY 2000))

([MAIN::iaHabitatge_Class20018] of  Carrer

	(id "14")
	(nom "Chopin")
	(posX 0)
	(posY 150))

([MAIN::iaHabitatge_Class20020] of  Carrer

	(id "24")
	(nom "Tchaikovsky")
	(posX 0)
	(posY 3150))

([MAIN::iaHabitatge_Class20021] of  Carrer

	(id "12")
	(nom "Cirera")
	(posX 3450)
	(posY 0))

([MAIN::iaHabitatge_Class20024] of  Carrer

	(id "18")
	(nom "Mozart")
	(posX 0)
	(posY 1350))

([MAIN::iaHabitatge_Class20025] of  Carrer

	(id "6")
	(nom "Raim")
	(posX 1650)
	(posY 0))

([MAIN::iaHabitatge_Class20027] of  Carrer

	(id "8")
	(nom "Melo")
	(posX 2250)
	(posY 0))

([MAIN::iaHabitatge_Class20029] of  Oferta

	(data "21-02-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10133])
	(id "1")
	(preu 3000.0))

([MAIN::iaHabitatge_Class20030] of  Oferta

	(data "23-03-2008")
	(faReferenciaA [MAIN::iaHabitatge_Class10126])
	(id "2")
	(preu 1000.0))

([MAIN::iaHabitatge_Class20031] of  Oferta

	(data "05-06-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10127])
	(id "3")
	(preu 2500.0))

([MAIN::iaHabitatge_Class20032] of  Oferta

	(data "24-09-2007")
	(faReferenciaA [MAIN::iaHabitatge_Class10132])
	(id "4")
	(preu 5000.0))

([MAIN::iaHabitatge_Class20033] of  Oferta

	(data "08-08-2008")
	(faReferenciaA [MAIN::iaHabitatge_Class10131])
	(id "5")
	(preu 4000.0))

([MAIN::iaHabitatge_Class20034] of  Oferta

	(data "01-01-2010")
	(faReferenciaA [MAIN::iaHabitatge_Class10130])
	(id "6")
	(preu 2500.0))

([MAIN::iaHabitatge_Class20035] of  Oferta

	(data "02-01-2010")
	(faReferenciaA [MAIN::iaHabitatge_Class10094])
	(id "7")
	(preu 8500.0))

([MAIN::iaHabitatge_Class20036] of  Oferta

	(data "23-04-2007")
	(faReferenciaA [MAIN::iaHabitatge_Class10096])
	(id "8")
	(preu 3000.0))

([MAIN::iaHabitatge_Class20037] of  Oferta

	(data "15-04-2007")
	(faReferenciaA [MAIN::iaHabitatge_Class10095])
	(id "9")
	(preu 9000.0))

([MAIN::iaHabitatge_Class20038] of  Oferta

	(data "15-08-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10106])
	(id "10")
	(preu 8000.0))

([MAIN::iaHabitatge_Class20039] of  Oferta

	(data "21-06-2006")
	(faReferenciaA [MAIN::iaHabitatge_Class10107])
	(id "11")
	(preu 6300.0))

([MAIN::iaHabitatge_Class20040] of  Oferta

	(data "13-11-2008")
	(faReferenciaA [MAIN::iaHabitatge_Class10122])
	(id "12")
	(preu 2500.0))

([MAIN::iaHabitatge_Class20041] of  Oferta

	(data "09-09-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10123])
	(id "13")
	(preu 2999.0))

([MAIN::iaHabitatge_Class20042] of  Oferta

	(data "07-08-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10124])
	(id "14")
	(preu 3000.0))

([MAIN::iaHabitatge_Class20043] of  Oferta

	(data "16-12-2006")
	(faReferenciaA [MAIN::iaHabitatge_Class10125])
	(id "15")
	(preu 3200.0))

([MAIN::iaHabitatge_Class20044] of  Oferta

	(data "23-03-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class2])
	(id "16")
	(preu 800.0))

([MAIN::iaHabitatge_Class20045] of  Oferta

	(data "22-08-2007")
	(faReferenciaA [MAIN::iaHabitatge_Class10104])
	(id "17")
	(preu 900.0))

([MAIN::iaHabitatge_Class20047] of  Oferta

	(data "04-09-2008")
	(faReferenciaA [MAIN::iaHabitatge_Class10110])
	(id "19")
	(preu 525.0))

([MAIN::iaHabitatge_Class20048] of  Oferta

	(data "25-12-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10111])
	(id "20")
	(preu 500.0))

([MAIN::iaHabitatge_Class20049] of  Oferta

	(data "23-10-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10112])
	(id "21")
	(preu 1500.0))

([MAIN::iaHabitatge_Class20050] of  Oferta

	(data "04-07-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10113])
	(id "22")
	(preu 2500.0))

([MAIN::iaHabitatge_Class20051] of  Oferta

	(data "03-04-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10105])
	(id "18")
	(preu 2000.0))

([MAIN::iaHabitatge_Class20052] of  Oferta

	(data "21-09-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10114])
	(id "23")
	(preu 1900.0))

([MAIN::iaHabitatge_Class20053] of  Oferta

	(data "31-03-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10115])
	(id "24")
	(preu 790.0))

([MAIN::iaHabitatge_Class20054] of  Oferta

	(data "13-02-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10121])
	(id "25")
	(preu 820.0))

([MAIN::iaHabitatge_Class20055] of  Oferta

	(data "11-11-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10116])
	(id "26")
	(preu 1100.0))

([MAIN::iaHabitatge_Class20056] of  Oferta

	(data "21-05-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class3])
	(id "27")
	(preu 836.0))

([MAIN::iaHabitatge_Class20057] of  Oferta

	(data "23-08-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10117])
	(id "28")
	(preu 3000.0))

([MAIN::iaHabitatge_Class20058] of  Oferta

	(data "06-06-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10118])
	(id "29")
	(preu 2980.0))

([MAIN::iaHabitatge_Class20059] of  Oferta

	(data "23-07-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10119])
	(id "30")
	(preu 3200.0))

([MAIN::iaHabitatge_Class20060] of  Oferta

	(data "13-03-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10120])
	(id "31")
	(preu 810.0))

([MAIN::iaHabitatge_Class20061] of  Oferta

	(data "25-05-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10128])
	(id "32")
	(preu 780.0))

([MAIN::iaHabitatge_Class20062] of  Oferta

	(data "21-08-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10129])
	(id "33")
	(preu 560.0))

([MAIN::iaHabitatge_Class20063] of  Oferta

	(data "21-05-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10021])
	(id "34")
	(preu 2300.0))

([MAIN::iaHabitatge_Class20064] of  Oferta

	(data "24-07-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10098])
	(id "35")
	(preu 425.0))

([MAIN::iaHabitatge_Class20065] of  Oferta

	(data "03-12-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10099])
	(id "36")
	(preu 560.0))

([MAIN::iaHabitatge_Class20066] of  Oferta

	(data "26-09-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10100])
	(id "37")
	(preu 600.0))

([MAIN::iaHabitatge_Class20067] of  Oferta

	(data "09-10-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10101])
	(id "38")
	(preu 540.0))

([MAIN::iaHabitatge_Class20068] of  Oferta

	(data "06-12-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10102])
	(id "39")
	(preu 600.0))

([MAIN::iaHabitatge_Class20069] of  Oferta

	(data "13-05-2009")
	(faReferenciaA [MAIN::iaHabitatge_Class10103])
	(id "40")
	(preu 1525.0))

([MAIN::iaHabitatge_Class21] of  Bus

	(esAccessible TRUE)
	(id "70-Parada5")
	(nom "70-Parada5")
	(posX 3000)
	(posY 200))

([MAIN::iaHabitatge_Class3] of  Casa

	(esAccessible TRUE)
	(esPotMascotes TRUE)
	(estaMoblat TRUE)
	(estat bon-estat)
	(id "2")
	(m2 500)
	(numBanys 4)
	(numParking 3)
	(numPisos 3)
	(posX 300)
	(posY 2800)
	(te
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10019]
		[MAIN::iaHabitatge_Class10020]
		[MAIN::iaHabitatge_Class10018]
		[MAIN::iaHabitatge_Class10018])
	(teAireCondicionat TRUE)
	(teCalefaccio TRUE)
	(teJardi TRUE)
	(teTerrassa TRUE)
	(teVistes TRUE))

([MAIN::iaHabitatge_Class4] of  Metro

	(esAccessible TRUE)
	(id "L1-Rocafeble")
	(nom "Rocafeble")
	(posX 2000)
	(posY 2000))

([MAIN::iaHabitatge_Class5] of  CentreMedic

	(esAccessible TRUE)
	(id "1")
	(nom "Hospital Liquid")
	(posX 2000)
	(posY 1100))

([MAIN::iaHabitatge_Class6] of  Escola

	(esAccessible TRUE)
	(id "1")
	(nom "Escola Sant Albert")
	(posX 1900)
	(posY 3800))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;       REGLES       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;
;;; MODUL INICI
;;;
(defmodule MAIN (export ?ALL))

;;; TEMPLATES

;;; Template que emmagatzema el tipus de client
(deftemplate client
	(slot edat)
	(slot parella)
	(slot nombre-fills)
)

;;; Iniciem el sistema amb una categoria desconeguda
(deffacts tipus-client
	(client
		(edat desconegut)
		(parella desconegut)
		(nombre-fills desconegut)
	)
)

;;; Template que emmagatzema una recomanacio
(deftemplate recomanacio
	(slot id)
	(slot nivell)
	(multislot requeriments-no-satisfets)
	(multislot preferencies-satisfetes)
	(multislot sentit-comu-satisfet)
	(multislot serveis-prop)
	(multislot serveis-mig)
	(multislot serveis-lluny)
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
(deffunction si-o-no (?pregunta)
	(bind ?resposta (pregunta (str-cat ?pregunta "(si/no) ") si no))
	?resposta
)

;;; Fa una pregunta a la que s'ha de respondre "si", "no", "potser-si", "potser-no" O "indiferent"
(deffunction si-o-no++ (?pregunta)
	(bind ?resposta (pregunta (str-cat ?pregunta "(si/potser-si/indiferent/potser-no/no) ") si no potser-si potser-no indiferent))
	?resposta
)

;;; Pregunta si vol ser a prop ("si", "potser-si", "indiferent")
(deffunction ser-a-prop (?pregunta $?servei)
	(bind ?resposta (pregunta (str-cat ?pregunta "(si/potser-si/indiferent) ") si potser-si indiferent))
	(if (eq ?resposta si)
	then
		(progn$ (?s $?servei)
			(assert (requereixSerAProp ?s))
		)
	else
		(if (eq ?resposta potser-si)
		then 
			(progn$ (?s $?servei)
				(assert (prefereixSerAProp ?s))
			)
		)
	)
)

;;; Pregunta si vol ser lluny ("si", "potser-si", "indiferent")
(deffunction ser-lluny (?pregunta $?servei)
	(bind ?resposta (pregunta (str-cat ?pregunta "(si/potser-si/indiferent) ") si potser-si indiferent))
	(if (eq ?resposta si)
	then
		(progn$ (?s $?servei)
			(assert (requereixSerLluny ?s))
		)
	else
		(if (eq ?resposta potser-si)
		then 
			(progn$ (?s $?servei)
				(assert (prefereixSerLluny ?s))
			)
		)
	)
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
	
;;; Fa una pregunta a la qual se li ha de respondre un numero major que cota
(deffunction obte-nombre-cota (?question ?cota ?error)
	(printout t crlf ?question)
	(bind ?answer (read))
	(while (not (integerp ?answer))
		(printout t ?question)
		(bind ?answer (read))
	)
	(if (< ?answer ?cota)
	then
		(printout t ?error crlf)
		(bind ?answer (obte-nombre-cota ?question ?cota ?error))
	)
	?answer
)
	
;;; Fa una pregunta a la qual se li ha de respondre un numero en un rang
(deffunction obte-nombre-rang (?question ?rangini ?rangfi ?errorini ?errorfi)
	(printout t crlf ?question)
	(bind ?answer (read))
	(while (not (integerp ?answer))
		(printout t ?question)
		(bind ?answer (read))
	)
	(if (or (< ?answer ?rangini) (> ?answer ?rangfi)) then
		(if (< ?answer ?rangini)
		then
			(printout t ?errorini crlf)
		else
			(if (> ?answer ?rangfi)
			then
				(printout t ?errorfi crlf)
			)
		)
		(bind ?answer (obte-nombre-rang ?question ?rangini ?rangfi ?errorini ?errorfi))
	)
	?answer
)

;;; Calcula la distancia entre dues coordenades
(deffunction calcula-distancia (?posXa ?posXb ?posYa ?posYb)
	(bind ?result (sqrt (+ (** (- ?posXa ?posXb) 2) (** (- ?posYa ?posYb) 2))))
	(if (< ?result 500)
	then
		(bind ?dist prop)
	else
		(if (< ?result 1000)
		then
			(bind ?dist mig)
		else
			(bind ?dist lluny)
		)
	)
	?dist
)

;;; Retorna un index en funcio de l'alcada del pis
(deffunction calcula-index-alcada (?alcada)
	(if (eq (str-compare ?alcada baixa) 0)
	then
		(bind ?index 1)
	else
		(if (eq (str-compare ?alcada mitjana) 0)
		then
			(bind ?index 2)
		else
			(bind ?index 3)
		)
	)
	?index
)

;;; Retorna un index en funcio del numero del pis
(deffunction calcula-index-pis (?pis)
	(if (< ?pis 4)
	then
		(bind ?index 1)
	else
		(if (< ?pis 7)
		then
			(bind ?index 2)
		else
			(bind ?index 3)
		)
	)
	?index
)

;;; Obte una llista de serveis que estan prop/mig/lluny d'un cert punt
(deffunction obtenir-serveis (?posX ?posY ?pos)
	(bind $?serveis (create$))
	(do-for-all-instances
		((?servei Servei))
		(eq (str-compare (calcula-distancia ?posX ?servei:posX ?posY ?servei:posY) ?pos) 0)
		(bind $?serveis (insert$ $?serveis 1 (type ?servei)))
	)
	?serveis
)

;;; Retorna la interseccio de dos carrers (strings)
(deffunction interseccio (?carrer1 ?carrer2)
	(bind ?c1 (find-instance ((?carrer Carrer)) (eq (str-compare ?carrer:nom ?carrer1) 0)))
	(bind ?c1 (nth$ 1 ?c1))
	(bind ?c2 (find-instance ((?carrer Carrer)) (eq (str-compare ?carrer:nom ?carrer2) 0)))
	(bind ?c2 (nth$ 1 ?c2))
	(bind ?coord1 (+ (send ?c1 get-posX) (send ?c2 get-posX)))
	(bind ?coord2 (+ (send ?c1 get-posY) (send ?c2 get-posY)))
	(create$ ?coord1 ?coord2)
)

;;; Construeix la frase solucio
(deffunction construeix (?bool ?element)
	(switch ?bool
	   	(case TRUE then
	   		(bind ?frase (str-cat "Te " ?element))
	   	)
	   	(case FALSE then
	   		(bind ?frase (str-cat "No te " ?element))
	   	)
	)
	?frase
)

;;; Converteix les propietats en frases entenedores
(deffunction llenguatge-natural (?frase ?oferta)
	(switch ?frase
		(case obra-nova then (bind ?frase "Esta recentment construit o reformat"))
		(case bon-estat then (bind ?frase "Esta en bon estat"))
		(case zona-verda then (bind ?frase "Es a la vora d'una Zona Verda"))
		(case centric then (bind ?frase "Es centric"))
		(case ben-orientat then (bind ?frase "Esta orientat cap al Sud"))
		(case pati then
			(bind ?res (send (send ?oferta get-faReferenciaA) get-tePati))
			(bind ?frase (construeix ?res pati))
		)
		(case ascensor then
			(bind ?res (send (send ?oferta get-faReferenciaA) get-teAscensor))
			(bind ?frase (construeix ?res ascensor))
		)
		(case balco then
			(bind ?res (send (send ?oferta get-faReferenciaA) get-teBalco))
			(bind ?frase (construeix ?res balco))
		)
		(case jardi then
			(bind ?res (send (send ?oferta get-faReferenciaA) get-teJardi))
			(bind ?frase (construeix ?res jardi))
		)
		(case terrassa then
			(bind ?res (send (send ?oferta get-faReferenciaA) get-teTerrassa))
			(bind ?frase (construeix ?res terrassa))
		)
		(case celobert then
			(bind ?res (send (send ?oferta get-faReferenciaA) get-teCelobert))
			(bind ?frase (construeix ?res celobert))
		)
		(case aire-condicionat then
			(bind ?res (send (send ?oferta get-faReferenciaA) get-teAireCondicionat))
			(bind ?frase (construeix ?res aire-condicionat))
		)
		(case calefaccio then
			(bind ?res (send (send ?oferta get-faReferenciaA) get-teCalefaccio))
			(bind ?frase (construeix ?res calefaccio))
		)
		(case moblat then
			(bind ?res (send (send ?oferta get-faReferenciaA) get-estaMoblat))
			(bind ?frase (construeix ?res mobles))
		)
		(case duplex then
			(bind ?habitatge (send ?oferta get-faReferenciaA))
			(bind ?tipus (send ?habitatge get-tipusHabitatge))
			(switch ?tipus
				(case duplex then
					(bind ?frase "Es un duplex")
				)
				(case pis then
					(bind ?frase "No es un duplex")
				)
			)
		)
		(case numero-pisos then
			(bind ?res (send (send ?oferta get-faReferenciaA) get-numPisos))
			(bind ?frase (str-cat "Te " ?res " pisos"))
		)
		(case tipus-habitatge then
			(bind ?tipus (class (send ?oferta get-faReferenciaA)))
			(bind ?frase (str-cat "Es " ?tipus))
		)
		(case numero-banys then
			(bind ?numbanys (send (send ?oferta get-faReferenciaA) get-numBanys))
			(bind ?frase (str-cat "Te " ?numbanys " banys"))
		)
		(case metres2 then
			(bind ?m2 (send (send ?oferta get-faReferenciaA) get-m2))
			(bind ?frase (str-cat "Mesura " ?m2 " metres quadrats"))
		)
		(case numero-habitacions then
			(bind ?num-dorm (length$ (send (send ?oferta get-faReferenciaA) get-te)))
			(bind ?frase (str-cat "Te " ?num-dorm " habitacions"))
		)
		(case alcada-pis then
			(bind ?alcada-pis (send (send ?oferta get-faReferenciaA) get-pis))
			(bind ?frase (str-cat "Es a la planta numero " ?alcada-pis))
		)
		(case parquing then
			(bind ?alcada-pis (send (send ?oferta get-faReferenciaA) get-numParking))
			(bind ?frase (str-cat "Te " ?alcada-pis " aparcaments"))
		)
		(case feina then
			(bind ?frase "Es a prop de la teva feina o lloc d'estudi")
		)
		(case preu-mes then
			(bind ?frase "El preu de l'oferta es una mica superior al pressupost")
		)
		(case preu-menys then
			(bind ?frase "El preu de l'oferta es inferior al teu pressupost")
		)
		(default then
			(bind ?index (str-index "-" ?frase))
			(bind ?ingredient (sub-string (+ 1 ?index) (str-length (str-cat ?frase)) (str-cat ?frase)))
			(bind ?condicio (sub-string 0 (- ?index 1) (str-cat ?frase)))
			(bind ?frase (str-cat ?condicio "de" ?ingredient))
			(switch ?condicio
				(case "prefereixSerAProp" then
					(bind ?frase (str-cat "El servei " ?ingredient " queda a la vora"))
				)
				(case "requereixSerAProp" then
					(bind ?frase (str-cat "El servei " ?ingredient " queda lluny"))
				)
				(case "prefereixSerLluny" then
					(bind ?frase (str-cat "El servei " ?ingredient " queda a la vora"))
				)
				(case "requereixSerLluny" then
					(bind ?frase (str-cat "El servei " ?ingredient " queda lluny"))
				)
				(default then
					(bind ?frase (str-cat "El servei " ?condicio  " te un problema"))
				)
			)
		)
	)
	?frase
)

;;; Recorre la llista de caracteristiques i les imprimeix traduides
(deffunction escriu-ingredients (?llista ?oferta)
	(bind ?i 1) 
	(while (<= ?i (length$ $?llista))
		do 
			(bind ?ingredient (nth$ ?i $?llista)) 
			(printout t "| |   > " (llenguatge-natural ?ingredient ?oferta) crlf)
			(bind ?i (+ ?i 1)) 
	)
)

;;;Escriu el titol de la oferta amb les seves caracteristiques basiques 
(deffunction escriu-titol-oferta (?oferta)
	(printout t "| +-+----------------------" crlf)
	(printout t "| | | Oferta " (send ?oferta get-id) ", " (send ?oferta get-data) crlf)
	(printout t "| | |    " (class (send ?oferta get-faReferenciaA)) " " (send (send ?oferta get-faReferenciaA) get-id) crlf)
	(printout t "| | |    " (send (send ?oferta get-faReferenciaA) get-m2) " m2" crlf)
	(printout t "| | |    " (send ?oferta get-preu) " euros" crlf)
	(printout t "| | +----------------------" crlf)
)

;;; Actualitza les satisfaccions d'una recomanacio
(deffunction actualitza-satisfaccions (?oferta ?recomanacio ?funcio ?valor-usuari ?valor-satisfet ?rns ?ps ?scs)
	(if (eval ?funcio)
	then (bind ?valor-ontologia si)
	else (bind ?valor-ontologia no)
	)
	(if (or (eq (str-compare ?valor-ontologia si) (str-compare ?valor-usuari no) 0) (eq (str-compare ?valor-ontologia no) (str-compare ?valor-usuari si) 0))
	then
		(modify ?recomanacio (requeriments-no-satisfets (insert$ $?rns 1 ?valor-satisfet)))
	else
		(if (eq (str-compare (str-cat potser- ?valor-ontologia) ?valor-usuari) 0)
		then
			(modify ?recomanacio (preferencies-satisfetes (insert$ $?ps 1 ?valor-satisfet)))
		else
			(if (eq (str-compare ?valor-ontologia si) (str-compare ?valor-usuari indiferent) 0)
			then
				(modify ?recomanacio (sentit-comu-satisfet (insert$ $?scs 1 ?valor-satisfet)))
			)
		)
	)
)

;;; REGLES

(defrule presentacio "Regla inicial de presentacio"
	(declare (salience 20))
	=>
	(printout t crlf)
	(printout t "+------------------------------------------------+" crlf)
	(printout t "|                                                |" crlf)
	(printout t "|   L L O G U E R S    D ' H A B I T A T G E S   |" crlf)
	(printout t "|                                                |" crlf)
	(printout t "+------------------------------------------------+" crlf)
	(focus preguntes-determinar-client)
)

;;;
;;; MODUL DE PREGUNTES PER CATEGORITZAR L'USUARI
;;;
;;;		* edat
;;;		* estat civil
;;;		* nombre fills
;;;
(defmodule preguntes-determinar-client "Modul de preguntes tipus de client"
	(import MAIN ?ALL)
	(export ?ALL)
)

;;; Comprovem l'edat del client
(defrule determinar-edat
	?c <- (client (edat desconegut))
	=>
	(bind ?edat (obte-nombre-rang "Quina edat tens? " 18 100 "Ets massa jovenet per llogar un pis!" "Voste sobrepassa l'edat permesa per llogar un pis."))
	(if (< ?edat 30)
	then
		(modify ?c (edat jove))
	else
		(if (< ?edat 60)
		then
			(modify ?c (edat adult))
		else
			(modify ?c (edat tercera-edat))
		)
	)
)

;;; Ens informem de si hi vol anar en parella
(defrule parella
	?c <- (client (parella desconegut))
	=>
	(modify ?c (parella (si-o-no "Vols anar-hi en parella? ")))
)

;;; Ens informem de si te fills petits
(defrule te-fills
	?c <- (client (edat jove | adult) (nombre-fills desconegut))
	=>
	(modify ?c (nombre-fills (obte-nombre-cota "Quants fills menors de 18 anys tens? " 0 "Nombre de fills incorrecte!")))
)

;;; Ens informem de si estudia o treballa
(defrule activitat
	=>
	(assert (activitat (pregunta "Estudies o treballes? (estudio/treballo/res) " estudio treballo res)))
)

(defrule lloc
	(activitat estudio | treballo)
	=>
	(bind ?carrers "")
	(printout t "Carrers de la ciutat:" crlf)
	(do-for-all-instances
		((?carrer Carrer))
		TRUE
		(printout t "| " ?carrer:nom crlf)
		(bind ?carrers (str-cat ?carrers " " ?carrer:nom))
	)
	(bind ?resposta (pregunta "On? (<carrer1>) " (explode$ ?carrers)))
	(assert (carrer1 ?resposta))
	(bind ?c1 (find-instance ((?inst Carrer)) (eq (str-compare ?inst:nom ?resposta) 0)))
	(bind ?c1 (nth$ 1 ?c1))
	(bind ?carrers "")
	(printout t "Carrers que fan cantonada amb " ?resposta ":" crlf)
	(do-for-all-instances
		((?c2 Carrer))
		(or
			(eq (send ?c1 get-posX) ?c2:posY 0)
			(eq (send ?c1 get-posY) ?c2:posX 0)
		)
		(printout t "| " ?c2:nom crlf)
		(bind ?carrers (str-cat ?carrers " " ?c2:nom))
	)
	(assert (carrer2 (pregunta "cantonada amb: (<carrer2>) " (explode$ ?carrers))))
)

;;; Ens informem de si necessita accessibilitat
(defrule necessita-accessibilitat
	=>
	(assert (accessibilitat (si-o-no "Necessites mesures d'accessibilitat? ")))
)

;;; Saltem al modul de les preguntes comunes
(defrule a-preguntes-comunes
	(declare (salience -1))
	=>
	(focus preguntes-comunes)
)

;;;
;;; MODUL DE PREGUNTES COMUNES
;;;
(defmodule preguntes-comunes "Modul de preguntes comunes a tots els clients"
	(import preguntes-determinar-client ?ALL)
	(export ?ALL)
)

(defrule preu-maxim
	=>
	(assert (pressupost (obte-nombre-cota "Quin es el maxim que et vols gastar? " 0 "Preu negatiu!")))
)

(defrule preu-maxim++
	=>
	(assert (pressupost++ (si-o-no "Estaries disposat a pagar mes si l'oferta s'ho val? ")))
)

(defrule tipus-habitatge
	=>
	(assert (tipus-habitatge (pregunta "Quin tipus d'habitatge busques? (casa/pis/indiferent) " casa pis indiferent)))
)

(defrule metres2
	=>
	(assert (metres2 (obte-nombre-cota "Quants metres quadrats ha de tenir com a minim? " 0 "Mesura negativa!")))
)

(defrule mascotes
	=>
	(assert (mascotes (si-o-no "Tens mascotes? ")))
)

(defrule parquing
	=>
	(assert (parquing (si-o-no++ "Vols parquing? ")))
)

(defrule moblat
	=>
	(assert (moblat (si-o-no++ "Vols que estigui moblat? ")))
)

(defrule numero-habitacions
	=>
	(assert (numero-habitacions (obte-nombre-cota "Quantes habitacions ha de tenir com a minim? " 0 "Mesura negativa!")))
)

(defrule numero-banys
	=>
	(assert (numero-banys (obte-nombre-cota "Quants banys ha de tenir com a minim? " 0 "Mesura negativa!")))
)

(defrule calefaccio
	=>
	(assert (calefaccio (si-o-no++ "Vols calefaccio? ")))
)

(defrule aire-condicionat
	=>
	(assert (aire-condicionat (si-o-no++ "Vols aire condicionat? ")))
)

(defrule celobert
	=>
	(assert (celobert (si-o-no++ "Vols que tingui celobert? ")))
)

(defrule jardi
	=>
	(assert (jardi (si-o-no++ "Vols jardi? ")))
)

(defrule pati
	=>
	(assert (pati (si-o-no++ "Vols pati? ")))
)

(defrule terrassa
	=>
	(assert (terrassa (si-o-no++ "Vols terrassa? ")))
)

(defrule transport-public
	=>
	(ser-a-prop "Vols transport public a la vora? " Bus Metro)
)

(defrule supermercat
	=>
	(ser-a-prop "Necessites un supermercat al costat? " Supermercat)
)

;;; Saltem al modul de les preguntes especifiques
(defrule a-preguntes-especifiques
	(declare (salience -1))
	=>
	(focus preguntes-especifiques)
)

;;;
;;; MODUL DE PREGUNTES ESPECIFIQUES
;;;
(defmodule preguntes-especifiques "Modul de preguntes especifiques"
	(import preguntes-comunes ?ALL)
	(export ?ALL)
)

(defrule duplex
	(client (edat jove | adult))
	(tipus-habitatge pis | indiferent)
	(accessibilitat no)
	=>
	(assert (duplex (si-o-no++ "Vols que el pis sigui duplex? ")))
)

(defrule ascensor
	(client (edat jove | adult))
	(tipus-habitatge pis | indiferent)
	(accessibilitat no)
	=>
	(assert (ascensor (si-o-no++ "Vols ascensor al pis? ")))
)

(defrule alcada-pis
	(tipus-habitatge pis | indiferent)
	=>
	(assert (alcada-pis (pregunta "A quina alcada vols que estigui el pis? (baixa/mitjana/alta/indiferent) " baixa mitjana alta indiferent)))
)

(defrule balco
	(tipus-habitatge pis | indiferent)
	=>
	(assert (balco (si-o-no++ "Vols balco al pis? ")))
)

(defrule numero-pisos
	(tipus-habitatge casa | indiferent)
	=>
	(assert (numero-pisos (obte-nombre-cota "Quants pisos vols a la casa? " 0 "Quantitat negativa!")))
)

(defrule centre-medic
	(not (client (edat tercera-edat)))
	(accessibilitat no)
	=>
	(ser-a-prop "Vols tenir un centre medic al costat? " CentreMedic)
)

(defrule universitat
	(client (nombre-fills 0))
	=>
	(ser-a-prop "Vols una universitat a la vora? " Universitat)
)

(defrule zones-sorolloses
	(not (client (edat tercera-edat)))
	=>
	(ser-lluny "Vols estar apartat de les zones sorolloses? " Discoteca Bar Cinema Teatre)
)

;;; Saltem al modul de les assignacions incondicionals
(defrule a-assignacions-incondicionals
	(declare (salience -1))
	=>
	(focus assignacions-incondicionals)
)

;;;
;;; MODUL D'ASSIGNACIONS INCONDICIONALS
;;;
(defmodule assignacions-incondicionals "Modul d'assignacions incondicionals"
	(import preguntes-especifiques ?ALL)
	(export ?ALL)
)

(defrule centre-medic-accessibilitat
	(accessibilitat si)
	=>
	(assert (prefereixSerAProp CentreMedic))
)

(defrule tercera-edat
	(client (edat tercera-edat))
	=>
	(assert
		(ascensor si)
		(duplex no)
		(prefereixSerAProp CentreMedic)
		(prefereixSerLluny Discoteca)
		(prefereixSerLluny Bar)
		(prefereixSerLluny Cinema)
		(prefereixSerLluny Teatre)
		(prefereixSerLluny Universitat)
		(prefereixSerLluny Escola)
	)
)

(defrule amb-fills
	(client (nombre-fills ~0))
	=>
	(assert
		(prefereixSerAProp Escola)
		(prefereixSerAProp ZonaVerda)
	)
)

(defrule biblioteques
	(activitat estudio)
	=>
	(assert (prefereixSerAProp Biblioteca))
)

(defrule zona-oci
	(client (edat jove))
	(not (prefereixSerLluny Discoteca))
	(not (prefereixSerLluny Bar))
	(not (prefereixSerLluny Cinema))
	(not (prefereixSerLluny Teatre))
	(not (requereixSerLluny Discoteca))
	(not (requereixSerLluny Bar))
	(not (requereixSerLluny Cinema))
	(not (requereixSerLluny Teatre))
	=>
	(assert
		(prefereixSerAProp Discoteca)
		(prefereixSerAProp Bar)
		(prefereixSerAProp Cinema)
		(prefereixSerAProp Teatre)
	)
)

(defrule mascotes
	=>
	(assert
		(pati potser-si)
		(terrassa potser-si)
		(jardi potser-si)
	)
)

(defrule fi-informacio
	(declare (salience -1))
	=>
	(printout t crlf crlf "Moltes gracies per les teves respostes!" crlf)
	(printout t "Estem buscant les millors ofertes per tu..." crlf)
	(focus esborrar-ofertes)
)

;;;
;;; MODUL ESBORRAR OFERTES
;;;
;;; Descarta les ofertes que no compleixen els requisits minims
(defmodule esborrar-ofertes
	(import assignacions-incondicionals ?ALL)
	(export ?ALL)
)

(defrule esborrar-inaccessibles
	(accessibilitat si)
	?oferta <- (object (is-a Oferta))
	=>
	(bind ?habitatge (send ?oferta get-faReferenciaA))
	(if (not (send ?habitatge get-esAccessible))
	then
		(send ?oferta delete)
	)
)

(defrule esborrar-no-mascotes
	(mascotes si)
	?oferta <- (object (is-a Oferta))
	=>
	(bind ?habitatge (send ?oferta get-faReferenciaA))
	(if (not (send ?habitatge get-esPotMascotes))
	then
		(send ?oferta delete)
	)
)


(defrule esborrar-casa-o-pis
	(not (tipus-habitatge indiferent))
	(tipus-habitatge ?valor)
	?oferta <- (object (is-a Oferta) (faReferenciaA ?habitatge))
	(test (neq (str-compare (upcase ?valor) (upcase (class ?habitatge))) 0))
	=>
	(send ?oferta delete)
	
)
	

(defrule a-associacio-heuristica
	(declare (salience -1))
	=>
	(focus associacio-heuristica)
)

;;;
;;; MODUL QUE FA L'ASSOCIACIO HEURISTICA
;;;
(defmodule associacio-heuristica
	(import esborrar-ofertes ?ALL)
	(export ?ALL)
)

;;; Inicialitzacio de les satisfaccions
(defrule inicialitzacio-satisfaccions
	?oferta <- (object (is-a Oferta))
	=>
	(bind ?habitatge (send ?oferta get-faReferenciaA))
	(assert
		(recomanacio
			(id (send ?oferta get-id))
			(nivell indefinit)
			(serveis-prop (obtenir-serveis (send ?habitatge get-posX) (send ?habitatge get-posY) prop))
			(serveis-mig (obtenir-serveis (send ?habitatge get-posX) (send ?habitatge get-posY) mig))
			(serveis-lluny (obtenir-serveis (send ?habitatge get-posX) (send ?habitatge get-posY) lluny))
		)
	)
)

(defrule satisfaccio-tipus-habitatge
	(not (tipus-habitatge indiferent))
	(tipus-habitatge ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(test (neq (str-compare (upcase ?valor) (upcase (class ?habitatge))) 0))
	(not (visitat satisfaccio-tipus-habitatge ?id))
	=>
	(assert (visitat satisfaccio-tipus-habitatge ?id))
	(modify ?recomanacio (requeriments-no-satisfets (insert$ $?rns 1 tipus-habitatge)))
)

(defrule satisfaccio-metres2
	(metres2 ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-metres2 ?id))
	=>
	(assert (visitat satisfaccio-metres2 ?id))
	(if (> ?valor (send ?habitatge get-m2))
	then
		(modify ?recomanacio (requeriments-no-satisfets (insert$ $?rns 1 metres2)))
	else
		(if (< ?valor (send ?habitatge get-m2))
		then
			(modify ?recomanacio (sentit-comu-satisfet (insert$ $?scs 1 metres2)))
		)
	)
)

(defrule satisfaccio-numero-banys
	(numero-banys ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-numero-banys ?id))
	=>
	(assert (visitat satisfaccio-numero-banys ?id))
	(if (> ?valor (send ?habitatge get-numBanys))
	then
		(modify ?recomanacio (requeriments-no-satisfets (insert$ $?rns 1 numero-banys)))
	else
		(if (< ?valor (send ?habitatge get-numBanys))
		then
			(modify ?recomanacio (sentit-comu-satisfet (insert$ $?scs 1 numero-banys)))
		)
	)
)

(defrule satisfaccio-numero-habitacions
	(numero-habitacions ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-numero-habitacions ?id))
	=>
	(assert (visitat satisfaccio-numero-habitacions ?id))
	(if (> ?valor (length$ (send ?habitatge get-te)))
	then
		(modify ?recomanacio (requeriments-no-satisfets (insert$ $?rns 1 numero-habitacions)))
	else
		(if (< ?valor (length$ (send ?habitatge get-te)))
		then
			(modify ?recomanacio (sentit-comu-satisfet (insert$ $?scs 1 numero-habitacions)))
		)
	)
)

(defrule satisfaccio-parquing
	(parquing ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-parquing ?id))
	=>
	(assert (visitat satisfaccio-parquing ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (> (send ?habitatge get-numParking) 0) ?valor parquing $?rns $?ps $?scs)
)

(defrule satisfaccio-moblat
	(moblat ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-moblat ?id))
	=>
	(assert (visitat satisfaccio-moblat ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (send ?habitatge get-estaMoblat) ?valor moblat $?rns $?ps $?scs)
)

(defrule satisfaccio-calefaccio
	(calefaccio ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-calefaccio ?id))
	=>
	(assert (visitat satisfaccio-calefaccio ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (send ?habitatge get-teCalefaccio) ?valor calefaccio $?rns $?ps $?scs)
)

(defrule satisfaccio-aire-condicionat
	(aire-condicionat ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-aire-condicionat ?id))
	=>
	(assert (visitat satisfaccio-aire-condicionat ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (send ?habitatge get-teAireCondicionat) ?valor aire-condicionat $?rns $?ps $?scs)
)

(defrule satisfaccio-celobert
	(celobert ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-celobert ?id))
	=>
	(assert (visitat satisfaccio-celobert ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (send ?habitatge get-teCelobert) ?valor celobert $?rns $?ps $?scs)
)

(defrule satisfaccio-jardi
	(jardi ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-jardi ?id))
	=>
	(assert (visitat satisfaccio-jardi ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (send ?habitatge get-teJardi) ?valor jardi $?rns $?ps $?scs)
)

(defrule satisfaccio-pati
	(pati ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-pati ?id))
	=>
	(assert (visitat satisfaccio-pati ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (send ?habitatge get-tePati) ?valor pati $?rns $?ps $?scs)
)

(defrule satisfaccio-terrassa
	(terrassa ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-terrassa ?id))
	=>
	(assert (visitat satisfaccio-terrassa ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (send ?habitatge get-teTerrassa) ?valor terrassa $?rns $?ps $?scs)
)

(defrule satisfaccio-balco
	(balco ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(test (eq (str-compare (upcase pis) (upcase (class ?habitatge))) 0))
	(not (visitat satisfaccio-balco ?id))
	=>
	(assert (visitat satisfaccio-balco ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (send ?habitatge get-teBalco) ?valor balco $?rns $?ps $?scs)
)

(defrule satisfaccio-ascensor
	(ascensor ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(test (eq (str-compare (upcase pis) (upcase (class ?habitatge))) 0))
	(not (visitat satisfaccio-ascensor ?id))
	=>
	(assert (visitat satisfaccio-ascensor ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (send ?habitatge get-teAscensor) ?valor ascensor $?rns $?ps $?scs)
)

(defrule satisfaccio-alcada-pis
	(not (alcada-pis indiferent))
	(alcada-pis ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(test (eq (str-compare (upcase pis) (upcase (class ?habitatge))) 0))
	(not (visitat satisfaccio-alcada-pis ?id))
	=>
	(assert (visitat satisfaccio-alcada-pis ?id))
	(bind ?client (calcula-index-alcada ?valor))
	(bind ?pis (calcula-index-pis (send ?habitatge get-pis)))
	(if (eq (abs (- ?client ?pis)) 2)
	then
		(send ?oferta delete)
	else
		(if (eq (abs (- ?client ?pis)) 1)
		then
			(modify ?recomanacio (requeriments-no-satisfets (insert$ $?rns 1 alcada-pis)))
		)
	)
)

(defrule satisfaccio-numero-pisos
	(numero-pisos ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(test (eq (str-compare (upcase casa) (upcase (class ?habitatge))) 0))
	(not (visitat satisfaccio-numero-pisos ?id))
	=>
	(assert (visitat satisfaccio-numero-pisos ?id))
	(bind ?pisos (send ?habitatge get-numPisos))
	(if (> (abs (- ?valor ?pisos)) 1)
	then
		(send ?oferta delete)
	else
		(if (eq (abs (- ?valor ?pisos)) 1)
		then
			(modify ?recomanacio (requeriments-no-satisfets (insert$ $?rns 1 numero-pisos)))
		)
	)
)

(defrule satisfaccio-duplex
	(duplex ?valor)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(test (eq (str-compare (upcase pis) (upcase (class ?habitatge))) 0))
	(not (visitat satisfaccio-duplex ?id))
	=>
	(assert (visitat satisfaccio-duplex ?id))
	(actualitza-satisfaccions ?oferta ?recomanacio (eq (str-compare (send ?habitatge get-tipusHabitatge) duplex) 0) ?valor duplex $?rns $?ps $?scs)
)

(defrule satisfaccio-preu
	(pressupost ?pressupost)
	(pressupost++ ?disposat-a-pagar-mes)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id))
	(not (visitat satisfaccio-preu ?id))
	=>
	(assert (visitat satisfaccio-preu ?id))
	(if (> (send ?oferta get-preu) ?pressupost)
	then
		(if  (eq (str-compare si ?disposat-a-pagar-mes) 0)
		then
			(modify ?recomanacio (requeriments-no-satisfets (insert$ $?rns 1 preu-mes)))
		else
			(send ?oferta delete)
		)
	else
		(if (> (* ?pressupost 0.5) (send ?oferta get-preu))
		then
			(modify ?recomanacio (sentit-comu-satisfet (insert$ $?scs 1 preu-menys)))
		)
	)
)

(defrule satisfaccio-requereix-ser-a-prop
	(requereixSerAProp ?lloc)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-requereix-ser-a-prop ?id ?lloc))
	=>
	(assert (visitat satisfaccio-requereix-ser-a-prop ?id ?lloc))
	(if (not (member ?lloc (obtenir-serveis (send ?habitatge get-posX) (send ?habitatge get-posY) prop)))
	then
		(if (member ?lloc (obtenir-serveis (send ?habitatge get-posX) (send ?habitatge get-posY) mig))
		then
			(modify ?recomanacio (requeriments-no-satisfets (insert$ $?rns 1 (str-cat requereixSerAProp- ?lloc))))
		else
			(send ?oferta delete)
		)
	)
)

(defrule satisfaccio-prefereix-ser-a-prop
	(prefereixSerAProp ?lloc)
	?recomanacio <- (recomanacio (id ?id) (preferencies-satisfetes $?ps))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-prefereix-ser-a-prop ?id ?lloc))
	=>
	(assert (visitat satisfaccio-prefereix-ser-a-prop ?id ?lloc))
	(if (member ?lloc (obtenir-serveis (send ?habitatge get-posX) (send ?habitatge get-posY) prop))
	then
		(modify ?recomanacio (preferencies-satisfetes (insert$ $?ps 1 (str-cat prefereixSerAProp- ?lloc))))
	)
)

(defrule satisfaccio-requereix-ser-lluny
	(requereixSerLluny ?lloc)
	?recomanacio <- (recomanacio (id ?id) (requeriments-no-satisfets $?rns))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-requereix-ser-lluny ?id ?lloc))
	=>
	(assert (visitat satisfaccio-requereix-ser-lluny ?id ?lloc))
	(if (not (member ?lloc (obtenir-serveis (send ?habitatge get-posX) (send ?habitatge get-posY) lluny)))
	then
		(if (member ?lloc (obtenir-serveis (send ?habitatge get-posX) (send ?habitatge get-posY) mig))
		then
			(modify ?recomanacio (requeriments-no-satisfets (insert$ $?rns 1 (str-cat requereixSerLluny- ?lloc))))
		else
			(send ?oferta delete)
		)
	)
)

(defrule satisfaccio-prefereix-ser-lluny
	(prefereixSerLluny ?lloc)
	?recomanacio <- (recomanacio (id ?id) (preferencies-satisfetes $?ps))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(not (visitat satisfaccio-prefereix-ser-lluny ?id ?lloc))
	=>
	(assert (visitat satisfaccio-prefereix-ser-lluny ?id ?lloc))
	(if (member ?lloc (obtenir-serveis (send ?habitatge get-posX) (send ?habitatge get-posY) lluny))
	then
		(modify ?recomanacio (preferencies-satisfetes (insert$ $?ps 1 (str-cat prefereixSerLluny- ?lloc))))
	)
)

(defrule satisfaccio-zona-verda
	?recomanacio <- (recomanacio (id ?id) (sentit-comu-satisfet $?scs))
	?zona-verda <- (object (is-a ZonaVerda) (id ?idVerda))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(test (neq 0 (str-compare
		"lluny"
		(calcula-distancia (send ?habitatge get-posX) (send ?zona-verda get-posX) (send ?habitatge get-posY) (send ?zona-verda get-posY))
	)))
	(not (visitat satisfaccio-zona-verda ?id ?idVerda))
	=>
	(assert (visitat satisfaccio-zona-verda ?id ?idVerda))
	(if (not (member zona-verda $?scs))
	then
		(modify ?recomanacio (sentit-comu-satisfet (insert$ $?scs 1 zona-verda)))
	)
)

(defrule satisfaccio-centric
	?recomanacio <- (recomanacio (id ?id) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(test (neq 0 (str-compare
		"lluny"
		(calcula-distancia (send ?habitatge get-posX) 2000 (send ?habitatge get-posY) 2000)
	)))
	(not (visitat satisfaccio-centric ?id))
	=>
	(assert (visitat satisfaccio-centric ?id))
	(modify ?recomanacio (sentit-comu-satisfet (insert$ $?scs 1 centric)))
)

(defrule satisfaccio-orientacio
	?recomanacio <- (recomanacio (id ?id) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(test (eq (str-compare "PIS" (upcase (class ?habitatge))) 0))
	(test (eq (str-compare "SUD" (upcase (send ?habitatge get-orientacio)))0))
	(not (visitat satisfaccio-orientacio ?id))
	=>
	(modify ?recomanacio (sentit-comu-satisfet (insert$ $?scs 1 ben-orientat)))
	(assert (visitat satisfaccio-orientacio ?id))
)

(defrule satisfaccio-estat
	?recomanacio <- (recomanacio (id ?id) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(test (neq (str-compare "per-reformar" (send ?habitatge get-estat)) 0))
	(not (visitat satisfaccio-estat ?id))
	=>
	(assert (visitat satisfaccio-estat ?id))
	(modify ?recomanacio (sentit-comu-satisfet (insert$ $?scs 1 (send ?habitatge get-estat))))
)

(defrule satisfaccio-feina
	?recomanacio <- (recomanacio (id ?id) (sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (faReferenciaA ?habitatge))
	(carrer1 ?carrer1)
	(carrer2 ?carrer2)
	(test (eq 0 (str-compare
		"prop"
		(calcula-distancia (send ?habitatge get-posX) (nth$ 1 (interseccio ?carrer1 ?carrer2)) (send ?habitatge get-posY) (nth$ 2 (interseccio ?carrer1 ?carrer2)))
	)))
	(not (visitat satisfaccio-feina ?id))
	=>
	(assert (visitat satisfaccio-feina ?id))
	(modify ?recomanacio (sentit-comu-satisfet (insert$ $?scs 1 feina)))
	(bind ?dist (calcula-distancia (send ?habitatge get-posX) (nth$ 1 (interseccio ?carrer1 ?carrer2)) (send ?habitatge get-posY) (nth$ 2 (interseccio ?carrer1 ?carrer2))))
)

(defrule a-refinament
	(declare (salience -1))
	=>
	(focus refinament)
)

;;;
;;;MODUL DE REFINAMENT
;;;
(defmodule refinament
	(import associacio-heuristica ?ALL)
	(export ?ALL)
)

(defrule adequat-de-moment
	?recom <- (recomanacio (id ?idOferta) (requeriments-no-satisfets $?rns) (nivell indefinit))
	(test (= 0 (length$ $?rns)))
	=>	
	(modify ?recom (nivell adequat-de-moment))
	(retract ?recom)
)

(defrule parcialment-adequat
	?recom <- (recomanacio (requeriments-no-satisfets $?rns) (nivell indefinit))
	(test(> 3 (length$ $?rns)))
	=>
	(modify ?recom (nivell parcialment-adequat))
	(retract ?recom)
)

(defrule molt-recomanable-o-adequat
   ?recom <- (recomanacio (preferencies-satisfetes $?ps) (sentit-comu-satisfet $?scs) (nivell adequat-de-moment))
   =>
   (if (or (> (length$ $?ps) 0) (> (length$ $?scs) 0))
   then
		(modify ?recom (nivell molt-recomanable))
   else
		(modify ?recom (nivell adequat))
   )
   (retract ?recom)
)

(defrule a-mostrar-solucions
	(declare (salience -1))
	=>
	(focus solucions)
)

;;;
;;;MODUL DE MOSTRA DE SOLUCIONS
;;;
(defmodule solucions
	(import refinament ?ALL)
	(export ?ALL)
)

(defrule titolSolucions
	(declare (salience 10))
	=>
	(printout t crlf)
	(printout t "+------------------------------------------------+" crlf)
	(printout t "|                                                |" crlf)
	(printout t "|     O F E R T E S    R E C O M A N A D E S     |" crlf)
	(printout t "|                                                |" crlf)
	(printout t "+------------------------------------------------+" crlf)
)

(defrule titol-adequades
	(declare (salience 6))
	=>
	(printout t "+------------------------------------------------+" crlf crlf)
	(printout t "                                     +-----------+" crlf)
	(printout t "                                     | ADEQUADES |" crlf)
	(printout t "+------------------------------------+-----------+" crlf)
	(printout t "|" crlf)
)

(defrule titol-parcialment-adequades
	(declare (salience 4))
	=>
	(printout t "+------------------------------------------------+" crlf crlf)
	(printout t "                         +-----------------------+" crlf)
	(printout t "                         | PARCIALMENT ADEQUADES |" crlf)
	(printout t "+------------------------+-----------------------+" crlf)
	(printout t "|" crlf)
)

(defrule titol-molt-recomanables
	(declare (salience 8))
	=>
	(printout t crlf crlf)
	(printout t "                             +-------------------+" crlf)
	(printout t "                             | MOLT RECOMANABLES |" crlf)
	(printout t "+----------------------------+-------------------+" crlf)
	(printout t "|" crlf)

)

(defrule escriu-adequades
	(declare (salience 5))
	?recom <- (recomanacio (id ?id) (nivell adequat))
	?oferta <- (object (is-a Oferta) (id ?id) (data ?data))
	=>
	(escriu-titol-oferta ?oferta)
)

(defrule escriu-parcialment-adequades
	(declare (salience 3))
	?recom <- (recomanacio (id ?id) (nivell parcialment-adequat)(requeriments-no-satisfets $?rns))
	?oferta <- (object (is-a Oferta) (id ?id) (data ?data))
	=>
	(escriu-titol-oferta ?oferta)
	(printout t "| |" crlf)
	(printout t "| | No compleixen els seguents requeriments:" crlf)
	(escriu-ingredients $?rns ?oferta)
	(printout t "| |" crlf)	
	(printout t "| +------------------------" crlf)
	(printout t "|" crlf)	
)

(defrule escriu-molt-recomanables
	(declare (salience 7))
	?recom <- (recomanacio (id ?id) (nivell molt-recomanable)(preferencies-satisfetes $?ps)(sentit-comu-satisfet $?scs))
	?oferta <- (object (is-a Oferta) (id ?id) (data ?data))
	=>
	(escriu-titol-oferta ?oferta)
	(if (< 0 (length$ $?ps))
	then
		(printout t "| |" crlf)
		(printout t "| | Es compleixen les teves preferencies seguents:" crlf)
		(escriu-ingredients $?ps ?oferta)
	)
	(if (< 0 (length$ $?scs))
	then
		(printout t "| |" crlf)
		(printout t "| | Et pot agradar que:" crlf)
		(escriu-ingredients $?scs ?oferta)
	)
	(printout t "| |" crlf)	
	(printout t "| +------------------------" crlf)
	(printout t "|" crlf)	
)

(defrule final
	(declare (salience -1))
	=>
	(printout t "+------------------------------------------------+" crlf crlf)
)
