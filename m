Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QiNtz-0001MB-0Q
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jul 2011 11:44:43 +0200
Received: by wwi18 with SMTP id 18so1994502wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2011 02:40:40 -0700 (PDT)
Received: by 10.217.3.80 with SMTP id q58mr4455628wes.53.1310895640319;
	Sun, 17 Jul 2011 02:40:40 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r56sm1668864weq.39.2011.07.17.02.40.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 17 Jul 2011 02:40:39 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 17 Jul 2011 11:40:37 +0200
Message-Id: <2ACEB6D6-846E-479C-AAE1-5C43687FD581@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: Incomplete licensing in recipes
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
X-List-Received-Date: Sun, 17 Jul 2011 09:44:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I was looking at the testlab output for licensing [1] and noticed that =
eglibc(-locale) and libcap2 just say (L)GPL and don't specify the =
version, was that intended?

regards,

Koen

[1] =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/tree/hawkboa=
rd/eglibc/systemd-image/installed-package-licenses.txt?h=3Dyocto&id=3Dff18=
5d46e0da70dba80a540a9d7d6757cd213931=


