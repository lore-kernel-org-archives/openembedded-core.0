Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 18FA67841F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 23:44:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3xzVSS4Spsz1qvNk;
	Sat, 23 Sep 2017 01:44:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3xzVSS1bdVz1qqkD;
	Sat, 23 Sep 2017 01:44:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id B-E3m-3jf1aC; Sat, 23 Sep 2017 01:44:22 +0200 (CEST)
X-Auth-Info: p34BEHjTWs8itxlQ+G6M6tuz0HdQ9VqKsTExPS6q5t0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat, 23 Sep 2017 01:44:22 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
	<1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com>
	<20170918083915.GB3340@jama>
	<51b6874b-551a-3983-4002-77e166822521@balister.org>
	<CAP9ODKpiSEJqR47RnjV+EFBeo7gd3wEtAR398Pwn8HjCj93TEA@mail.gmail.com>
	<CAJTo0LbFHX_Wm_W2MteS=6XbJgqzZh-jtGZ_Bhu95kO8Nue+dw@mail.gmail.com>
	<20170918160610.GD17137@bill-the-cat>
	<a512c6ac-65d6-e105-8ce7-a2a387084dbe@denx.de>
	<500e4bce-840a-cd83-ef77-015ea622cbbe@balister.org>
	<ae60416c-a413-97d6-0702-f068304c1b28@denx.de>
	<20170922233650.GA3670@jama>
From: Marek Vasut <marex@denx.de>
Message-ID: <73e2804f-e9d3-ec0d-f8b9-73f5fe352be2@denx.de>
Date: Sat, 23 Sep 2017 01:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922233650.GA3670@jama>
Cc: Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Fri, 22 Sep 2017 23:44:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/23/2017 01:36 AM, Martin Jansa wrote:
> On Sat, Sep 23, 2017 at 12:19:27AM +0200, Marek Vasut wrote:
>> Agreed. So what is the conclusion here about this , are we updating to
>> 2017.09 or not ?
> 
> It was already merged couple days ago:
> http://git.openembedded.org/openembedded-core/commit/?id=340d413f678a4a64dfa060e8fe0ac721b73fed97
> 
> and the follow-up fix for u-boot-fw-utils as well:
> http://git.openembedded.org/openembedded-core/commit/?id=73afabf8e69019f08b424a06f3eafaab052b0606
> 
Super, thanks.

-- 
Best regards,
Marek Vasut

