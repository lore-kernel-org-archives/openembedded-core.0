Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id C49186C72D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 18:06:31 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id w10so20331169pde.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2013 10:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Ejvl+vUbQUNdhyfNnBvEfo87T2eWdz+V+5H9ZVCCTDI=;
	b=bNPSv8rp6C95PmvKGeWQk2qgeY+QvgHKfaKY9CMSy2SFPpWbC2/bZrcTsNcRt+ydh2
	bus26uvqWB0suEmVI/RkdLGTnA7Jdn6LeVRYdeL4IKVaPsM017+EW3dDMnCP/twHTSkX
	l1VERQKlMRc3rH1mEobr2sq2Gk1mgY3xIEXcexItKdjxeaEU9K5KWEntMYW+olBhBcTg
	+Qtu2VVvOEhHrWHNOHpGdD0SAZnmVzS92Dw8mHrAgBHa/7t/iSF+pd8G2QeZhxGsAGQj
	Qeg9knjYiAeWhnjx+l9sdBJ5L+7Hzk/8jF/2tgkAMzQBy+Qj7tjlCPHXDAETqyONVmQw
	ujyA==
X-Received: by 10.66.132.69 with SMTP id os5mr55644088pab.114.1386093990981;
	Tue, 03 Dec 2013 10:06:30 -0800 (PST)
Received: from [172.29.15.53] ([66.129.239.14])
	by mx.google.com with ESMTPSA id
	gg10sm131565500pbc.46.2013.12.03.10.06.29 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Dec 2013 10:06:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20131203165509.GC11291@mail.zedat.fu-berlin.de>
Date: Tue, 3 Dec 2013 10:06:27 -0800
Message-Id: <6BE177CC-97DA-4726-AC48-448234A8CBC4@gmail.com>
References: <20131203160858.GB11291@mail.zedat.fu-berlin.de>
	<529E0A3D.50809@balister.org>
	<20131203165509.GC11291@mail.zedat.fu-berlin.de>
To: Henning Heinold <heinold@inf.fu-berlin.de>
X-Mailer: Apple Mail (2.1822)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Status for "Sponsored by" git tags
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
X-List-Received-Date: Tue, 03 Dec 2013 18:06:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Dec 3, 2013, at 8:55 AM, Henning Heinold <heinold@inf.fu-berlin.de> =
wrote:

> On Tue, Dec 03, 2013 at 11:43:41AM -0500, Philip Balister wrote:
>> On 12/03/2013 11:08 AM, Henning Heinold wrote:
>>> Hi,
>>>=20
>>> how is the status about using "Sponsored by" git tags. Do we want =
something
>>> like that in openemebdded or not?
>>=20
>> What are SPonsored by tags?
>>=20
>> Philip
>>=20
>=20
> Hi Philip,
>=20
> Sponsored By tags are used by freebsd and some other projects to show =
which company
> sponsored the commit.
>=20
> For example
>=20
> =
https://github.com/freebsd/freebsd-head/commit/da88cadfb7e76ffa35440f16fef=
51a03935b7775
>=20

FreeBSD does not have signed-off-by and so on and use subversion so =
don=92t have git commit -s and so on :)
if you want to credit someone then mention it in the commit log should =
be enough IMO


> Bye Henning
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


