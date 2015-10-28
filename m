Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60DBC755F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 10:54:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 28 Oct 2015 03:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,209,1444719600"; d="scan'208";a="821337366"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2015 03:54:33 -0700
Message-ID: <5630A999.1030605@linux.intel.com>
Date: Wed, 28 Oct 2015 12:55:21 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1446009435.git.kai.kang@windriver.com>	<484dd4883f19d258e29e343f1b0735d2940d7424.1446009435.git.kai.kang@windriver.com>	<CAHiDW_EvNU3w7gKaz1N_=ZZU+wfGkf696i78TZf3-PZbGaRTrg@mail.gmail.com>
	<56309F82.203@windriver.com>
In-Reply-To: <56309F82.203@windriver.com>
Subject: Re: [PATCH 1/1] libxml2: fix unsafe memory access
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
X-List-Received-Date: Wed, 28 Oct 2015 10:54:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/2015 12:12 PM, Kang Kai wrote:
>> This may be a nitpick but I don't think DV has taken this patch in the
>> six months it's been available so it's not a backport.
>
> I suppose Backport is the best choice in upstream status [ Pending
> Submitted Accepted Backport Denied Inappropriate ]. Though it is not
> from official upstream, it is from somewhere else as listed in the patch.

'Submitted [where]' is the right choice here, I think.


Alex

