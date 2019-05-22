Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3853F7C7A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 11:45:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4589my6G2Hz60;
	Wed, 22 May 2019 13:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558525539;
	bh=rULlgOZ23YqpDX6GimHF0CbaKYk1hzaQHp37E/R0kOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVVt3WppmKpQ3UfU1T8SAtflyqBK5CGL5ek2OJ0QKXpjdMg2NjRpl/4B24HWxjKmI
	1qrIMDrgSqfyPlQinzvibArlxg/R+P5VlpkuQp0sKWGWnq/aJp/mSUufjMeEyC0x/X
	6uy5PTJsIcS9ilVGblRIZQ47EDBSFunpljXcoWc6Jr7Cj18yYWmnjUyIbiJ0Yj9QPw
	FiH1DXpRRIyuY9KwdO9kP48kRzEiuQ/8ix5SkHLKLeRXXCb5hZl5+BFT57lOpNVi2k
	F5bkM9lSzPjdQRyEqI00Qb/bueP3uq3ixS2H9qopX1daXn9ZgyOkb21F5wkfBioftE
	UMMqXTtwWWGMI0LT3lL14f0XqwKrb44W7fMWwsIdATrVqNfrM+Ek2mQ3a/tZ+r6+Hq
	UILiJBSW0lgBPmC+S157OnuBiL/MAEyboESIMHDSH3MSZ7w2G0CR+75DOiEBVAEN0T
	PhssvNTW/gWjqlioGsrPouapexpw3ThB+O1L/+t3eEgRt3ljGzQ+wLVxwc0W4IboPI
	Z4rYbNso1taT/lYoBzA0KM+MrJ1rMDLErsK8lwzWSZ2UDj0jYw5anyukv4g5rvXMEJ
	FS34LjUnej77jyIC1p3fvuOgVA0sjjZ+RuIl977Q1VF6hDB71DVl59FmRMFIbGEVCK
	5mA+dVYGBUczNNxWVTbg8ha0=
Date: Wed, 22 May 2019 14:45:33 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190522114533.GA28781@localhost>
References: <20190522105847.6512-1-bunk@stusta.de>
	<CANNYZj-W+yN+28kSPUiMvoF_U6H80iDPhVLpYaKfH6RW+aLnmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-W+yN+28kSPUiMvoF_U6H80iDPhVLpYaKfH6RW+aLnmA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt: Remove workaround patches for no longer supported host distributions
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
X-List-Received-Date: Wed, 22 May 2019 11:45:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 22, 2019 at 01:04:59PM +0200, Alexander Kanavin wrote:
> Our apt version is badly out of date; would you be able to work on an update?
>...

Not the kind of change I am keen to do on a recipe I don't use in OE.

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


