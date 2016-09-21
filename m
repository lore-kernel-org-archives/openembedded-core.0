Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 001D2600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:47:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8L9lBDf004991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Sep 2016 02:47:11 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 21 Sep 2016 02:47:10 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1474436335-8086-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LboMqEDWqXse_7ViPZjo+v4q3eXaf9H6r2u5XEMEEXUpw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57E25606.7010806@windriver.com>
Date: Wed, 21 Sep 2016 17:42:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LboMqEDWqXse_7ViPZjo+v4q3eXaf9H6r2u5XEMEEXUpw@mail.gmail.com>
X-Originating-IP: [128.224.163.140]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] perl: fix CVE-2016-6185
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
X-List-Received-Date: Wed, 21 Sep 2016 09:47:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年09月21日 17:21, Burton, Ross wrote:
>
> On 21 September 2016 at 06:38, <mingli.yu@windriver.com
> <mailto:mingli.yu@windriver.com>> wrote:
>
>     From: Mingli Yu <Mingli.Yu@windriver.com
>     <mailto:Mingli.Yu@windriver.com>>
>
>     Backport patch to fix CVE-2016-6185 from perl upstream:
>     http://perl5.git.perl.org/perl.git/commitdiff/08e3451d7
>     <http://perl5.git.perl.org/perl.git/commitdiff/08e3451d7>
>
>     Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com
>     <mailto:Mingli.Yu@windriver.com>>
>
>
> Can you please add CVE: tags to the patches alongside the
> upstream-status and s-o-b, so that the automated CVE tooling can work?

Will resend the v2 patch to add CVE tags.

Thanks,
Mingli

>
> Ross

