(defrule SON-Share
	?SON <- (SON (alive yes) (block no) (share none))
=>
	(modify ?SON(share R)))


(defrule GRS-Share
	?GRS <- (GRS (alive yes) (block no) (share none))
=>
	(modify ?GRS(share R)))


(defrule FBR-Share
	?FBR <- (FBR (alive yes) (block no) (share none))
=>
	(modify ?FBR(share R)))


(defrule PBR-Share
	?PBR <- (PBR (alive yes) (block no) (share none))
=>
	(modify ?PBR(share R)))


(defrule SFB-Share
	?SFB <- (SFB (alive yes) (block no) (share none))
=>
	(modify ?SFB(share R)))


(defrule SPB-Share
	?SPB <- (SPB (alive yes) (block no) (share none))
=>
	(modify ?SPB(share R)))


(defrule FUN-Share
	?FUN <- (FUN (alive yes) (block no) (share none))
=>
	(modify ?FUN(share R)))


(defrule PUN-Share
	?PUN <- (PUN (alive yes) (block no) (share none))
=>
	(modify ?PUN(share R)))


(defrule SFU-Share
	?SFU <- (SFU (alive yes) (block no) (share none))
=>
	(modify ?SFU(share R)))


(defrule SPU-Share
	?SPU <- (SPU (alive yes) (block no) (share none))
=>
	(modify ?SPU(share R)))


(defrule FTR-Share-1
	(or (SON (alive yes))
		(GRS (alive yes)))
	?FTR <- (FTR (alive yes) (block no) (share none))
=>
	(modify ?FTR(share 1/6)))


(defrule FTR-Share-2
	(SON (alive no))
	(GRS (alive no))
	(or (DAU (alive yes))
		(SDU (alive yes)))
	?FTR <- (FTR (alive yes) (block no) (share none))
=>
	(modify ?FTR(share R+1/6)))


(defrule FTR-Share-3
	(SON (alive no))
	(GRS (alive no))
	(DAU (alive no))
	(SDU (alive no))
	?FTR <- (FTR (alive yes) (block no) (share none))
=>
	(modify ?FTR(share R)))


(defrule GRF-Share-1
	(or (SON (alive yes))
		(GRS (alive yes)))
	?GRF <- (GRF (alive yes) (block no) (share none))
=>
	(modify ?GRF(share 1/6)))


(defrule GRF-Share-2
	(SON (alive no))
	(GRS (alive no))
	(or (DAU (alive yes))
		(SDU (alive yes)))
	?GRF <- (GRF (alive yes) (block no) (share none))
=>
	(modify ?GRF(share R+1/6)))


(defrule GRF-Share-3
	(SON (alive no))
	(GRS (alive no))
	(DAU (alive no))
	(SDU (alive no))
	?GRF <- (GRF (alive yes) (block no) (share none))
=>
	(modify ?GRF(share R)))


(defrule MBR-Share-1
	?MBR <- (MBR (alive yes) (block no) (count ?count&:(> ?count 1)) (share none))
=>
	(modify ?MBR(share MBS+1/3)))


(defrule MBR-Share-2
	(MSI (alive yes))
	?MBR <- (MBR (alive yes) (block no) (count 1) (share none))
=>
	(modify ?MBR(share MBS+1/3)))


(defrule MBR-Share-3
	(MSI (alive no))
	?MBR <- (MBR (alive yes) (block no) (count 1) (share none))
=>
	(modify ?MBR(share 1/6)))


(defrule MSI-Share-1
	?MSI <- (MSI (alive yes) (block no) (count ?count&:(> ?count 1)) (share none))
=>
	(modify ?MSI(share MBS+1/3)))


(defrule MSI-Share-2
	(MBR (alive yes))
	?MSI <- (MSI (alive yes) (block no) (count 1) (share none))
=>
	(modify ?MSI(share MBS+1/3)))


(defrule MSI-Share-3
	(MBR (alive no))
	?MSI <- (MSI (alive yes) (block no) (count 1) (share none))
=>
	(modify ?MSI(share 1/6)))


(defrule HUS-Share-1
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (DAU (alive yes))
				(SDU (alive yes)))))
	?HUS <- (HUS (alive yes) (block no) (share none))
=>
	(modify ?HUS(share 1/4)))


(defrule HUS-Share-2
	(and (SON (alive no)) 
		(and (GRS (alive no))
			(and (DAU (alive no))
				 (SDU (alive no)))))
	?HUS <- (HUS (alive yes) (block no) (share none))
=>
	(modify ?HUS(share 1/2)))


(defrule DAU-Share-1
	(SON (alive yes))

	?DAU <- (DAU (alive yes) (block no) (share none))
=>
	(modify ?DAU(share R)))


(defrule DAU-Share-2
	(SON (alive no))

	?DAU <- (DAU (alive yes) (block no) (count ?count&:(> ?count 1)) (share none))
=>
	(modify ?DAU(share 2/3)))


(defrule DAU-Share-3
	(SON (alive no))

	?DAU <- (DAU (alive yes) (block no) (count 1) (share none))
=>
	(modify ?DAU(share 1/2)))


(defrule SDU-Share-1
	(GRS (alive yes) (level ?level1))

	?SDU <- (SDU (alive yes) (block no) (level ?level2&:(eq ?level1 ?level2)) (share none))
=>
	(modify ?SDU(share R)))


