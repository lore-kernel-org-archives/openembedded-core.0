Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1STMyb-0008Mu-HU
	for openembedded-core@lists.openembedded.org;
	Sun, 13 May 2012 02:47:57 +0200
Received: by obhx4 with SMTP id x4so5893230obh.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 17:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=fEI5IMKFWTpMAVIpzSUpNAeS+vqGtYUqCJqYWhkYy+I=;
	b=Ss15hs04ljqiCa5VFCDRvEGoIh1Aq69QKZmXy2Hp6rPrshcpuRcYqY8yQzVVVJ9eRJ
	FdiXpn/MtwrP38iQPwE3zD002VkoiwAkJ9ShE4Dlf+k5U35vBkI3kpY8UVNQO5PNNdIt
	r1ZxN3bqADiO9fpTs5iVNapSW3S4snUZ/IRL/mL0/PFSWjNua1FfOTHD77TmG4IMyWtH
	H23Qnn0fnjRva3E/WlHs309IECp/JMmqN42ub8jx/76tCvhffn1HCNzsYPum0rcrqWKO
	UoHTnWj8shE/RA7frhoaD4Ksia2224Ma0Q1hHH0KA2zOvKDJso3lzOpIkTGZQ46zfG/n
	1s1A==
MIME-Version: 1.0
Received: by 10.50.94.234 with SMTP id df10mr1610220igb.31.1336869479618; Sat,
	12 May 2012 17:37:59 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Sat, 12 May 2012 17:37:59 -0700 (PDT)
In-Reply-To: <CAF6bG8dX21Q44Zq05Wtih7T1jCGcEtEj5o9NrD5TPtorOk=DnA@mail.gmail.com>
References: <CAF6bG8dwwV-WymFvuZ9FXLb3wziR0mj9PfzP4qA31i79r_81wg@mail.gmail.com>
	<4FAD45F2.9030908@linux.intel.com>
	<CAF6bG8e18hOJBGUwwgyetuxwViXfMOS5tYOj06sSghaam+nV9A@mail.gmail.com>
	<CAF6bG8dX21Q44Zq05Wtih7T1jCGcEtEj5o9NrD5TPtorOk=DnA@mail.gmail.com>
Date: Sun, 13 May 2012 03:37:59 +0300
Message-ID: <CAF6bG8dv+YKDxFX5y-tH8ZqsynCYQ67+pTQ7oiR=dBHUHN0N=A@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: update to upstream version 1.16.3
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
X-List-Received-Date: Sun, 13 May 2012 00:47:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12 May 2012 04:57, Marko Lindqvist <cazfi74@gmail.com> wrote:
>
> =C2=A0I'm not entirely sure if problems I'm seeing in image building are
> caused by bugs in new dpkg, or bugs that dpkg update just uncovers in
> packaged components.

 Problem is in dpkg. I'll run some more tests on new version before
sending updated patch (away most of tomorrow, so probably Monday)


 - ML


