Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BA4D27198A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:06:22 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 12 Jan 2017 06:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,349,1477983600"; d="scan'208";a="212558601"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jan 2017 06:06:21 -0800
To: openembedded-core@lists.openembedded.org
References: <1484167889-3198-1-git-send-email-anibal.limon@linux.intel.com>
	<1484211839.7594.16.camel@andred.net>
	<a2754fb6-0fda-fb36-eb3e-7f9ae50fd8b2@linux.intel.com>
	<1484229650.7594.26.camel@andred.net>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b391d833-f6fd-13d6-209e-03c3cf406248@linux.intel.com>
Date: Thu, 12 Jan 2017 16:06:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1484229650.7594.26.camel@andred.net>
Subject: Re: [PATCH] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Thu, 12 Jan 2017 14:06:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/12/2017 04:00 PM, André Draszik wrote:
> On Thu, 2017-01-12 at 15:47 +0200, Alexander Kanavin wrote:
>> On 01/12/2017 11:03 AM, André Draszik wrote:
>>
>>> The patch 0001-target-mips-add-24KEc-CPU-definition.patch should also be
>>> removed, as it's been merged.
>>
>> Why is it applying without error?
>
> Because the context doesn't change (at all), only line numbers.

So the patch is incorrectly being applied in the wrong location?

Alex


