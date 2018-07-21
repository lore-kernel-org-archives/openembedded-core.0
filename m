Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id CDC1B78AB4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 10:32:26 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 0DA86167A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 12:32:27 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20180721092402.20271-1-dv@pseudoterminal.org>
	<20180721093256.13840.69653@do.openembedded.org>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <63db33e9-3e3a-02dc-39f1-95a5f1e20b7e@pseudoterminal.org>
Date: Sat, 21 Jul 2018 12:32:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180721093256.13840.69653@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjRdIGdzdHJlYW1lcjEuMC1wbHVnaW4tYmFzZTouLi4iIGFuZCA1IG1vcmU=?=
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
X-List-Received-Date: Sat, 21 Jul 2018 10:32:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Can anyone explain? I verified that these patches apply, and they do. I 
can apply them on top of ff0b682b80 without any problems.

Is this perhaps related to the German umlaut problem the 6th patch 
addresses?


On 2018-07-21 11:32, Patchwork wrote:
> == Series Details ==
>
> Series: "[v4] gstreamer1.0-plugin-base:..." and 5 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/13140/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at ff0b682b80)
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>


