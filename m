Return-Path: <valentin.popa@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3E17965EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 12:29:03 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2014 05:28:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,887,1392192000"; d="scan'208";a="435512056"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2014 05:28:39 -0700
Message-ID: <537DED5F.7020701@intel.com>
Date: Thu, 22 May 2014 15:28:15 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1400690725.git.valentin.popa@intel.com>
	<5d0d1d68d7277dbb1546e7d30be552149d5d02a4.1400690725.git.valentin.popa@intel.com>
	<CAJTo0LZpg3V_knK-YsQA07F7eKTPc6RA2M+-NDQS74Ra=L2TBg@mail.gmail.com>
In-Reply-To: <CAJTo0LZpg3V_knK-YsQA07F7eKTPc6RA2M+-NDQS74Ra=L2TBg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] eglinfo: patched to compile with mesa10+
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
X-List-Received-Date: Thu, 22 May 2014 12:29:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2014 11:22 PM, Burton, Ross wrote:
> On 21 May 2014 17:50, Valentin Popa <valentin.popa@intel.com> wrote:
>> +Upstream-Status: Pending
> Pending here means "pending decision on whether it's
> upstreamable/inappropriate", in this case it would be Submitted (with
> that URL as the context).
>
> Ross
I wasn't submitted upstream. There was a bug filed, fixed today. I'll 
remove the patch entirely.

