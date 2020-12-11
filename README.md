# QuitRingWhenIdle

Ring.com app prevents the mac from sleeping by registering the PreventUserIdleSystemSleep flag.  This is a known issue which is marked solved in this [thread](https://community.ring.com/t5/Ring-App/MacOS-App-Preventing-Sleep/td-p/2986) even though it isn't.

This script can be run on any interval using launchd, cron or any other scheduler.

I run it in launchd every minute with a 300 second timeout.  When my computer is idle for 5 minutes the Ring app will be quit so that the regular idle timer processes of the mac will be able to do their thing.

I also run another script to start the ring app when the computer is unlocked.

The first and only argument of the script is the minimum number of idle seconds before ring is quit.

I run like this:

```
./QuitRingIfIdle.sh 300
```
