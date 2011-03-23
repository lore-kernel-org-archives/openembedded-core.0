Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q2Max-0005k2-T1
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 12:51:23 +0100
Received: by wyb40 with SMTP id 40so7411570wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 04:49:32 -0700 (PDT)
Received: by 10.216.65.16 with SMTP id e16mr388277wed.93.1300880972444;
	Wed, 23 Mar 2011 04:49:32 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w25sm4961263wbd.5.2011.03.23.04.49.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 04:49:32 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 23 Mar 2011 12:49:31 +0100
Message-Id: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1082)
X-Mailer: Apple Mail (2.1082)
Subject: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 23 Mar 2011 11:51:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I'd like to import the EFL recipes Martin did from meta-shr into the =
meta-openembedded repo. Before I go bothering Martin about it, what =
would be the best place to put them?

Inside meta-oe:

meta-openembedded/
	meta-oe/
		recipes-efl

or next to it?

meta-openembedded/
	meta-oe/
	meta-efl/

regards,

Koen=


