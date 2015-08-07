Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AE3B976756
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 12:07:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Aug 2015 05:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,629,1432623600"; d="scan'208";a="744102282"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 07 Aug 2015 05:07:30 -0700
Message-ID: <55C49FC9.2070905@linux.intel.com>
Date: Fri, 07 Aug 2015 15:08:41 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<955430345ec10c6c1dda34e2b2c9f64e75d50f38.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143500.GI2457@jama> <55BA4B90.2040000@linux.intel.com>
	<6F5BF671-CD99-4721-A089-29A0AAA6323C@gmail.com>
In-Reply-To: <6F5BF671-CD99-4721-A089-29A0AAA6323C@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 14/26] puzzles: switch svn for git, as upstream has done the same
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
X-List-Received-Date: Fri, 07 Aug 2015 12:07:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2015 10:19 AM, Khem Raj wrote:

>>> Doesn't PV go backwards with this?
>>
>> Yes; Ross should make a suggestion of how to avoid that, and fix the upstream check at the same time - for this recipe and others where I tweak the PV in a similar manner.
>
>
> define PE

Ross said he would like to avoid that; I hope he'll make a comment after 
coming back from holiday.


Alex


