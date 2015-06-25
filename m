Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80782601E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 02:24:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5P2O81p029908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Jun 2015 19:24:08 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Jun 2015 19:24:07 -0700
Message-ID: <558B6646.2050809@windriver.com>
Date: Thu, 25 Jun 2015 10:24:06 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
	<bf978a7894f51c909ede7f64c28b6da5495d981a.1435135356.git.liezhi.yang@windriver.com>
	<CAJTo0LZBzMKzzswgtsk0o3uohK+03a4kPB0niwhvyYqxpQBhYg@mail.gmail.com>
In-Reply-To: <CAJTo0LZBzMKzzswgtsk0o3uohK+03a4kPB0niwhvyYqxpQBhYg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] file: 5.22 -> 5.23
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
X-List-Received-Date: Thu, 25 Jun 2015 02:24:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/24/2015 07:56 PM, Burton, Ross wrote:
>
> On 24 June 2015 at 09:55, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Updated 0001-Add-P-prompt-into-Usage-info.patch.
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>
>
> Currently this fails to fetch:
>
> WARNING: Failed to fetch URL ftp://ftp.astron.com/pub/file/file-5.23.tar.gz,
> attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command failed with exit code 6, output:
> Login incorrect.
>
> Hopefully this is a transient failure but is this still the best source location?

It works now, I think that it should be a transient failure. And I think that
it is still the best source location since it is suggested by the homepage.

// Robert

>
> Ross

