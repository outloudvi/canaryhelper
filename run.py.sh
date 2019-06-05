#!/bin/zsh

INTERVAL=30*86400

echo "[INFO] Generating canary for `date +%Y%m`..."
cat >canary-`date +%Y%m`.txt <<EOF
WARRANT CANARY
====================================
Last updated       : `date +%Y/%m/%d`
Next update before : `date +%Y/%m/%d -d @$(($(date +%s) + $INTERVAL))`
====================================
What is a warrant canary: https://en.wikipedia.org/wiki/Warrant_canary
====================================

Issued for `date +%Y/%m`.

Don't just trust the contents of this file blindly! Verify the
digital signatures! Also, make sure the keys are correct!

Signers
~~~~~~~~~~~~~

`cat signers.txt`

Statements
~~~~~~~~~~~~~

1. All our infrastructure is in our control, the integrity of our
entire system is sound.

2. We have not been compromised or suffered a recent data breach,
to our best knowledge.

3. We have not disclosed any private encryption keys.

4. We have not been forced to modify our system to allow access or
information leakage to a third party.

5. We haven't received any specific orders, requests or recommendations
from any authorities, whether formal or informal.

6. We have not received any court orders, gag orders, or other similar
orders from the government of the People's Republic of China.

7. We have not received any government subpoenas.

8. Our personal safety and security is not threatened.

9. We plan to publish the next of these canary statements before `date +%Y/%m/%d -d @$(($(date +%s) + $INTERVAL))`.
Special note should be taken if no new canary is published by that time
or if the list of statements changes without plausible explanation.

Special Announcements
~~~~~~~~~~~~~~~~~~~~~~~~

`cat special.txt`

Proof of Freshness
~~~~~~~~~~~~~~~~~~~~

$ rsstail -e1 -n5 https://www.telegraph.co.uk/news/rss.xml -l -g
`rsstail -e1 -n5 https://www.telegraph.co.uk/news/rss.xml -l -g`

$ rsstail -e1 -n5 https://rss.nytimes.com/services/xml/rss/nyt/World.xml -l -g
`rsstail -e1 -n5 https://rss.nytimes.com/services/xml/rss/nyt/World.xml -l -g`

$ date -R -u
`date -R -u`

EOF
echo "[INFO] Canary at canary-`date +%Y%m`.txt"
echo "[INFO] Signing..."
gpg --clearsign canary-`date +%Y%m`.txt
