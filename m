Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <bjst@sestofb10.enea.se>) id 1TgCGZ-0005mJ-PB
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 11:31:52 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Wed, 5 Dec 2012
	11:17:23 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 6B0432917AD;
	Wed,  5 Dec 2012 11:17:23 +0100 (CET)
Date: Wed, 5 Dec 2012 11:17:23 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121205101723.GK25784@sestofb10.enea.se>
References: <1353600120-22967-1-git-send-email-bjst@enea.com>
	<1353600120-22967-2-git-send-email-bjst@enea.com>
	<1353707361.21863.4.camel@ted>
	<20121129155210.GC25784@sestofb10.enea.se>
	<1354639762.25268.54.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1354639762.25268.54.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] Add a new distro feature "ptest".
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
X-List-Received-Date: Wed, 05 Dec 2012 10:31:52 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> So I think my proposal stands, lets put the pieces from bitbake.conf
> into a bbclass file for now, the other pieces can merge into the core
> code.

Fair enough. I'll get a new patch set together.

--=20
Bj=F6rn


