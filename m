Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <David.Nystrom@enea.com>) id 1TdkSc-00065M-99
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 17:26:06 +0100
Received: from [172.16.140.28] (172.16.140.28) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.2.318.1;
	Wed, 28 Nov 2012 17:10:47 +0100
Message-ID: <50B63784.5050502@enea.com>
Date: Wed, 28 Nov 2012 17:10:44 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [172.16.140.28]
Subject: meta-cloud layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 16:26:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

I'm working on getting a minimal Yocto/oe-core based OpenStack setup 
running with the meta-cloud layer, with bits and pieces "borrowed" from 
the meta-xen layer.

Still in its infancy, and lots of stuff is still missing and/or not 
working properly.

Have a look if your interested, not much to see yet though.

https://github.com/nysan/meta-cloud.git

Any thoughts on floating layer ML:s, i.e. an ML for so called 
"out-of-tree" layers ?  Or is the common thought that all new recipes
should eventually go into oe-core ?

Best Regards,
David


