Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D6B946FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 07:38:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAT7cqvW023814
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Nov 2016 23:38:53 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 28 Nov 2016 23:38:52 -0800
To: "Burton, Ross" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<20161117065519.7693.7868@do.openembedded.org>
	<CAJTo0LYTbP3h5T+YEMiESUCwq0YM6QXtj5+_nr0ZWMH1Z3mhNQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <bdecee11-e5f5-d34d-fb09-f247dfb460d6@windriver.com>
Date: Tue, 29 Nov 2016 15:38:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYTbP3h5T+YEMiESUCwq0YM6QXtj5+_nr0ZWMH1Z3mhNQ@mail.gmail.com>
Cc: "Lock, Joshua G" <joshua.g.lock@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEZpeGVzIGZvciBlU0RLIGFuZCB0ZXN0c2RrZXh0?=
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
X-List-Received-Date: Tue, 29 Nov 2016 07:38:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/2016 05:02 PM, Burton, Ross wrote:
>
> On 17 November 2016 at 06:55, Patchwork <patchwork@patchwork.openembedded.org
> <mailto:patchwork@patchwork.openembedded.org>> wrote:
>
>     * Patch            [7/8] oeqa/sdkext/devtool.py: skip
>     test_extend_autotools_recipe_creation when no libxml2
>       Issue            Commit shortlog is too long [test_shortlog_length]
>       Suggested fix    Edit shortlog so that it is 80 characters or less
>     (currently 82 characters)
>
>
> I'm not sure we've ever been super-strict on this, so I'm wondering if warning
> over 90 is sensible so that we allow an extra two characters when function names
> are long but still detect when someone has put an essay in the first line (which
> does happen if the submitter isn't aware of the git convention).

Ping, do I have to make the subject line shorter and resend the patches, please ?

// Robert

>
> Ross
>
>

