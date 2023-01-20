#!/usr/bin/env python3

import pexpect
import getopt
import sys

args = sys.argv[1:]

child = pexpect.spawn ('./run_L1.sh')
#child.logfile = open("/tmp/mylog", "w")
child.logfile = sys.stdout.buffer

child.expect (' login: ', timeout=300)
child.sendline ('root')
child.expect ('# ', timeout=300)

# start a few guests one at a time
for i in range(4):
    child.sendline ('./tests/run_L2.sh')
    child.expect (' login: ', timeout=300)
    child.sendline ('root')
    child.expect ('# ')
    child.sendline ('halt')
    child.expect ('System halted')
    child.expect ('# ')


# run parallel guests
child.sendline ('cd tests')
child.expect ('# ')
child.sendline ('./run_all_L2.sh 2')
child.expect ('# ')
child.sendline ('./check_all_L2.sh 2')
child.expect ('# ', timeout=600)
child.sendline ('pkill qemu-system-ppc -9; sleep 5')
child.expect ('# ', timeout=300)

child.sendline ('halt -f')
child.expect('System halted')
#child.interact()
