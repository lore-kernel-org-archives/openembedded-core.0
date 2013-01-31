Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U0tIa-00037s-7E
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 13:31:25 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id BFF3877CDB0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 13:10:30 +0100 (CET)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 11A23A6133;
	Thu, 31 Jan 2013 13:10:23 +0100 (CET)
Date: Thu, 31 Jan 2013 13:10:21 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130131131021.6d5ffccd@e6520eb>
In-Reply-To: <alpine.DEB.2.02.1301310531510.22001@oneiric>
References: <alpine.DEB.2.02.1301310531510.22001@oneiric>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: BB_SRCREV_POLICY doesn't seem to work
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
X-List-Received-Date: Thu, 31 Jan 2013 12:31:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Robert,

Le Thu, 31 Jan 2013 05:37:59 -0500 (EST),
"Robert P. J. Day" <rpjday@crashcourse.ca> a =C3=A9crit :
>   ok, what have i done wrong?  i thought the whole point of
> BB_SRCREV_POLICY was to make the above possible.
>=20
no idea if that the solution but did you do a cleansstate and removed
the initaly downloaded sources to fetch again the sources ?

Eric


