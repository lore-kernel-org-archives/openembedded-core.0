Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 859E37259F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 16:43:42 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so13804697pab.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 08:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=2ckzicgwcFV06+ni8tcGgmRpT9qYMGT4wtlO9bX/CQg=;
	b=dla2ekHnjERC1K3angehjrsIfoD5N5/wMnl6R+XH/sXswxfigxMomY6yksI27+hIDe
	c9joXrZTqSTY9XhbM408FeBLfq2bNmRhOBd+HsW5850TuveymDZfejciomhgpv+witPQ
	Nh1lMPVB3n0Vsl+qL40ygmYDUK7ZEgy1KDESqi80BEvnRGZIOokRJDe0DEL/9nRUHc6r
	kbvX5dL12EzKr6NDgv1GSuCDWu9jpqx2qV1ITa6d6p5wNT5Zrm3kX7X3xRqJOp16HOtN
	n6w12KkZfzCyp+XnrwAaPS1XIth+U6Skel0k1yanJ2mwQSHXezVhUKjahRuBfQK5V290
	xfpQ==
X-Received: by 10.68.220.39 with SMTP id pt7mr61175381pbc.37.1418748222168;
	Tue, 16 Dec 2014 08:43:42 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:447d:2ae8:83db:988?
	([2601:9:3580:84c:447d:2ae8:83db:988])
	by mx.google.com with ESMTPSA id w14sm1492799pas.14.2014.12.16.08.43.41
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Dec 2014 08:43:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <549060BC.7040209@gmail.com>
Date: Tue, 16 Dec 2014 08:43:40 -0800
Message-Id: <6C5CEC9C-1355-4DD9-AA23-D188D420A275@gmail.com>
References: <549060BC.7040209@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Mailer: Apple Mail (2.1993)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Request for Dizzy patches for 1.7.1
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
X-List-Received-Date: Tue, 16 Dec 2014 16:43:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 16, 2014, at 8:41 AM, akuster808 <akuster808@gmail.com> wrote:
>=20
> Hello all,
>=20
> I am collection patches for the up coming 1.7.1 release. Please let me =
know which patches should be in 1.7.1 by including "[Dizzy]" in the =
subject line.


Please consider,

http://patchwork.openembedded.org/patch/84905/

It is needed both in master and dizzy

>=20
> kind regards,
> Armin
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


