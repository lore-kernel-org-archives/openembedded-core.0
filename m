Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CCC9D72491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 09:24:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3U9OBn7025483
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Apr 2015 02:24:11 -0700 (PDT)
Received: from [128.224.162.142] (128.224.162.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 30 Apr 2015 02:24:11 -0700
Message-ID: <5541F4B9.4080201@windriver.com>
Date: Thu, 30 Apr 2015 17:24:09 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1430297966-25315-1-git-send-email-rongqing.li@windriver.com>
	<1430380974.19130.51.camel@linuxfoundation.org>
In-Reply-To: <1430380974.19130.51.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: upgrade to 9.10.2
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
X-List-Received-Date: Thu, 30 Apr 2015 09:24:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年04月30日 16:02, Richard Purdie wrote:
>> 4. update the dont-test-on-host.patch
>> >5. update the Copyright file checksum, since the date in it has been changed.
>> >
>> >Signed-off-by: Roy Li<rongqing.li@windriver.com>
> If you apply this patch, then run "bitbake dhcp" it fails. This is what
> it did last time it was submitted too.
>
> Cheers,
>
> Richard
>
>


I can not reproduce it on Ubuntu and Fedora release 21, for x86. mips


-- 
Best Reagrds,
Roy | RongQing Li

