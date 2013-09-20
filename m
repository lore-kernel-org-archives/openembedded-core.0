Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id DF2FD60EE1;
	Fri, 20 Sep 2013 04:11:50 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id q10so9146964pdj.7
	for <multiple recipients>; Thu, 19 Sep 2013 21:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=TUj71AfOEN6kDBeugM7xwssebwCreR7Dznaba4zlhAg=;
	b=NMJ85nLSpFAS3OJr79WsmJetYHr+LvzOhGPeIHW37ChbRJ9fHCHvAdYfeJalV4Mc1s
	DGNOF1uGajaIbpp9LsqJtONKSWLifpU+HY7ViPYEtX/ka02kGia3JWrKIVxSlBO8exJD
	2nigdCTqHCxZnYiCfwvpbJfwDu/XtOhdZ0a3u1gK3tWzh5MOp2QgsnMAFQCOIUYXYp0/
	GhAjieJK9r7kj4hvpEEDsAePxrVBy4IzFrGGkp5oALYVFAlR4DDmL1lhZUA3qOk/wqOd
	PfPjGlp2Ruqf1T6YIxuFsyNOGDDNUown/dScXdthBfBEuRz2dIklNYjOED8vfSFbt+nl
	mNeA==
X-Received: by 10.66.141.39 with SMTP id rl7mr6584938pab.46.1379650312567;
	Thu, 19 Sep 2013 21:11:52 -0700 (PDT)
Received: from [192.168.0.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPSA id yo2sm15951287pab.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 21:11:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130919120202.GK7313@jama>
Date: Thu, 19 Sep 2013 21:11:50 -0700
Message-Id: <19D9595C-FE9E-4E24-B249-D32F62F25EA2@gmail.com>
References: <CAMKF1sonakYiB++QeeeXKVztx+7CKW3zn=ndn=kP+kSVmqu3Qw@mail.gmail.com>
	<20130919120202.GK7313@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1510)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: patchwork updated
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
X-List-Received-Date: Fri, 20 Sep 2013 04:11:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 19, 2013, at 5:02 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Sun, Sep 15, 2013 at 12:32:44AM -0700, Khem Raj wrote:
>> Hi All,
>>=20
>> The patchwork has been updated to latest. Please keep an eye if you
>> see something non working let me know immediately.
>=20
> Hi,
>=20
> something is wrong,
>=20
> http://patchwork.openembedded.org/user/bundles/
>=20
> returns 502 Bad Gateway for me and I cannot access individual bundles,
> which is very bad, because all oe-devel patches are separated into
> bundles based on layer.

OK. I have created a local fix for it and also started a discussion on =
patchwork ml
bundles should be visible now. Let me know if there are further issues.

>=20
> Regards,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


