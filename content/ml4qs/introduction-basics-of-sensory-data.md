+++
title = 'Introduction & Basics of Sensory Data'
+++
# Introduction & Basics of Sensory Data
In this course, use machine learning with self/sensory data.

"Quantified self": self-tracking of biological, physical, behavioral, environmental info. Driven by a goal of individual, they want to do something with the collected info.

Why? Health, better work performance...self-healing, self-discipline, self-design, self-association, self-entertainment.

Quantified self is different because sensory noise, missing measurements. It's temporal data and there's interaction with user. Use multiple datasets to learn.

Terminology:
- measurement: one value for one attribute at one time point
- time series: measurements in temporal order
- supervised learning: inferring function from set of labelled training data
- unsupervised learning: no target label, goal is to describe associations and patterns among attribute
- reinforcement learning: find optimal actions in given situation to maximize numerical reward later in time

## Sensory data
Transforming raw data: combine tables by selecting step size Δt considered in data, start at earliest time point. Combine values of measurements within each interval [t, t+Δt)

Machine learning tasks:
- classification: predicting label (e.g. activity) based on sensors
- regression: predicting e.g. heart rate based on other sensory values and activity
