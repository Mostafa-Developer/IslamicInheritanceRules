(defrule GRS-Block-1
	(SON (alive yes)) 
	?GRS <- (GRS (block no))
=>
	(modify ?GRS(block yes)))


(defrule GRS-Block-2
	(GRS (level ?level1)) 
	(GRS (level ?level2&:(> ?level2 ?level1)))

	?GRS <- (GRS (block no) (level ?level2))
=>
	(modify ?GRS(block yes)))


(defrule GRF-Block-1
	(FTR (alive yes)) 
	?GRF <- (GRF (block no))
=>
	(modify ?GRF(block yes)))


(defrule GRF-Block-2
	(GRF (level ?level1)) 
	(GRF (level ?level2&:(> ?level2 ?level1)))

	?GRF <- (GRF (block no) (level ?level2))
=>
	(modify ?GRF(block yes)))


(defrule FBR-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(GRF (alive yes)))))
	?FBR <- (FBR (block no))
=>
	(modify ?FBR(block yes)))


(defrule PBR-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(or (GRF (alive yes))
					(FBR (alive yes))))))
	?PBR <- (PBR (block no))
=>
	(modify ?PBR(block yes)))


(defrule MBR-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(or (GRF (alive yes))
					(or (DAU (alive yes))
						(SDU (alive yes)))))))
	?MBR <- (MBR (block no))
=>
	(modify ?MBR(block yes)))


(defrule SFB-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(or (GRF (alive yes))
					(or (FBR (alive yes))
						(PBR (alive yes)))))))
	?SFB <- (SFB (block no))
=>
	(modify ?SFB(block yes)))


(defrule SPB-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(or (GRF (alive yes))
					(or (FBR (alive yes))
						(or (PBR (alive yes))
							(SFB (alive yes))))))))
	?SPB <- (SPB (block no))
=>
	(modify ?SPB(block yes)))


(defrule FUN-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(or (GRF (alive yes))
					(or (FBR (alive yes))
						(or (PBR (alive yes))
							(or (SFB (alive yes))
								(SPB (alive yes)))))))))
	?FUN <- (FUN (block no))
=>
	(modify ?FUN(block yes)))


(defrule PUN-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(or (GRF (alive yes))
					(or (FBR (alive yes))
						(or (PBR (alive yes))
							(or (SFB (alive yes))
								(or (SPB (alive yes))
									(FUN (alive yes))))))))))
	?PUN <- (PUN (block no))
=>
	(modify ?PUN(block yes)))


(defrule SFU-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(or (GRF (alive yes))
					(or (FBR (alive yes))
						(or (PBR (alive yes))
							(or (SFB (alive yes))
								(or (SPB (alive yes))
									(or (FUN (alive yes))
										(PUN (alive yes)))))))))))
	?SFU <- (SFU (block no))
=>
	(modify ?SFU(block yes)))


(defrule SPU-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(or (GRF (alive yes))
					(or (FBR (alive yes))
						(or (PBR (alive yes))
							(or (SFB (alive yes))
								(or (SPB (alive yes))
									(or (FUN (alive yes))
										(or (PUN (alive yes))
											(SFU (alive yes))))))))))))
	?SPU <- (SPU (block no))
=>
	(modify ?SPU(block yes)))


(defrule SDU-Block-1
	(SON (alive yes)) 
	?SDU <- (SDU (block no))
=>
	(modify ?SDU(block yes)))


(defrule SDU-Block-2
	(SDU (alive yes) (level ?level1)) 
	(SDU (alive yes) (level ?level2&:(> ?level2 ?level1)))

	?SDU <- (SDU (alive yes) (block no) (level ?level2))
=>
	(modify ?SDU(block yes)))


(defrule SDU-Block-3
	(GRS (alive yes) (level ?level1)) 
	(SDU (alive yes) (level ?level2&:(> ?level2 ?level1)))

	?SDU <- (SDU (alive yes) (block no) (level ?level2))
=>
	(modify ?SDU(block yes)))


(defrule SDU-Block-4
	(DAU (alive yes) (count ?count&:(> ?count 1)))
	(SDU (alive yes) (level ?level1))
	(GRS (alive yes) (level ?level2&:(neq ?level1 ?level2)))

	?SDU <- (SDU (alive yes) (block no) (level ?level2))
=>
	(modify ?SDU(block yes)))


(defrule SDU-Block-5
	(DAU (alive yes) (count ?count&:(eq ?count 1)))
	(SDU (alive yes) (level ?level1))
	(GRS (alive yes) (level ?level2&:(eq ?level1 ?level2)))

	?SDU <- (SDU (alive yes) (block no) (level ?level2))
=>
	(modify ?SDU(block yes)))


(defrule MGR-Block-1
	(MTR (alive yes)) 
	?MGR <- (MGR (block no))
=>
	(modify ?MGR(block yes)))


(defrule MGR-Block-2
	(MGR (level ?level1)) 
	(MGR (level ?level2&:(> ?level2 ?level1)))

	?MGR <- (MGR (block no) (level ?level2))
=>
	(modify ?MGR(block yes)))


(defrule MGR-Block-3
	(PGR (level ?level1)) 
	(MGR (level ?level2&:(> ?level2 ?level1)))

	?MGR <- (MGR (block no) (level ?level2))
=>
	(modify ?MGR(block yes)))


(defrule PGR-Block-1
	(or (MTR (alive yes))
		(FTR (alive yes)))
	?PGR <- (PGR (block no))
=>
	(modify ?PGR(block yes)))


(defrule PGR-Block-2
	(MGR (level ?level1)) 
	(PGR (level ?level2&:(> ?level2 ?level1)))

	?PGR <- (PGR (block no) (level ?level2))
=>
	(modify ?PGR(block yes)))


(defrule PGR-Block-3
	(PGR (level ?level1)) 
	(PGR (level ?level2&:(> ?level2 ?level1)))

	?PGR <- (PGR (block no) (level ?level2))
=>
	(modify ?PGR(block yes)))


(defrule FSI-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(GRF (alive yes)))))
	?FSI <- (FSI (block no))
=>
	(modify ?FSI(block yes)))


(defrule PSI-Block-1
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(or (GRF (alive yes))
					(FBR (alive yes))))))
	?PSI <- (PSI (block no))
=>
	(modify ?PSI(block yes)))


(defrule PSI-Block-2
	(FSI (count ?count&:(> ?count 1)))
	(PBR (alive no))
	
	?PSI <- (PSI (block no))
=>
	(modify ?PSI(block yes)))


(defrule PSI-Block-3
	(FSI (count 1))
	(DAU (alive no))
	(SDU (alive yes))
	
	?PSI <- (PSI (block no))
=>
	(modify ?PSI(block yes)))


(defrule PSI-Block-4
	(FSI (count 1))
	(DAU (alive yes))
	
	?PSI <- (PSI (block no))
=>
	(modify ?PSI(block yes)))


(defrule MSI-Block
	(or	(SON (alive yes)) 
		(or (GRS (alive yes))
			(or (FTR (alive yes))
				(or (GRF (alive yes))
					(or (DAU (alive yes))
						(SDU (alive yes)))))))
	?MSI <- (MSI (block no))
=>
	(modify ?MSI(block yes)))