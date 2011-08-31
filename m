Received: from fly.rz.hs-augsburg.de ([141.82.25.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.morscher@hs-augsburg.de>) id 1Qysbu-0002Sw-M0
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 23:46:15 +0200
Received: from [127.0.0.1] (ppp-188-174-99-174.dynamic.mnet-online.de
	[188.174.99.174]) (authenticated bits=0)
	by fly.RZ.HS-Augsburg.DE (8.14.3/8.14.3) with ESMTP id p7VLfFSH018463
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 23:41:17 +0200 (MEST)
Message-ID: <4E5EAA78.2050505@hs-augsburg.de>
Date: Wed, 31 Aug 2011 23:41:12 +0200
From: Michael Morscher <michael.morscher@hs-augsburg.de>
Organization: HS Augsburg
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.0
	(fly.RZ.HS-Augsburg.DE [141.82.16.16]);
	Wed, 31 Aug 2011 23:41:17 +0200 (MEST)
X-HSA-RZ-MailScanner-Information: Please contact the ISP for more information
X-HSA-RZ-MailScanner-ID: p7VLfFSH018463
X-HSA-RZ-MailScanner: Found to be clean
X-HSA-RZ-MailScanner-From: michael.morscher@hs-augsburg.de
X-HSA-RZ-MailScanner-Watermark: 1315431677.63697@UrxdlOjnAIf+q0AKsXgGcQ
X-Spam-Status: No
Subject: version bump for tzcode needed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: michael.morscher@hs-augsburg.de,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2011 21:46:15 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Fetching for old tzcode2011g failed, newer version tzcode2011i available.

I really need to get into developing soon...

| DEBUG: Trying PREMIRRORS
| DEBUG: Trying Upstream
| NOTE: fetch ftp://elsie.nci.nih.gov/pub/tzcode2011g.tar.gz
| DEBUG: executing /usr/bin/env wget -t 5 -q --passive-ftp 
--no-check-certificate -P /build/oe-core/build/sources 
'ftp://elsie.nci.nih.gov/pub/tzcode2011g.tar.gz'
| DEBUG: Fetcher accessed the network with the command /usr/bin/env wget 
-t 5 -q --passive-ftp --no-check-certificate -P 
/build/oe-core/build/sources 
'ftp://elsie.nci.nih.gov/pub/tzcode2011g.tar.gz'
|
| DEBUG: Trying MIRRORS
| ERROR: Function 'Fetcher failure for URL: 
'ftp://elsie.nci.nih.gov/pub/tzcode2011g.tar.gz;name=tzcode'. Unable to 
fetch URL ftp://elsie.nci.nih.gov/pub/tzcode2011g.tar.gz;name=tzcode 
from any source.' failed





