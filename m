Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3FBC7F30C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 09:28:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x839RnSB014564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2019 02:27:59 -0700
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 3 Sep 2019 02:27:38 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1566545188-273512-1-git-send-email-zhe.he@windriver.com>
	<bb110de5-6c32-f845-1915-ad815adfcce2@windriver.com>
	<e1231c6d-05a3-ee79-c494-a8634d25d51b@intel.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <edc0dcd0-58bd-eea9-0a1c-1b71745a656b@windriver.com>
Date: Tue, 3 Sep 2019 17:27:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e1231c6d-05a3-ee79-c494-a8634d25d51b@intel.com>
X-Originating-IP: [128.224.162.221]
Subject: Re: [PATCH] ltp: syscalls: rt_sigwaitinfo01: Fix failure for MIPS arches
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
X-List-Received-Date: Tue, 03 Sep 2019 09:28:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/3/19 5:16 PM, Ross Burton wrote:
> On 03/09/2019 08:55, He Zhe wrote:
>> Kindly ping.
>
> This doesn't apply to current master, can you please rebase?

Oops, v2 is sent.

Thanks,
Zhe

>
> Ross
>


