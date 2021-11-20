#!/bin/bash

#tramite il pacchetto stress creo un job per superare il 60% di cpu

#stress --cpu 1 --timeout 15

#uso invece il comando yes per aumentare il carico sulla cpu
#il comando yes stampa y all'infinito, per evitare l'output a schermo lo rimando su /dev/null (cestino)

yes > /dev/null
