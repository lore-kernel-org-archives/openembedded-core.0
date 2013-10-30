Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 681686D44F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:46:08 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9UDk4so017542 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:46:04 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jLnjfm6PEaIe
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:46:04 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9UDjxvq017538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:46:00 GMT
Message-ID: <1383140754.25877.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Oct 2013 13:45:54 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: 1.5/dora stable series maintainer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Oct 2013 13:46:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It gives me pleasure to announce that Robert Yang
<liezhi.yang@windriver.com> is going to be taking on the role of stable
maintainer for the 1.5 series.

The usual process for patch nomination and merging will happen with
Robert maintaining a dora-next branch which periodically will get merged
into the main dora branch after testing through a consolidated pull
request.

To "hit the ground running" so to speak, I fast forwarded dora a little
way along the master branch to take advantage of fixes which didn't
make the main release but were available when I started merging patches.
Further patches can be nominated and cherry-picked as needed from here.

Cheers,

Richard




