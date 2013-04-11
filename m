Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UQDr8-0006wr-HV
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 11:31:47 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 11 Apr 2013 11:14:23 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 1D75E2800C6;
	Thu, 11 Apr 2013 11:14:23 +0200 (CEST)
Date: Thu, 11 Apr 2013 11:14:23 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Saul Wold <sgw@linux.intel.com>, 'Patches and discussions about the
	oe-core layer' <openembedded-core@lists.openembedded.org>
Message-ID: <20130411091422.GJ24646@sestofb10.enea.se>
References: <51650A7F.2020904@linux.intel.com>
	<20130410132711.GI24646@sestofb10.enea.se>
MIME-Version: 1.0
In-Reply-To: <20130410132711.GI24646@sestofb10.enea.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: Re: ptest results
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
X-List-Received-Date: Thu, 11 Apr 2013 09:31:49 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Bj=F6rn Stenberg wrote:
> Your paste contains some errors that are clearly recipe/framework issues:

I forgot to say that I think we should separate between issues with the pte=
st framework (bbclass changes) and issues with specific package test suites=
.

In my view it is critical that we get the framework fixes into 1.4 so that =
this release can be used as a basis for wider ptest development, while impr=
ovements for specific test suites are less critical and can wait if necessa=
ry.

--=20
Bj=F6rn


