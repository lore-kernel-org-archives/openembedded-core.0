Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QlT1f-0004s3-3r
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 23:49:23 +0200
Received: (qmail invoked by alias); 25 Jul 2011 21:45:10 -0000
Received: from p5B0A39BD.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.57.189]
	by mail.gmx.net (mp052) with SMTP; 25 Jul 2011 23:45:10 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18hSO1tfTEh6Fe4l/nzKxOhL0GWqbt2V2f0zBvZFb
	nONWMBE7ZaMO/2
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 23:47:32 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201107242234.51777.schnitzeltony@gmx.de>
	<EBE64358-255D-41CD-BA27-A9A733515E3D@dominion.thruhere.net>
In-Reply-To: <EBE64358-255D-41CD-BA27-A9A733515E3D@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201107252347.32868.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-ti]Pandaboard issues
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
X-List-Received-Date: Mon, 25 Jul 2011 21:49:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, July 25, 2011 08:14:55 AM Koen Kooi wrote:
> Op 24 jul. 2011, om 22:34 heeft Andreas Mueller het volgende geschreven:
> > Hi,
> > 
> > while working on xfce48 recipes for meta-oe I wanted to do some run
> > tests. My only hardware currently supported in oe-core environment is
> > pandaboard. Herewith I face the following issues:
> > 
> > - Starting X stops / log attached
> > - Inputting at serial console causes bit errors (115200 8N1). Data coming
> > from board seems OK.
> > - No network (eth0 eth1 tested) available.
> 
> Tried usb0 or usb1?
usb1 works fine - thanks :-)

Andreas


