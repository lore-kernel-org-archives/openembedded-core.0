Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UJpN1-0006yU-Ku
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Mar 2013 19:10:17 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 47EE5CA8C6A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2013 18:53:19 +0100 (CET)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id C3291A624D;
	Sun, 24 Mar 2013 18:52:32 +0100 (CET)
Date: Sun, 24 Mar 2013 18:52:31 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: John Weber <rjohnweber@gmail.com>
Message-ID: <20130324185231.4ed1f60b@e6520eb>
In-Reply-To: <514F2FED.70603@gmail.com>
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
	<1364070660-13157-2-git-send-email-otavio@ossystems.com.br>
	<20130324160139.12fbb4d7@e6520eb>
	<CAP9ODKoRemde2dC+emOkvu=UG927k3suOZE-Yzdppjp_LG3NeQ@mail.gmail.com>
	<514F2FED.70603@gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] linux-firmware: Do not deploy license files in packages
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
X-List-Received-Date: Sun, 24 Mar 2013 18:10:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Sun, 24 Mar 2013 11:55:09 -0500,
John Weber <rjohnweber@gmail.com> a =C3=A9crit :

> Showing my ignorance here, but is a manifest created with all of the pack=
aged=20
> licenses?  Is it possible for the developer to ship that if they see fit?
>=20
> I think what Otavio was trying to do was to keep /lib/firmware from being=
=20
> cluttered with license files.  At least, that is the benefit as I see it.
>=20
I see the benefit, I was just giving a reason why the initial recipe
writer may have wanted to include the license files in the packages
together with the binaries of the firmwares.

Eric


