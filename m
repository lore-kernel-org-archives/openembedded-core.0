Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 20E4D6D2D3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 20:03:16 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id q10so2599199pdj.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 12:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=rM+Lx7fVsNj4lockp9us2aJ0z8ey0QhIoAK0S8UuZ8w=;
	b=rYjxORpZVusZNhywdfnA6PQF5Dt8fYrC/TyuVGKsyddqc1qO/hTU9FySjSQq2zTRUS
	Nz58pCBt7kX6qQiU3NfqkDdrouaCFjQG4anmflkJkWM9H3xrqXP6x5xki4dNQ/gyCaBp
	k8sAKOMQY1J2MmNjKXlrMfROqEMmTNcqYBKonM9y6k5f86NWVq/OCRlc+ReI65lGi7XZ
	QfYRgrP1U2OW9UOAMm2IQx/N7ibzPYKi3OuU1oiWZTReMY6XF9lq8+4knc2anXRZBqr8
	mLN3ViRnyVrSP9rXKACz/oDEJG5o16iJYWx2IIDpwxilluKwmRmjS1o/Lcd14ze4TVav
	JqoA==
X-Received: by 10.68.197.36 with SMTP id ir4mr16803159pbc.96.1383940997904;
	Fri, 08 Nov 2013 12:03:17 -0800 (PST)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	vk17sm16405495pab.5.2013.11.08.12.03.16 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Nov 2013 12:03:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <527D3FA5.5020100@mlbassoc.com>
Date: Fri, 8 Nov 2013 12:03:14 -0800
Message-Id: <AC56E440-0604-437B-B3FF-F4FE6D4FBFDF@gmail.com>
References: <527D3FA5.5020100@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.1822)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Qt bugs?
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
X-List-Received-Date: Fri, 08 Nov 2013 20:03:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Nov 8, 2013, at 11:46 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> I'm pretty sure that Qt4 is just a package used to test OE-core =
(Yocto)
> capabilities, so I'm wondering where to send bug reports?  Just
> trying the Qt4e demo exposes tons of problems=85

Report upstream to QT thats probably your best place to get response
but if there are build/packaging issues then they belong here.

>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


