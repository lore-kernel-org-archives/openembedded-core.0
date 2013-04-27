Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1UW93E-0006O5-IN; Sat, 27 Apr 2013 19:36:52 +0200
Received: by mail-pa0-f53.google.com with SMTP id kx1so92131pab.26
	for <multiple recipients>; Sat, 27 Apr 2013 10:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=bvAvk+CnC3sLuLotQO6ShBXAliPe9bWpeYxjaBDQhBw=;
	b=bbnnJnjeOwXOhGUl2AJCYP4lYBHUKpoP7/shNvp1cY08oQucI+GRZfmyLHQnJT1Ud+
	mE3/j09FdJWaOhnU7OX46FzERQ8yxeYiu3otB77iMe5X1tvp8TTrenx93W9D7q3xMvRY
	5Y2zSQa+E1MMGGrB8d6azv+qkp7+WjVeW04nxvXZDG2cgreTXKAmyASp0qavlOEeoPml
	yLrheXT4ZgkgWZRuf2ak7Q5szd6g6HIFZUhaNANJXgCdW8Mp8Kg5D473no5TASerQ/hr
	cwUWiAGEYB8kZmV7ls4rBf3sTkAgx9iTSrgCL2akPJaMpiWlw9Q1bmN5yllzAiz4tG6P
	7IyA==
X-Received: by 10.66.191.135 with SMTP id gy7mr41869803pac.45.1367083137234;
	Sat, 27 Apr 2013 10:18:57 -0700 (PDT)
Received: from sa-nc-common-173.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id b7sm16589043pba.39.2013.04.27.10.18.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 10:18:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1505854.4Uj52mcVBD@helios>
Date: Sat, 27 Apr 2013 10:18:53 -0700
Message-Id: <924E0E65-7A58-4F98-84F0-0A04BC9F2C23@gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <1505854.4Uj52mcVBD@helios>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Sat, 27 Apr 2013 17:37:11 -0000
X-List-Received-Date: Sat, 27 Apr 2013 17:37:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 27, 2013, at 4:23 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Saturday 27 April 2013 12:54:00 Martin Jansa wrote:
>> common (8):
>>  I'll send patches moving qcanobserver, gcalctool, media-ctl, xbmc to
>> nonworking=20
>=20
> If we have this number of recipes failing, I think we need to do more =
than=20
> just move them to nonworking. Could we perhaps try to have an =
organised effort=20
> to fix up these broken recipes? I'll be happy to help out.
>=20

something like recipe build fix weekend blitz

> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



