Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 25F3776659
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:09:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2016 08:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="888857615"
Received: from unknown (HELO [10.219.16.227]) ([10.219.16.227])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2016 08:09:29 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org,
	"Belal, Awais" <Awais_Belal@mentor.com>
References: <1446210513-16152-1-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD280119A934F7@EU-MBX-02.mgc.mentorg.com>
	<56A63611.8050505@linux.intel.com>
	<1453735152.25948.14.camel@linuxfoundation.org>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <56A648DF.4020800@linux.intel.com>
Date: Mon, 25 Jan 2016 10:10:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453735152.25948.14.camel@linuxfoundation.org>
Subject: Re: [RFC][PATCH] python: ensure usage of host modules while cross compiling
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
X-List-Received-Date: Mon, 25 Jan 2016 16:09:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2016 09:19 AM, Richard Purdie wrote:
> On Mon, 2016-01-25 at 08:49 -0600, Alejandro Hernandez wrote:
>> Ping
>>
>> This has been here for a while now, if it doesnt apply let me know
>> and I
>> will rebase this, this fixes bug 8671.
> Wasn't this fixed by:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a1fa8d9ac53625737aab29b4e5e1687fc01bdfc2
>
> ?
My bad, I hadn't seen this patch, thanks!

> Cheers,
>
> Richard
>


