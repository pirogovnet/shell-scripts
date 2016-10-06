#!/usr/bin/perl  -w



    for($i=71000001;$i<= 71008101;$i++) {


        if (open (FH,">coa-hinet.users")) {
            print FH "
User-Name= $i\@hinet\.net
Dynamic-QoS-Param \= \"police-circuit-rate rate-absolute 1000 parent\" "
        }
        close FH;

        system("/usr/local/bin/radclient -d /usr/local/etc/raddb -f coa-hinet.users -x -s 168.95.190.10:3799 coa redback");

}
