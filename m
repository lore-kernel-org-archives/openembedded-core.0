Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD6B65CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 00:16:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9S0GWq8024928
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Oct 2014 17:16:32 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 27 Oct 2014 17:16:31 -0700
Message-ID: <544EE062.5050306@windriver.com>
Date: Tue, 28 Oct 2014 08:16:34 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1414128766-13586-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LabeHw9JreZLyVuyjkANL38yf8A3NXXmTHLDLZZAWyeCg@mail.gmail.com>
In-Reply-To: <CAJTo0LabeHw9JreZLyVuyjkANL38yf8A3NXXmTHLDLZZAWyeCg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nfs-utils: debianize start-statd
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
X-List-Received-Date: Tue, 28 Oct 2014 00:16:35 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/27/2014 07:15 PM, Burton, Ross wrote:
>
> On 24 October 2014 06:32, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>       .../files/nfs-utils-debianize-start-statd.patch    | 39
>     ++++++++++++++++++++++
>
>
> ERROR: Command Error: exit status: 1  Output:
> Applying patch nfs-utils-debianize-start-statd.patch
> patching file utils/statd/start-statd
> Hunk #1 FAILED at 4.
> 1 out of 1 hunk FAILED -- rejects in file utils/statd/start-statd
> Patch nfs-utils-debianize-start-statd.patch does not apply (enforce with -f)
>
> Please rebase this, there's been changes in master.
>
> Ross


This patch should follow "[OE-core] [PATCH v2] nfs-utils: fix start-statd"

-Roy
-- 
Best Reagrds,
Roy | RongQing Li