(defrule SDU-Share-2
	(GRS (alive no))
	
	?SDU <- (SDU (alive yes) (block no) (count ?count&:(> ?count 1)) (share none))
=>
	(modify ?SDU(share 2/3)))


(defrule SDU-Share-3
	(GRS (alive yes) (level ?level1))
	(SDU (alive yes) (block no) (level ?level2&:(< ?level2 ?level1)))
	
	?SDU <- (SDU (alive yes) (block no) (count ?count&:(> ?count 1)) (share none))
=>
	(modify ?SDU(share 2/3)))


(defrule SDU-Share-4
	(GRS (alive no))
	(DAU (alive yes))

	?SDU <- (SDU (alive yes) (block no) (count 1) (share none))
=>
	(modify ?SDU(share 1/6)))


(defrule SDU-Share-5
	(GRS (alive yes) (level ?level1))
	(SDU (alive yes) (block no) (level ?level2&:(< ?level2 ?level1)))
	(DAU (alive yes))

	?SDU <- (SDU (alive yes) (block no) (count 1) (share none))
=>
	(modify ?SDU(share 1/6)))


(defrule SDU-Share-6
	(GRS (alive no))
	(DAU (alive no))

	?SDU <- (SDU (alive yes) (block no) (count 1) (share none))
=>
	(modify ?SDU(share 1/2)))


(defrule SDU-Share-7
	(GRS (alive yes) (level ?level1))
	(SDU (alive yes) (block no) (level ?level2&:(< ?level2 ?level1)))
	(DAU (alive no))

	?SDU <- (SDU (alive yes) (block no) (count 1) (share none))
=>
	(modify ?SDU(share 1/2)))


(defrule MGR-Share
	?MGR <- (MGR (alive yes) (block no) (share none))
=>
	(modify ?MGR(share 1/6)))


(defrule PGR-Share
	?PGR <- (PGR (alive yes) (block no) (share none))
=>
	(modify ?PGR(share 1/6)))


(defrule FSI-Share-1
	(or	(FBR (alive yes)) 
		(or (DAU (alive yes))
			(or (SDU (alive yes)))))

	?FSI <- (FSI (alive yes) (block no) (share none))
=>
	(modify ?FSI(share R)))


(defrule FSI-Share-2
	(FBR (alive no)) 
	(DAU (alive no))
	(SDU (alive no))

	?FSI <- (FSI (alive yes) (block no) (count 1) (share none))
=>
	(modify ?FSI(share 1/2)))


(defrule FSI-Share-3
	(FBR (alive no)) 
	(DAU (alive no))
	(SDU (alive no))

	?FSI <- (FSI (alive yes) (block no) (count ?count&:(> ?count 1)) (share none))
=>
	(modify ?FSI(share 2/3)))


(defrule PSI-Share-1
	(or	(PBR (alive yes)) 
		(or (DAU (alive yes))
			(or (SDU (alive yes)))))

	?PSI <- (PSI (alive yes) (block no) (share none))
=>
	(modify ?PSI(share R)))


(defrule PSI-Share-2
	(PBR (alive no)) 
	(DAU (alive no))
	(SDU (alive no))
	(FSI (alive yes) (count 1))

	?PSI <- (PSI (alive yes) (block no) (share none))
=>
	(modify ?PSI(share 1/6)))


(defrule PSI-Share-3
	(PBR (alive no)) 
	(DAU (alive no))
	(SDU (alive no))
	(FSI (alive no))

	?PSI <- (PSI (alive yes) (block no) (count ?count&:(> ?count 1)) (share none))
=>
	(modify ?PSI(share 2/3)))


(defrule PSI-Share-4
	(PBR (alive no)) 
	(DAU (alive no))
	(SDU (alive no))
	(FSI (alive no))

	?PSI <- (PSI (alive yes) (block no) (count 1) (share none))
=>
	(modify ?PSI(share 1/2)))


(defrule WIF-Share-1
	(or	(SON (alive yes)) 
		(or (DAU (alive yes))
			(or (GRS (alive yes))
				(SDU (alive yes)))))
	?WIF <- (WIF (alive yes) (block no) (share none))
=>
	(modify ?WIF(share 1/8)))


(defrule WIF-Share-2
	(SON (alive no)) 
	(DAU (alive no))
	(GRS (alive no))
	(SDU (alive no))

	?WIF <- (WIF (alive yes) (block no) (share none))
=>
	(modify ?WIF(share 1/4)))


(defrule MTR-Share-1
	(or	(SON (alive yes)) 
		(or (DAU (alive yes))
			(or (GRS (alive yes))
				(SDU (alive yes)))))
	?MTR <- (MTR (alive yes) (block no) (share none))
=>
	(modify ?MTR(share 1/6)))


(defrule MTR-Share-2
	(SON (alive no)) 
	(DAU (alive no))
	(GRS (alive no))
	(SDU (alive no))
	(CBS (valid yes))

	?MTR <- (MTR (alive yes) (block no) (share none))
=>
	(modify ?MTR(share 1/6)))


(defrule MTR-Share-3
	(SON (alive no)) 
	(DAU (alive no))
	(GRS (alive no))
	(SDU (alive no))
	(CBS (valid no))

	?MTR <- (MTR (alive yes) (block no) (share none))
=>
	(modify ?MTR(share 1/3)))