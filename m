Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+oufKtbuiHyJihbHcsY8rs4VUMyM+EEx8=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjWJl-0000ny-PU
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 14:56:02 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6KCptV7030923
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 07:51:55 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1311165818.30326.67.camel@phil-desktop>
Date: Wed, 20 Jul 2011 07:51:55 -0500
Message-Id: <202EE89F-DBDC-444E-B95F-01DD7DC36201@kernel.crashing.org>
References: <611DBEB9-A901-4A01-AEB0-EAC2724FBED1@kernel.crashing.org>
	<1311165818.30326.67.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: lzo build failure
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
X-List-Received-Date: Wed, 20 Jul 2011 12:56:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 20, 2011, at 7:43 AM, Phil Blundell wrote:

> On Wed, 2011-07-20 at 07:31 -0500, Kumar Gala wrote:
>> I'm trying to build lzo for a powerpc64 target and I'm getting:
>>=20
>> configure:=20
>> configure: Your compiler failed the ACC conformance test - for =
details see=20
>> configure: `config.log'. Please check that log file and consider =
sending
>> configure: a patch or bug-report to <markus@oberhumer.com>.
>> configure: Thanks for your support.
>> configure:=20
>> configure: error: ACC conformance test failed. Stop.
>=20
> Did you check config.log as it suggests?  If yes, what did you find
> there?
>=20
> p.

Here's what config.log looks like:

http://pastebin.com/y9KzkQ5M

Can't see anything obvious in there.

- k=


