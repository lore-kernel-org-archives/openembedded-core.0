Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C92D174CAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 02:27:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8J2RLKn025194
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Sep 2018 19:27:31 -0700
Received: from [128.224.162.207] (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Sep 2018 19:27:10 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180918090009.69835-1-zhixiong.chi@windriver.com>
	<CAJTo0LY66itRz8dbR_JS-8COmPvK7obA+PV3Po8q2GvmOARDAw@mail.gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <92e305c9-fa8b-80f7-6e25-0c5ad156694d@windriver.com>
Date: Wed, 19 Sep 2018 10:27:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY66itRz8dbR_JS-8COmPvK7obA+PV3Po8q2GvmOARDAw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: gdbserver: update ctrl-c handling
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
X-List-Received-Date: Wed, 19 Sep 2018 02:27:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年09月18日 18:10, Burton, Ross wrote:
> On Tue, 18 Sep 2018 at 10:01, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:
>> ++Upstream-Status: Pending
>> ++cherry-picked patch from https://sourceware.org/bugzilla/show_bug.cgi?id=18945
> Sounds like the status should be:
>
> Upstream-Status: Submitted
> [https://sourceware.org/bugzilla/show_bug.cgi?id=18945]
Thanks for your reminder, I will send the V2.

Zhixiong.
>
> Ross
>
> Ross

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


