Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 362907ED03
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 11:33:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46jvC61j23z2C;
	Wed,  2 Oct 2019 13:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570015986;
	bh=PPfdGXJirrYBsi6QaEbIAitEROygTpLVcyLSxpDrMWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNqx3ruQP6+Bjehoci4emCtzhXwEbmJAxDp9wDrtMVVrv/Ip/kMBsNtBEkswgaIjT
	MRX1T3o17pSrP73jW/DgqC11bibizjXlRRkb+g2wVO7JJjW2rsXBCGzqhM7dX4mOC8
	3eS/a1KWmqrr1YJ+hGkbWj6pgIomlDV2SBpDR+eAPbanz6yPZ9RoEwZBkWaaF2Wqyj
	/FsXg0+ZTOd/vVKpXFaupmqN5YnWrnJJF9K6yAEmK71TiBae1eYPWTnkLz8ZO0Qu0r
	nb0yuHc+mGYTwh77qLJqrvh3Wkpb9tJ7e5Q3Nyos6rXvBOeQG3PGx0hkBvUYxmu2vP
	MSFqBrdQNV5awXqnAA4U8JNuZK/zE+OgdbBihQllA0ZNS8cvBLNw3kTWI/QaCINSet
	u4Qa76r8wfcJouDZtBV1l3HsVu5mu1fLFYhGl4hCHVM8dUEsWliFkKd4xG+/lkJk1o
	EsA2awQtV9BuFi8bt7EZUmDBKHAF/bsB0dVhLt2qL8z8WYIze9rbNFQMKF4rxNTmbM
	HKgzE9EducfZHWH87VCBmGRE7w+po4oMcxJdXnWJ0havEq1l+LPIBRDzS39uQzaG32
	Ag31CZokCJ4+m0hjzyDuHRV4+zAJ7TqrNLWbzZJaqdv0GfpzAu4mDnC51mA9FYyNN1
	9/FybMGGHumq3oZq0APlz6yQ=
Date: Wed, 2 Oct 2019 14:33:04 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191002113304.GA19058@localhost>
References: <20191001195817.22650-1-bunk@stusta.de>
	<1274cea8-3bc4-77d2-b413-08f50c646616@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1274cea8-3bc4-77d2-b413-08f50c646616@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH] python: update to 3.7.3
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
X-List-Received-Date: Wed, 02 Oct 2019 11:33:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 01, 2019 at 04:10:54PM -0700, akuster808 wrote:
> On 10/1/19 12:58 PM, Adrian Bunk wrote:
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > License-update: copyright years
> is this a bugfix only? its not mentioned.

Yes, this is a maintenance release on the 3.7 branch.

> - armin
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


