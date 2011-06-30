Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcODF-00073d-AX
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 22:51:49 +0200
Received: by wwi18 with SMTP id 18so2238404wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 13:48:05 -0700 (PDT)
Received: by 10.227.159.136 with SMTP id j8mr2196845wbx.99.1309466885602;
	Thu, 30 Jun 2011 13:48:05 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm1882811wbb.65.2011.06.30.13.48.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 13:48:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 30 Jun 2011 22:47:58 +0200
Message-Id: <D937CAB3-BFAC-46CD-8E33-67635EFBC215@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: kernel.bbclass ERROR: QA Issue: Architecture did not match (40 to 62)
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
X-List-Received-Date: Thu, 30 Jun 2011 20:51:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I'm going to be mailing out the errors I'm setting with the reinstated =
insane.bbclass, here are the first ones:

ERROR: QA Issue: Architecture did not match (40 to 62) on =
/work/archos5it-angstrom-linux-gnueabi/linux-omap-archos-2.6.27.10-omap1-r=
101/packages-split/kernel-misc/kernel/scripts/kconfig/conf.o
ERROR: QA Issue: Architecture did not match (40 to 62) on =
/work/archos5it-angstrom-linux-gnueabi/linux-omap-archos-2.6.27.10-omap1-r=
101/packages-split/kernel-misc/kernel/scripts/kconfig/zconf.tab.o
ERROR: QA Issue: Architecture did not match (40 to 62) on =
/work/archos5it-angstrom-linux-gnueabi/linux-omap-archos-2.6.27.10-omap1-r=
101/packages-split/kernel-misc/kernel/scripts/kconfig/kxgettext.o



