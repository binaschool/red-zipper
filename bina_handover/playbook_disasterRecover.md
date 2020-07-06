# Disaster Recovery for Bina
## Overview
The Bina BigBlueButton infrastructure consists of 4 core components :

![Basic architecture diagram](basicArch.png)

Below is a playbook for what to do in the case that each of these components fail.

## Login OR sign-up starts to fail (Google Auth & Greenlight)
The login and sign-up functionality are dependent on two systems, Greenlight, hosted by BBM and Google Auth, hosted by google. In order for the login to work, it requires that both these systems are correctly configured with the correct domain information. In the case that either of these systems are modified and configured incorrectly, the login & sign-up functionalities will fail. When that occurs, the following steps are required :

* Determine whether the configuration in Google Accounts was changed
The Google Accounts are administered & configured by Zach Bowen for Bina (zachbowen@thebinaschool.com), contact Zach to find out if the configuration was changed and revert or fix.
* Determine whether the configuration in Greenlight was changed
The greenlight server is configured, administered and run by bigBlueMeeting
* Contact BigBlueMeeting support (contact@bigbluemeeting.com) with a reference to the domain (Production or staging and datacenter location) and ask them whether the configuration or domain information was changed & ask to restore previous working configuration

## Greenlight starts to fail
Greenlight is the ROR application containing the user interface responsible for managing user accounts, rooms, schedules and recordings. If any of this functionality stops working, it is controlled by the greenlight server.
* The greenlight servers are maintained, configured and monitored exclusively by the BigBlueMeeting team and is treated as a blackbox to the development team
* Contact BigBlueMeeting support (contact@bigbluemeeting.com) with the greenlight domain that is non-functional to get them to restore it - making sure they restore the correct (previous) CONFIGURATION.

## BBB Server fails
The BBB server contains multiple components required to run the BBB application. Initially the BBB server is provisioned and set up by the BBM team. Once that is done the Bina development team apply a patched version of the BBB HTML5 client to customise the server.

* If the BBB server goes down (classrooms can be created but not joined) contact BBM (contact@bigbluemeeting.com) with domain details and ask them to restart/restore the server.
* If the server cannot be restored and a new fresh server needs to be created:
  * Contact BBM (contact@bigbluemeeting.com) and ask them to create a new BBB server with the existing ssh keys. BBM need to also update the DNS entries to point to this new server IP and need to build the server in the correct data-center (at time of writing the Production server is in Europe & the staging server is in the US).
  * Once the new server is setup under the correct domain and you can test it by launching a meeting from the relevant greenlight server. You should see a meeting room with the unmodified HTML5 Client in blue.
  * To add the Bina customisations follow the [guide : customising a BBM server](guide_customClientDeployment.md)
