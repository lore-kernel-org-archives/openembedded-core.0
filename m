Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>)
	id 1RtJgO-0001CD-PW; Fri, 03 Feb 2012 15:00:09 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 245D24B016F;
	Fri,  3 Feb 2012 14:52:07 +0100 (CET)
Date: Fri, 3 Feb 2012 14:52:06 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120203145206.10e943eb@eb-e6520>
In-Reply-To: <20120203114451.GF3893@jama.jama.net>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
	<20120104090523.066ae2d7@eb-e6520>
	<CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
	<20120202084000.GD3697@jama.jama.net>
	<20120202091726.GG3697@jama.jama.net>
	<20120202111127.0b9d886a@eb-e6520>
	<20120203072808.GB3893@jama.jama.net>
	<20120203094104.GE3893@jama.jama.net>
	<20120203112037.314f9004@eb-e6520>
	<20120203114451.GF3893@jama.jama.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] SDK confusion Was: [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Fri, 03 Feb 2012 14:00:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Fri, 3 Feb 2012 12:44:51 +0100,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :
> I also don't really understand using oecore-x86_64-x86_64 when building
> for qemuarm
>=20
I may be totally wrong but isn't that what is expected : building a gdb
which will run on the SDK_ARCH (ie x86_64 in my case), so isn't python
expected to run on the x86_64 and target x86_64 (and not arm) ?

Eric
--=20
http://eukrea.com/en/news/104-2012


