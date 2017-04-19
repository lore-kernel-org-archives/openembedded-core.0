Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id EBB3371CB4;
	Wed, 19 Apr 2017 23:13:27 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id a1so33492672uaf.3;
	Wed, 19 Apr 2017 16:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YpiR9b73hd3dbCkcGl3KFednpaEvabayRVhiyeSdUf4=;
	b=oeYBK76h0vayGu6UxrMTCNl1oK6HerFikD6K4HvTNakTZbB6GuLh4YT0LC6+CD0FLB
	b9RY438FmiEVPox3uNOwDNllewgpy/LDfm1j8VwgC5+0ym3fPwu1Y+5qC1OsDnL6ZNgG
	G329gpUqiC1eWTMh3mgTRC04dxMSEhwgVHsXMoOGaQe+0+a35S+lfCrh8eZr7dvJuZ7l
	Pvka8r2+8Af6ec+UlZYGzAS3KezrjQbK5+UA49ZKDn4b+FdslrprOqzG2Hy/lNciDmkC
	8skkBNqobkLsfWGbjzYcJ8peBUALD9g2xWe/0qmYXVnvs7AkpCMy9FGG3isxwsnHu7uk
	KsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YpiR9b73hd3dbCkcGl3KFednpaEvabayRVhiyeSdUf4=;
	b=oGBeZ8mVqF+EIDShKwtYYKZ/d+ZsDGwiXdhbeMRAmkiB84MtbljKkLfpO/MLfYOZ0P
	xTtdyp7Wif8mh0JDrlO389rc1zrgEhjJFgvphFhSRmjLOenBQpz/NweQ4Vpf3gAeQugN
	GVS2/EMKC+dOqSYrQ4m1m1isGhmt9JNb6eXQtNEBAKh6X4+Ftdj/jfk9p9NGlEUVYdSn
	kqxAiMMCCtJ8yHsIL+jgVcLsH1DelPrP/4MbINIPN0IAZXgTGK9lBBfPhyoutvRHoGup
	mFRir+MxdjYDLLYwqHXpL7YlZmVsWkAuFp4YcapeB620VL8YiJeRm8Chg7c0gOsnsdqY
	/LfA==
X-Gm-Message-State: AN3rC/5cDh7l16rDiIU+dMsnSIH+Ts0KcLARU+4vrCgMgCPdsBg2/FP+
	iyPT/hq81q8JpWJafz3JuJrZvuvi/g==
X-Received: by 10.31.155.72 with SMTP id d69mr1735003vke.160.1492643608951;
	Wed, 19 Apr 2017 16:13:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.30.70 with HTTP; Wed, 19 Apr 2017 16:13:28 -0700 (PDT)
In-Reply-To: <CAHUNapT9rRVGv7d=EoxaR_Zkuf+kBxeohpB_z4ryu1DbFn8Kww@mail.gmail.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CA+YB3raLVTqo7m9XRe4S8spJh7Cm7cp+EwU78PpQbSPUW8676g@mail.gmail.com>
	<CAHUNapT9rRVGv7d=EoxaR_Zkuf+kBxeohpB_z4ryu1DbFn8Kww@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 19 Apr 2017 19:13:28 -0400
Message-ID: <CAHUNapSOAdSHtj_+O4JsR0hMumEEQHsJbU7Mwwz0P6yu3B2rfQ@mail.gmail.com>
To: Sean Hudson <sean_hudson@mentor.com>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Wed, 19 Apr 2017 23:13:28 -0000
Content-Type: text/plain; charset=UTF-8

Are there no toll-free numbers that could be used, or at least more
options for local area codes?

