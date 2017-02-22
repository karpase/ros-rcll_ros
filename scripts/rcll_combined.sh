#!/bin/bash

source $(dirname $(realpath $0))/rosplan_functions.sh
INSTANCES="RING_BLUE:ring-color RING_GREEN:ring-color RING_ORANGE:ring-color RING_YELLOW:ring-color BASE_RED:base-color BASE_BLACK:base-color BASE_SILVER:base-color CAP_BLACK:cap-color CAP_GREY:cap-color c0:ordercomplexityvalue c1:ordercomplexityvalue c2:ordercomplexityvalue c3:ordercomplexityvalue GATE-1:gate GATE-2:gate GATE-3:gate"
FACTS="cs-can-perform;m:C-CS1|op:CS_RETRIEVE cs-can-perform;m:C-CS2|op:CS_RETRIEVE"
#GOALS=""
GOALS="prepared;m:C-BS prepared;m:C-DS prepared;m:C-CS1 prepared;m:C-CS2 prepared;m:C-RS1 prepared;m:C-RS2"

rosplan_clear_all
rosplan_add_instances $INSTANCES
rosplan_add_facts $FACTS
rosplan_add_goals $GOALS
rosplan_call_planner

