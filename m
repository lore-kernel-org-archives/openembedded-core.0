Received: from mail-qa0-f50.google.com ([209.85.216.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UHK4N-000372-Lh
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Mar 2013 21:20:46 +0100
Received: by mail-qa0-f50.google.com with SMTP id dx4so1269640qab.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2013 13:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Qh7a2eFKZ8DWtEXQSudRLLkmDGaqMLv3QFd5iqhx6Nc=;
	b=KEuM8DhrUKRa645w66DqnQvSFgcQ4Iep2hGZemiqXrYW7tsOaGLyhRVkQgYKPovBZF
	HE1srCc+fMn5g3t1C0SXMMaigNeH4UZadvlLEBpdvBTzJaWlka1WuhJIX+xHBkmLvdeT
	GaoHJPEXlnoBgJbCVRA3c7vEoA9Ys2D/eMhtBIHlyzJ+hycAgwh3/sskXBwLmUuHOa8V
	Bz4hbkFSWMBX/8xB890b9Z9zYE4vrDb0bf5+dsyJFiFb+dqvsb0eXB6/SW9wIX4R7eG0
	nPUbA/H/vKycf7qjMBZQgdcSOPhyhyr7sKQY3QHIrJ/vKEiQ9ugfDH9w9rj8t0Yzczso
	HPgw==
X-Received: by 10.224.116.139 with SMTP id m11mr16403822qaq.32.1363550632424; 
	Sun, 17 Mar 2013 13:03:52 -0700 (PDT)
Received: from velamuri-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id o6sm25246944qek.3.2013.03.17.13.03.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Mar 2013 13:03:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1363511802.6710.16.camel@ted>
Date: Sun, 17 Mar 2013 13:03:50 -0700
Message-Id: <C861DFA0-E819-440A-AE15-2FD51F5B8BA1@gmail.com>
References: <1363377280-14797-1-git-send-email-sgw@linux.intel.com>
	<FC0195A5-8F7D-4750-95F6-53CEACBDEB31@gmail.com>
	<1363511802.6710.16.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Update License Information (remove GPLv3 Licnese)
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
X-List-Received-Date: Sun, 17 Mar 2013 20:20:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 17, 2013, at 2:16 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2013-03-16 at 22:03 -0700, Khem Raj wrote:
>> On Mar 15, 2013, at 12:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>=20
>>> The upstream authors have updated the licenses of a couple =
subcomponents,
>>> these were GPLv3, but updated to be either GPLv2 or LGPLv2.1 =
accordingly.
>>> These changes make the util-linux package become completely =
non-GPLv3.
>>=20
>> Is it possible to demote license from V3 to V2 like that  I wonder
>=20
> The maintainer sought out approval from the copyright holders so yes.
> The more people who've changed the files in question, the harder it
> becomes.

OK that makes sense.

>=20
> Cheers,
>=20
> Richard
>=20



