#!/bin/bash

#tramite il pacchetto stress creo un job per superare il 60% di cpu

#stress --cpu 1 --timeout 15

#uso invece il comando yes per aumentare il carico sulla cpu
#il comando yes stampa y all'infinito, per evitare l'output a schermo lo rimando su /dev/null (black-hole)

yes > /dev/null


#comandi di terminazione job su condor

#condor_q => mostra i job che ho in coda

#condor_rm (id_job) => rimuovo job dalla coda
