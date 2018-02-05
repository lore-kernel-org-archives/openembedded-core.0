Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 587E478436
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 04:25:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w154PeBb006757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Feb 2018 20:25:40 -0800 (PST)
Received: from localhost.localdomain (128.224.163.240) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 4 Feb 2018 20:25:37 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1517798422.git.liezhi.yang@windriver.com>
	<20180205030303.15542.28722@do.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <f9681e2e-d798-4300-a889-0b8780cf99f3@windriver.com>
Date: Mon, 5 Feb 2018 12:25:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180205030303.15542.28722@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFBhY2thZ2VzIHVwZ3JhZGU=?=
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
X-List-Received-Date: Mon, 05 Feb 2018 04:25:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/pu
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (4):
   ccache: 3.3.4 -> 3.3.5
   nfs-utils: 2.1.1 -> 2.3.1
   git: 2.15.0 -> 2.16.1
   time: 1.7 -> 1.8

commit message updated:
============
     time: 1.7 -> 1.8

     * Remove debian.patch which is already in the source.
     * License-Update: The license is changed to GPLv3, will add the v2 one to 
meta-gplv2.

============
     ccache: 3.3.4 -> 3.3.5

     License-Update: Year updated, the contents are the same.


// Robert


On 02/05/2018 11:03 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: Packages upgrade
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/10841/
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
> * Issue             LIC_FILES_CHKSUM changed on target ccache but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned]
>    Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
>    Current checksum file://LICENSE.txt;md5=7fe21f9470f2305e95e7d8a632255079
>    New checksum     file://LICENSE.txt;md5=dae379a85bb6e9d594773e0aa64876f6
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
> 

