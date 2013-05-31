Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 172B96041D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 06:55:57 +0000 (UTC)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 36CE0A623B;
	Fri, 31 May 2013 08:55:51 +0200 (CEST)
Date: Fri, 31 May 2013 08:55:50 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130531085550.5b725c7d@e6520eb>
In-Reply-To: <51A844B7.9020201@linux.intel.com>
References: <1369946430-12959-1-git-send-email-eric@eukrea.com>
	<1369946430-12959-2-git-send-email-eric@eukrea.com>
	<51A844B7.9020201@linux.intel.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.18; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] gtk-icon-cache pixbufcache: add a clear dependency on gdk-pixbuf-native
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
X-List-Received-Date: Fri, 31 May 2013 06:55:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Fri, 31 May 2013 15:35:35 +0900,
Saul Wold <sgw@linux.intel.com> a =C3=A9crit :

> On 05/31/2013 05:40 AM, Eric B=C3=A9nard wrote:
> > not really sure if the dependency is always inherited but at least
> > there won't be bad surprise.
> >
> This seems to have caused a circular dependency, not sure the exact=20
> nature, please verify this.
>=20
> There might have been a patch from someone else recently, so please=20
> check the latest master.
>=20
ok please forget this one it will need more testing if it's required at
all

Eric

