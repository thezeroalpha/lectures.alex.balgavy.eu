+++
title = 'Case Study'
+++

# Case Study
## Overview
Connecting consumers of energy directly with renewable energy sources creates a higher certainty that what consumers pay for energy ends up with a renewable producer, and not with a fossil energy plant
Challenge: balancing the grid.
In energy system based on wind and solar, supply fluctuates uncontrollably, so need to control demand.
Vandebron does this with "FlexIOT".

## Definitions
**LFC:** Load Frequency Control (TenneT system for national power balancing)
- respond fast and effectively to occurrence of large Dutch regulating errors with respect to the synchronously linked high voltage grid. The target is to correct within 15 minutes any significant imbalance.

**TSO:** Transmission Service Operator (for instance TenneT for the Netherlands)
- responsible for the balance on the energy grid
- when there is unbalance between supply and demand, the frequency on the energy grid will deviate from the desired 50Hz
- TSO traditionally pays energy plants to react to fluctuations when upward or downward regulation of the supply is needed
- Alternatively, the TSO may pay so-called aggregators (see below) to regulate the demand side.

**Aggregator** (Vandebron)
- collects enough energy-consuming assets to affect balance of national grid
- responsible to control these devices based on what TSO says

**FSP:** Flexibility Service provider
- the Aggregator in this case
- in the future, will be separate entity

**MSP:** Metering Service Provider
- the Aggregator in this case
- in the future, will be separate entity

**OEM:** Original Equipment Manufacturers

**CBP:** Crowd Balancing Platform
- we design its architecture
- we need to take into account exceptions to normal operation that may impact the CBP.
- connects FlexIOT and other aggregators to the TSO
- enables the delivery of balancing and flexibility on the power grid
- addresses for example resources and resource types, balancing, pooling, and bidding

**Prosumer:**
- user of a device enrolled on the platform
- acts as a consumer and producer of energy
- reap the benefits of the financial compensation for supplying the asset to the system, either through a one time discount (see OEM, above) or through periodical revenues

**Government Privacy Body:**
- needs to be convinced that there are no privacy issues
- demands privacy by design
- we need to address any privacy issues that may arise, and show how we solved those in our architecture.

## Interaction between stakeholders
Registration
- owner of device (prosumer/OEM) onboards their device
- Aggregator (as FSP) registers the available devices and Grid Connection Point
- TSO receives a signal that the device has been onboarded

Bidding
- Each Aggregator/FSP places bids or ‘flex offers’ when they have flexibility to offer to the TSO (takes into account any timing constraints)
- TSO receives the bids and processes them so that they can be activated when balancing is required.

Operation
1. TSO sends Flex activation signal to the Aggregator/FSP when balancing is required
2. Aggregator/FSP:
    1. receives the activation signal
    2. acknowledges reception to the TSO
    3. activates the appropriate flex device(s) to deliver the required power to balance the grid.

Validation
- flex devices that participate in the flex offering collect power measurements shared with the Aggregator/FSP
- Aggregator/FSP periodically sends aggregated measurements and baselines (forecasts for 1, 5, and 10 minutes upfront) for the pool of devices to the TSO
- Aggregator (as MSP) sends measurements of the individual devices to the TSO
- TSO validates whether Aggregator delivered as requested.

Settlements
- SO settles payment with the Aggregator based on the delivered flexibility (MW power delivered).
- Aggregator settles payment with the prosumer/OEM based on the power delivered from their device
