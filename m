Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E782C75A2C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 00:44:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O0iPoJ016111
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Jun 2015 17:44:25 -0700 (PDT)
Received: from [128.224.162.138] (128.224.162.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Jun 2015 17:44:25 -0700
Message-ID: <5589FD67.60703@windriver.com>
Date: Wed, 24 Jun 2015 08:44:23 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Kang Kai <Kai.Kang@windriver.com>
References: <1434595386-11377-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZPX-hrN_rQ=pwWRJ4T1zYRzcTs77j=2iP7rw427njHSg@mail.gmail.com>
In-Reply-To: <CAJTo0LZPX-hrN_rQ=pwWRJ4T1zYRzcTs77j=2iP7rw427njHSg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: upgrade to 1.0.2c
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
X-List-Received-Date: Wed, 24 Jun 2015 00:44:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年06月24日 00:31, Burton, Ross wrote:
>
> On 18 June 2015 at 03:43, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     upgrade to fix the CVE: CVE-2015-1788..CVE-2015-1792 and CVE-2014-8176
>     remove a backport patch
>     update the c_rehash-compat.patch
>
>
> This doesn't apply to master since some more patches were added, can one
> of you please rebase and re-submit?
>
> Cheers,
> Ross

OK


-- 
Best Reagrds,
Roy | RongQing Li

