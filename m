Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C27A9605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 07:59:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6R7xcDl016142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Jul 2015 00:59:38 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 27 Jul 2015 00:59:24 -0700
Message-ID: <55B5E4E9.1020908@windriver.com>
Date: Mon, 27 Jul 2015 15:59:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1437100265.git.liezhi.yang@windriver.com>
	<35900b5a9fe27b838b4a43cd89c44ca28a498092.1437100265.git.liezhi.yang@windriver.com>
	<CAJTo0LayRxLaPx10x8u_cz2Qx1x5=mTz7ECJrYmNc8fLPZFDUw@mail.gmail.com>
In-Reply-To: <CAJTo0LayRxLaPx10x8u_cz2Qx1x5=mTz7ECJrYmNc8fLPZFDUw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] file: 5.23 -> 5.24
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
X-List-Received-Date: Mon, 27 Jul 2015 07:59:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/21/2015 07:05 PM, Burton, Ross wrote:
>
> On 17 July 2015 at 03:31, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     * Use git repo rather than tarball, rename file_5.23.bb
>     <http://file_5.23.bb> -> file_git.bb <http://file_git.bb>
>
>
> Why?

Hi Ross,

The old SRC_URI ftp://ftp.astron.com/pub/file/ is down again atm,
it is not stable as you met the same problems several days ago,
I think that use git hub's repo is better.

I will add more comments and resend the patch.

// Robert

>
> Ross

