Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id DAD446007B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 11:52:19 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8CA38A62CD;
	Mon, 23 Sep 2013 13:52:13 +0200 (CEST)
Date: Mon, 23 Sep 2013 13:52:12 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: David =?ISO-8859-1?B?TnlzdHL2bQ==?= <david.nystrom@enea.com>
Message-ID: <20130923135212.1c735b41@e6520eb>
In-Reply-To: <5240285B.3050308@enea.com>
References: <524006B4.6080209@communistcode.co.uk>
	<CAJTo0LYvrg5Cj7jUf-6z09NdC+Si_Q68hB_ahHEGBHqaqVToRw@mail.gmail.com>
	<5240285B.3050308@enea.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: elfutils patch failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2013 11:52:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Mon, 23 Sep 2013 13:39:07 +0200,
David Nystr=F6m <david.nystrom@enea.com> a =E9crit :

> +1, saw this error as well.
> And an additional patch failure for libtool-native.
>=20
not sure if that helps, but I also had patch errors (on other recipes)
when a recipe which was already built is updated and gets rebuilt : a
clean solved the problem.

Eric

