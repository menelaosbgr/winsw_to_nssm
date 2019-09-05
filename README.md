# winsw_to_nssm
Use your winsw XML configurations with nssm (under construction).

### Why?

Unfortunately, at some point winsw was not working for me. I was getting an uknown error.
At that point I wanted to use my current xml configuration with NSSM - the Non-Sucking Service Manager.

### Installation

Please download a version of nssm and add it to your path. See: https://nssm.cc/
Additionally, I make use of the xpath.bat from https://github.com/kohsuke/winsw/blob/master/examples/sample-minimal.xml .
Rename your nssm exe to _nssm..exe.

### Usage

Currently you must rename your config file to the name config.xml

### TODOs

Adding more parameter support such as the logration and description.



