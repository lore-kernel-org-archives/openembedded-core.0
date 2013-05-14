Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Uc4AL-00038e-GW
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 03:36:38 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:32845 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Uc3sl-0004y7-Hn; Mon, 13 May 2013 21:18:23 -0400
Date: Mon, 13 May 2013 21:18:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
Message-ID: <alpine.DEB.2.02.1305132059460.25048@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Tue, 14 May 2013 01:36:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 13 May 2013, Khem Raj wrote:

> Robert and Trevor
>
> so whats your cross-gcc version ?
> should be in tmpdir under
>
> sysroots/x86_64-linux/usr/bin/mips64-angstrom-linux/mips64-angstrom-linux-gcc -v

  after a fresh build, each attempt to boot qemumips64 hangs at some
point. i am definitely open to suggestions.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


