Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qp5PV-0005EF-NU
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:24:58 +0200
Received: (qmail invoked by alias); 04 Aug 2011 21:20:33 -0000
Received: from p5B0A21F4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.33.244]
	by mail.gmx.net (mp071) with SMTP; 04 Aug 2011 23:20:33 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+FcaNaNKyFPbT/H6t0ZXY+XYk9qtajv8XByOUcZ4
	eFIfDFKCEbzko/
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 23:23:29 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201108040011.52049.schnitzeltony@gmx.de>
	<1808891.sPgEKESHSy@perseus>
In-Reply-To: <1808891.sPgEKESHSy@perseus>
MIME-Version: 1.0
Message-Id: <201108042323.29579.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Howto pin u-boot to a version supplied by oe-core
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
X-List-Received-Date: Thu, 04 Aug 2011 21:24:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, August 04, 2011 03:34:17 AM Khem Raj wrote:
> PREFERRED_VERSION_pn-u-boot = "v2011.03+git%"
Works perfect: Both 2011.03 and 2011.06 are running fine. Thanks


