Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 32C67780A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 13:12:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 14 Jul 2017 06:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="878898120"
Received: from unknown (HELO [10.219.128.129]) ([10.219.128.129])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2017 06:12:00 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20170713174821.20071-1-ross.burton@intel.com>
	<20170713183822.2381.55793@do.openembedded.org>
	<CAHiDW_FjapMrVu=URNJNo4T0K+99XByZSeVGK743WdMFpLSOuA@mail.gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <01e393aa-f547-c6a2-7e9c-a93ee8ce24bb@linux.intel.com>
Date: Fri, 14 Jul 2017 08:12:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAHiDW_FjapMrVu=URNJNo4T0K+99XByZSeVGK743WdMFpLSOuA@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpYmdjcnlwdDogZml4IENWRS0yMDE3LTk1MjYgKHJldjIp?=
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
X-List-Received-Date: Fri, 14 Jul 2017 13:12:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/14/2017 02:57 AM, Jussi Kukkonen wrote:
> On 13 July 2017 at 21:38, Patchwork
> <patchwork@patchwork.openembedded.org
> <mailto:patchwork@patchwork.openembedded.org>> wrote:
>
>     == Series Details ==
>
>     Series: libgcrypt: fix CVE-2017-9526 (rev2)
>     Revision: 2
>
>
> Not sure if this should be a patchwork bug or not? This patch is
> showing up as a revision 2 of the other patch when in reality they are
> patches for two separate branches.
>
>  - Jussi

There is a request to handle older release patch submissions in
Patchwork (bug 10716) planned to be completed in 2.5, however, I may be
able to implement the change in the following days.

Jose

>
>  
>
>     URL   : https://patchwork.openembedded.org/series/7732/
>     <https://patchwork.openembedded.org/series/7732/>
>     State : failure
>
>     == Summary ==
>
>
>     Thank you for submitting this patch series to OpenEmbedded Core.
>     This is
>     an automated response. Several tests have been executed on the
>     proposed
>     series by patchtest resulting in the following failures:
>
>
>
>     * Patch            [pyro] libgcrypt: fix CVE-2017-9526
>      Issue             Missing or incorrectly formatted CVE tag in
>     commit message [test_cve_presence_in_commit_message]
>       Suggested fix    Include a "CVE-xxxx-xxxx" tag in the commit message
>
>
>
>     If you believe any of these test results are incorrect, please
>     reply to the
>     mailing list (openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>) raising your
>     concerns.
>     Otherwise we would appreciate you correcting the issues and
>     submitting a new
>     version of the patchset if applicable. Please ensure you
>     add/increment the
>     version number when sending the new version (i.e. [PATCH] ->
>     [PATCH v2] ->
>     [PATCH v3] -> ...).
>
>     ---
>     Test framework:
>     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>     <http://git.yoctoproject.org/cgit/cgit.cgi/patchtest>
>     Test suite:   
>      http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>     <http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe>
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>

-- 
Jose Lamego | OTC Embedded Platform & Tools | GDC


