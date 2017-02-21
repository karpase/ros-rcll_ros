#!/bin/bash

source $(dirname $(realpath $0))/rosplan_functions.sh
INSTANCES="RING_BLUE:color RING_GREEN:color RING_ORANGE:color RING_YELLOW:color BASE_RED:color BASE_BLACK:color BASE_SILVER:color CAP_BLACK:color CAP_GREY:color c0:ordercomplexityvalue c1:ordercomplexityvalue c2:ordercomplexityvalue c3:ordercomplexityvalue g0:gate g1:gate g2:gate g3:gate"
FACTS=""
GOALS=""

rosplan_clear_all
rosplan_add_instances $INSTANCES
rosplan_add_facts $FACTS
rosplan_add_goals $GOALS
rosplan_call_planner
