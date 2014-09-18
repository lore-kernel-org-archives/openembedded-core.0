Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id AD53560030
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:16:07 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hzCGH4M4fz3hjX4;
	Thu, 18 Sep 2014 11:16:07 +0200 (CEST)
X-Auth-Info: ihNzrDx/b1EyxYGIkmGTOVJtyGaOgJpEOrADl5lvTPI=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3hzCGH15s3zvhTZ; 
	Thu, 18 Sep 2014 11:16:07 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Laszlo Papp <lpapp@kde.org>
Date: Thu, 18 Sep 2014 11:16:07 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<201408112026.32235.marex@denx.de>
	<CAOMwXhNBq9F45HSQj0QuXoxRe_50_9x_F42=yWe22H2_BcPV1Q@mail.gmail.com>
In-Reply-To: <CAOMwXhNBq9F45HSQj0QuXoxRe_50_9x_F42=yWe22H2_BcPV1Q@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201409181116.07918.marex@denx.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Thu, 18 Sep 2014 09:16:08 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, September 18, 2014 at 11:11:45 AM, Laszlo Papp wrote:
> Come on, Yocto maintainers, please...
> 
> Mark sent this change relatively long ago, and it is still in "new"
> state, sadly. The current SDK shipped _breaks_ any third-party
> software that uses standard python with regards to the libraries and
> all that.
> 
> This is is slightly frustrating. We also face the same issue. :(

Thanks for the reminder, new version which should fix the issues with the 
previous one is on the ML now. You're all on CC.

Best regards,
Marek Vasut

