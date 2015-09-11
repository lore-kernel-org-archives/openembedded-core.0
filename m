Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8D573CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 07:13:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 11 Sep 2015 00:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,510,1437462000"; d="scan'208";a="642787332"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 11 Sep 2015 00:13:38 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 511896A4087; Fri, 11 Sep 2015 00:12:46 -0700 (PDT)
Received: from 10.252.58.194
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 11 Sep 2015 10:12:46 +0300 (EEST)
Message-ID: <62691.10.252.58.194.1441955566.squirrel@linux.intel.com>
In-Reply-To: <CAJTo0LYCw9pFKn+jkT_a-O8h4r48CCjK2DZDe5oJUsuSuKvGQA@mail.gmail.com>
References: <1441909087-3860-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAJTo0LYCw9pFKn+jkT_a-O8h4r48CCjK2DZDe5oJUsuSuKvGQA@mail.gmail.com>
Date: Fri, 11 Sep 2015 10:12:46 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Burton, Ross" <ross.burton@intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: add a new recipe for latest upstream version
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
X-List-Received-Date: Fri, 11 Sep 2015 07:13:39 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> On 10 September 2015 at 19:18, Alexander Kanavin <
> alexander.kanavin@linux.intel.com> wrote:
>
>> +Upstream-status: Backport [should appear in 2.10,
>> http://trac.webkit.org/changeset/184856]
>>
>
> Capital S in Status, and missing a signed-off-by (your name in the patch
> header doesn't count).  I've made these changes locally, don't bother
> sending a revised edition.

Wait a moment, why do we need a second signed-off-by there? The commit
that adds the custom patch already has my signed-off-by, so it is
redundant to repeat it I think.

Alex

