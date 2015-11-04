; (use-student-values-fact TRUE)
; (use-problem-summary TRUE)
(set-maximum-chain-depth 7)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  This file contains some possibly incomplete templates for the Mendel Backwards Problem Solving Tutor
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The file contains all templates that are needed, so no need to create new ones, but the templates
;;    that are provided may not have all the slots that are necessary.

(deftemplate problem
    (slot name)
    (slot subgoal (default select-cross))
    (slot first-strain-cur-cross)
    (slot cur-cross)
    (multislot interface-rows)   ; these are the rows in the interface that are still open,
                                 ;    in the order (top to bottom) that they appear in the interface
                                 ; initially, there are six such rows, but the tutor removes
                                 ;     them one by one, as they get filled in
        )

(deftemplate strain
    (slot name)
    (slot phenotype)		;; added phenotype slot for further inferences
    (multislot conclusions)	;; added conclusions multislot to model the partial and final conclusions
        )

(deftemplate conclusion
    (slot con-type) ;; label - if it's a partial/final conclusion
    (slot con-subtype)
    	;;	label - the value based on the options on the interface dropdowns 
    	;;	partial: homozygous/homozygous recessive or heterozygous 
    	;;	final: homozygous dominant/homozygous recessive/heterozygous
    (slot is-inferred) ;; boolean - TRUE if the conclusion has been infered from previous rules
    (slot is-written) ;; boolean - TRUE if the conclusion has been updated on the interface
    (slot interface-element) ;; link to interface representation
        )

(deftemplate cross
    (multislot strains)
    (slot offspring-ext)    ; a string to be printed in the interface
    (slot offspring-int)	;; added an internal representation of the offspring's ratio
    (slot phenotype)		;; added an internal representation of the more frequent offspring's phenotype (only for the 100-0 case)
    )

(deftemplate interface-row
    (multislot ies-strains)
    (slot ie-result)
    )

(deftemplate interface-element
    (slot name)
    (slot value)
    )


;; ----------------------------------------------------------------------------------------------------
(deftemplate studentValues
    (slot selection)
    (slot action)
    (slot input))

; tell productionRules file that templates have been parsed
(provide wmeTypes)
