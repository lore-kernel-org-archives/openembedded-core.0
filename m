Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id F2EDB606E0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 17:02:22 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id rl12so9710341iec.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 10:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=SVMvw5IIFFT1FoqWwoYVl1bME0Xwq2X2Fcc52S7ApVk=;
	b=VIYRhnA8MdVrx43L3RAFJAt7jOY3zNRjlaPW2eqy67Rc234Ka1LBCZEXIrnbPI2hLJ
	O8IRxQebMtTKVcCApRY9wpaUtvldiyfcr3/JXrWsW2VEia76Fkc6GQELgYcVU4aMcfnM
	gTxSHGre4y4fzyyfNY/BqWDwCcxsenyspFwJoNLuOXXnG1U/2L0Kw1I2uvPmPQkn2zAB
	itP3/tjLRPnYWYV9c6CZnKlt51oxvksi9NSYl7g6Fl8Lu+I2tUsoQuvAmrQMGNk/MYgU
	d/Xjq4akzWFthOHFN2nhX3hGKrOAEOG2CH2iPs/9cwyxB66k6flCjTGrInuJulPmRfFP
	IUDA==
X-Received: by 10.51.17.5 with SMTP id ga5mr34282226igd.2.1399395742415; Tue,
	06 May 2014 10:02:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 10:01:52 -0700 (PDT)
In-Reply-To: <536899F5.1030104@gmail.com>
References: <536899F5.1030104@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2014 10:01:52 -0700
Message-ID: <CAMKF1sroWHnXGjAZ0qX48+H3DC--q6SefHZT6zUj3WpOPz3Z=g@mail.gmail.com>
To: =?UTF-8?Q?Bj=C3=B6rn_Krombholz?= <pirobk@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Tue, 06 May 2014 17:02:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2014 at 1:14 AM, Bj=C3=B6rn Krombholz <pirobk@gmail.com> wro=
te:
> Comparing the build with a toolchain created on Jul 30th 2013 (which work=
s fine) I see one major difference:

what is the delta between the working and non working OE-Core repo

