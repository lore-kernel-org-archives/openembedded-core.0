Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4C9157CFB6;
	Mon, 13 May 2019 07:46:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 452Xv35H83z5m;
	Mon, 13 May 2019 09:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557733584;
	bh=G1eGJjq6vqiinOukb9+sUXYSyaGPdmqHpTNTJAEIPog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I0XeD4dWuRNyvdZ1UsRxycCTitWYS+7TwsCxsi5y025a1Yf0RNYTrktDzlo+8i2j4
	w+GOyRPWN9zqWb5ruq6rwl/P8R67t7iPvf/aMGdEGS1bHMYFnAakd2PWziojkZp9Hw
	ehFhYM9AuHyNtKYepvfOWBYT0dOijJtby1k6jv1T6x5NRh6U8cjekoMOmE6dUnn1MY
	M8YAWppW/DtzKO3nKOcfG6sDHboyQmOpAc9Rv8XSK+VON5gggORDbq5mTP3WB7Zok5
	eQ5RH3GLphfxuo/LOXFZi/vQqA6BjDA6DXQ6vdFxBN92tGQ+le66EOADRBR028sDr6
	TKHwdRmCnyokEiKJzT0PKezImbinDK9qQclPvkMv0cTytzRDzZezgkJrZ1Ts5XpIJf
	d4zVHaUZn5+Avwa2u3bbpkMM7DpRD2pgGmeSVnNOPP4Td5TogepuJm/De7dYql/m67
	5pl9T97hIH+J2/sJjbpTWEeOSo3k+GNoFhTZQJGE/YYEwceeIW4bSMP4a5hTc8jikg
	QXJPdybNXlwbcrE9iWNxjqHGCk7H8c21/QIkeyxZk4akYomyWTNGOflYd26uvvpZMC
	6kkCHKFMVH/opXRnokBqHFJewQb3jnoaRUN65ECQbHfekaAq2/9L/hAdW9jPBS9DuR
	o+tk48eQcW58xQpvdjNB1nsA=
Date: Mon, 13 May 2019 10:46:20 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20190513074620.GA14282@localhost>
References: <e86cf937-5734-fc36-cd94-fad9b0155059@gmail.com>
	<65432636-c595-ed39-28f3-efb7a0d565da@gmail.com>
	<bf12fd00-e786-25dc-4b10-056ce5adffb4@windriver.com>
MIME-Version: 1.0
In-Reply-To: <bf12fd00-e786-25dc-4b10-056ce5adffb4@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] patchwork
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
X-List-Received-Date: Mon, 13 May 2019 07:46:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 13, 2019 at 10:32:48AM +0300, Mark Hatle wrote:
> On 5/12/19 9:04 PM, akuster808 wrote:
> > ok, so no Admins. This is unexceptionable.
> > 
> > OE TSC and Board, I believe its your time to get involved.
> 
> I've not used patchwork before, do you know who originally configured it?  Was
> it Paul Eggleton, or Richard, or?  If I have an idea who was originally
> responsible, I'm pretty sure we can figure out a handoff plan to someone else.

http://git.yoctoproject.org/cgit/cgit.cgi/patchwork/

> --Mark

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


