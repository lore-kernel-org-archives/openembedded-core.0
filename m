Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SukTe-0005sD-G9
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 15:21:10 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:49251 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SukIV-0004yo-PI for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 09:09:39 -0400
Date: Fri, 27 Jul 2012 09:09:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAAQYJAvVkEcV=Bjfwp7JZWeXcrss6vUC3Amts5GGzdUrRBWwEw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207270902140.15041@oneiric>
References: <alpine.DEB.2.02.1207261904590.18831@oneiric>
	<1343388304.9574.118.camel@ted>
	<alpine.DEB.2.02.1207270801210.14507@oneiric>
	<CAAQYJAvVkEcV=Bjfwp7JZWeXcrss6vUC3Amts5GGzdUrRBWwEw@mail.gmail.com>
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
Subject: Re: image.bbclass: Update outdated reference to "export IMAGE_BASENAME"
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
X-List-Received-Date: Fri, 27 Jul 2012 13:21:10 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1523863891-1343394571=:15041"

--8323329-1523863891-1343394571=:15041
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 27 Jul 2012, Andrea Adami wrote:

> By the way,
>
> we have followed pedissequally and re-introduced 'export IMAGE_BASENAME' =
[1] when we adapted our
> initramfs image for oe-core,=A0 even though we had built whitout until th=
en, both in oe-classic and in
> oe-core.
>
> Regards
>
> Andrea
>
> [1] http://cgit.openembedded.org/meta-handheld/commit/?id=3D3021e1fc38006=
7666a63fa5b2bdfc5fd16282973

  i think i'll just leave this for someone else higher up the food
chain to deal with if they think it's worth it.

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323329-1523863891-1343394571=:15041--
