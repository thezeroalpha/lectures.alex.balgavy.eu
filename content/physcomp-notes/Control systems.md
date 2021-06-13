+++
title = 'Control systems'
+++
# Control systems
Sensors: receive signals (microphones, cameras…)

Actuators: actually do stuff in the 'real world’ (LEDs, motors, speakers, displays, lamps…)

Controller: “the brain”, the intelligent unit. provide hardware & software that makes system autonomous by using sensor input etc.

any pervasive computing system executes sense-control-act sequence in a loop

Control:

- deliberative: think hard, act later
    - planning — look ahead at outcomes of possible actions
    - searching — looking for sequence of actions leading to desired goal
    - use internal representation of the environment — a map, for example
    - for decisions, use for example shortest path from one node to another in a map
        - uses Dijkstra’s or A* algorithm
        - GPS nav systems use this
- reactive: don’t think, react!
    - e.g. smart curtains, thermostat, obstacle handling, landmark navigation
    - don’t use internal representation, just direct mapping between sensors and effectors
    - rules:
        - if dark outside, then close the curtains
    - control type
        - open-loop control — input signal to controller, actuator, output controlled variable
            - examples: microwave, automatic lights, automatic water faucets
        - closed-loop control — get feedback, check if everything was executed right
            - uses a comparator that gets feedback from output of actuator
            - comparator outputs error to controller, which then tries to minimise error
            - example: heater
    - obstacle handling
        - simple — contact (touch sensor)
        - better — proximity, but don’t know distance (whiskers)
        - best — ranging
            - sonar, with reflected sound waves. echolocation (distance = speed × time)
            - LIDAR, using a laser swept across FOV
    - landmark navigation
        - follow a line, a wall
        - feedback control — turn always same angle, turn proportionally (P), proportional derivative (PD, rate of change), or proportional derivative and integral (PID, rate of change and time)
- others: hybrid, behaviour-based
